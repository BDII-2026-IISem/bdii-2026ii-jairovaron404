from django.db import DatabaseError, connection
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from drf_spectacular.utils import extend_schema, OpenApiParameter, OpenApiTypes


def consultar(sql, parametros=None):
    """Ejecuta una consulta de lectura y devuelve filas como diccionarios."""
    with connection.cursor() as cursor:
        cursor.execute(sql, parametros or [])
        columnas = [columna[0] for columna in cursor.description]
        return [dict(zip(columnas, fila)) for fila in cursor.fetchall()]


@extend_schema(
    tags=["Sistema"],
    summary="Comprobar estado de la API y conexión a la base de datos",
    responses={200: OpenApiTypes.OBJECT, 503: OpenApiTypes.OBJECT},
)
@api_view(["GET"])
def health(request):
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT 1")
            cursor.fetchone()
        return Response({
            "estado": "disponible",
            "base_de_datos": connection.vendor,
            "conexion": "correcta",
        })
    except DatabaseError:
        return Response(
            {
                "estado": "degradado",
                "base_de_datos": connection.vendor,
                "conexion": "fallida",
            },
            status=status.HTTP_503_SERVICE_UNAVAILABLE,
        )


@extend_schema(
    tags=["Envíos"],
    summary="Consultar envíos",
    operation_id="listarEnvios",
    description="Devuelve envíos con paginación y filtro opcional por estado.",
    parameters=[
        OpenApiParameter("limite", OpenApiTypes.INT, description="Máximo de filas (1 a 100)", required=False),
        OpenApiParameter("offset", OpenApiTypes.INT, description="Filas que se omiten", required=False),
        OpenApiParameter("estado", OpenApiTypes.STR, description="Estado exacto del envío", required=False),
    ],
    responses={200: OpenApiTypes.OBJECT, 400: OpenApiTypes.OBJECT, 503: OpenApiTypes.OBJECT},
)
@api_view(["GET"])
def listar_envios(request):
    try:
        limite = int(request.query_params.get("limite", 20))
        offset = int(request.query_params.get("offset", 0))
    except ValueError:
        return Response(
            {"error": "limite y offset deben ser números enteros."},
            status=status.HTTP_400_BAD_REQUEST,
        )

    if not 1 <= limite <= 100 or offset < 0:
        return Response(
            {"error": "limite debe estar entre 1 y 100 y offset no puede ser negativo."},
            status=status.HTTP_400_BAD_REQUEST,
        )

    estado = request.query_params.get("estado")
    sql = """
        SELECT id, empresa_id, mensajero_id, referencia, descripcion,
               estado, prioridad, fecha_solicitud, fecha_entrega
        FROM public.envios
    """
    parametros = []

    if estado:
        sql += " WHERE estado::text = %s"
        parametros.append(estado)

    sql += " ORDER BY id LIMIT %s OFFSET %s"
    parametros.extend([limite, offset])

    try:
        filas = consultar(sql, parametros)
        return Response({
            "total_devuelto": len(filas),
            "limite": limite,
            "offset": offset,
            "resultados": filas,
        })
    except DatabaseError:
        return Response(
            {"error": "No fue posible consultar los envíos en la base de datos configurada."},
            status=status.HTTP_503_SERVICE_UNAVAILABLE,
        )


@extend_schema(
    tags=["Envíos"],
    summary="Consultar un envío por identificador",
    operation_id="detalleEnvio",
    responses={200: OpenApiTypes.OBJECT, 400: OpenApiTypes.OBJECT, 404: OpenApiTypes.OBJECT, 503: OpenApiTypes.OBJECT},
)
@api_view(["GET"])
def detalle_envio(request, envio_id):
    try:
        filas = consultar(
            """
            SELECT id, empresa_id, mensajero_id, referencia, descripcion,
                   estado, prioridad, fecha_solicitud, fecha_entrega
            FROM public.envios
            WHERE id = %s
            """,
            [envio_id],
        )
        if not filas:
            return Response(
                {"error": "No existe un envío con ese identificador."},
                status=status.HTTP_404_NOT_FOUND,
            )
        return Response(filas[0])
    except DatabaseError:
        return Response(
            {"error": "No fue posible consultar el envío en la base de datos configurada."},
            status=status.HTTP_503_SERVICE_UNAVAILABLE,
        )


@extend_schema(
    tags=["Empresas"],
    summary="Consultar empresas",
    description="Devuelve empresas con paginación.",
    parameters=[
        OpenApiParameter("limite", OpenApiTypes.INT, description="Máximo de filas (1 a 100)", required=False),
        OpenApiParameter("offset", OpenApiTypes.INT, description="Filas que se omiten", required=False),
    ],
    responses={200: OpenApiTypes.OBJECT, 400: OpenApiTypes.OBJECT, 503: OpenApiTypes.OBJECT},
)
@api_view(["GET"])
def listar_empresas(request):
    try:
        limite = int(request.query_params.get("limite", 20))
        offset = int(request.query_params.get("offset", 0))
    except ValueError:
        return Response(
            {"error": "limite y offset deben ser números enteros."},
            status=status.HTTP_400_BAD_REQUEST,
        )

    if not 1 <= limite <= 100 or offset < 0:
        return Response(
            {"error": "limite debe estar entre 1 y 100 y offset no puede ser negativo."},
            status=status.HTTP_400_BAD_REQUEST,
        )

    try:
        filas = consultar(
            """
            SELECT id, nit, razon_social, contacto_principal, is_active,
                   created_at, updated_at
            FROM public.empresas
            ORDER BY id
            LIMIT %s OFFSET %s
            """,
            [limite, offset],
        )
        return Response({
            "total_devuelto": len(filas),
            "limite": limite,
            "offset": offset,
            "resultados": filas,
        })
    except DatabaseError:
        return Response(
            {"error": "No fue posible consultar las empresas en la base de datos configurada."},
            status=status.HTTP_503_SERVICE_UNAVAILABLE,
        )
