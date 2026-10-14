<!-- ========================================================= -->
<!--                         HEADER                            -->
<!-- ========================================================= -->

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&height=230&section=header&text=EnlaceExpress&fontSize=58&fontColor=FFFFFF&fontAlignY=38&desc=Multimotor%20Database%20%7C%20Base%20de%20Datos%20II&descAlignY=60&theme=tokyonight&animation=fadeIn" width="100%" alt="EnlaceExpress"/>

<br>

<img src="https://img.shields.io/badge/Proyecto-Académico-7C3AED?style=for-the-badge" alt="Proyecto académico"/>
<img src="https://img.shields.io/badge/Base%20de%20Datos-II-2563EB?style=for-the-badge" alt="Base de Datos II"/>
<img src="https://img.shields.io/badge/Motores-4-0891B2?style=for-the-badge" alt="Cuatro motores"/>
<img src="https://img.shields.io/badge/Backend-Python%20%7C%20Django-092E20?style=for-the-badge&logo=django&logoColor=white" alt="Python y Django"/>

<br>

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=20&duration=3000&pause=1000&color=6366F1&center=true&vCenter=true&width=850&lines=Sistema+de+gestión+de+envíos;Seguimiento+y+facturación;Un+modelo+lógico+en+cuatro+motores;MySQL+%7C+PostgreSQL+%7C+SQL+Server+%7C+Oracle" alt="Descripción animada"/>

<strong>Sistema de gestión de envíos, seguimiento y facturación</strong>

<sub>Proyecto académico de bases de datos multimotor con documentación, evidencias y un backend en desarrollo con Django.</sub>

</div>

---

# EnlaceExpress

## Sobre el proyecto

**EnlaceExpress** es un proyecto académico desarrollado para la asignatura **Base de Datos II** del programa de Ingeniería de Sistemas.

Representa una plataforma para gestionar operaciones de mensajería y distribución, incluyendo empresas, contactos, direcciones, envíos, paquetes, rutas, mensajeros, seguimiento, pruebas de entrega, tarifas, facturación, usuarios, roles y auditoría.

El proyecto implementa un modelo lógico en cuatro motores de bases de datos. Cada implementación requiere adaptar la sintaxis SQL y determinadas características al dialecto de su motor.

> **Estado del proyecto:** la implementación de las bases de datos y su documentación se ha trabajado por etapas. El backend Django se encuentra en construcción y sus funcionalidades deben considerarse implementadas únicamente cuando exista evidencia verificable de su ejecución y pruebas.

<div align="center">

<img src="https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL 8.0"/>
<img src="https://img.shields.io/badge/PostgreSQL-17-316192?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL 17"/>
<img src="https://img.shields.io/badge/SQL%20Server-2022-CC292B?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" alt="SQL Server 2022"/>
<img src="https://img.shields.io/badge/Oracle-XE%2021c-F80000?style=for-the-badge&logo=oracle&logoColor=white" alt="Oracle XE 21c"/>

</div>

---

## Alcance funcional

<table align="center">
<tr>
<td align="center" width="25%">

<strong>Envíos</strong>

Registro, consulta, asignación y control de estados.

</td>
<td align="center" width="25%">

<strong>Seguimiento</strong>

Eventos de tracking y trazabilidad.

</td>
<td align="center" width="25%">

<strong>Entregas</strong>

Gestión de paquetes y pruebas de entrega.

</td>
<td align="center" width="25%">

<strong>Facturación</strong>

Tarifas, facturas y estados de facturación.

</td>
</tr>
<tr>
<td align="center">

<strong>Usuarios</strong>

Usuarios, roles y permisos.

</td>
<td align="center">

<strong>Autenticación</strong>

Gestión de autenticación y sesiones.

</td>
<td align="center">

<strong>Auditoría</strong>

Registro de operaciones relevantes.

</td>
<td align="center">

<strong>Rutas</strong>

Rutas y asignación de mensajeros.

</td>
</tr>
</table>

---

## Arquitectura general

El proyecto separa los scripts de base de datos, la infraestructura, la documentación, las evidencias y el backend.

```text
                         ENLACEEXPRESS
                               |
            +------------------+------------------+
            |                  |                  |
            v                  v                  v
       BASE DE DATOS       BACKEND             DOCUMENTACIÓN
            |             PYTHON/DJANGO             |
            |                  |                    |
            v                  v                    v
     +------+------+      Aplicaciones         Informes,
     |      |      |      y configuración      evidencias
     v      v      v
   MySQL PostgreSQL SQL Server
            |
            v
          Oracle
```

La lógica del dominio se documenta de forma común, mientras que cada motor mantiene sus scripts y particularidades técnicas.

---

## Entorno tecnológico

### Motores implementados

| Motor | Versión de referencia | Esquema |
|:--|:--:|:--|
| MySQL | 8.0 | `enlace_express` |
| PostgreSQL | 17 | `enlace_express` |
| SQL Server | 2022 | `dbo` |
| Oracle Database XE | 21c | `ENLACE_EXPRESS` |

Las versiones indicadas corresponden a las versiones de referencia documentadas en el proyecto. La versión realmente activa debe verificarse en cada entorno.

### Herramientas principales

<div align="center">

<img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker"/>
<img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" alt="Ubuntu"/>
<img src="https://img.shields.io/badge/WSL-4D4D4D?style=for-the-badge&logo=linux&logoColor=white" alt="WSL"/>
<img src="https://img.shields.io/badge/DBeaver-372923?style=for-the-badge&logo=dbeaver&logoColor=white" alt="DBeaver"/>
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
<img src="https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=white" alt="Django"/>
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git"/>
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>

</div>

También se contemplan las herramientas nativas de administración de cada motor, como MySQL Workbench, pgAdmin, SQL Server Management Studio y Oracle SQL Developer.

---

## Modelo de datos

El modelo relacional documentado está compuesto por **18 tablas**:

```text
auditoria
contactos
direcciones
empresas
envios
eventos_tracking
facturas
mensajeros
paquetes
pruebas_entrega
refresh_tokens
resource_roles
resources
role_users
roles
rutas
tarifas
users
```

### Relaciones principales

```text
EMPRESAS
 ├── CONTACTOS
 ├── DIRECCIONES
 ├── ENVIOS
 └── FACTURAS

ENVIOS
 ├── PAQUETES
 ├── EVENTOS_TRACKING
 ├── PRUEBAS_ENTREGA
 ├── RUTAS
 ├── MENSAJEROS
 └── TARIFAS

USERS
 ├── ROLE_USERS ── ROLES ── RESOURCE_ROLES ── RESOURCES
 └── REFRESH_TOKENS

AUDITORIA
```

Para consultar la descripción del dominio, las entidades y las reglas de negocio, véase [DOMINIO.md](docs/DOMINIO.md).

### Diagramas entidad-relación

Los diagramas se organizan por motor dentro de `evidencias/13-diagramas/`. La disponibilidad y el nombre exacto de cada archivo deben comprobarse en el repositorio.

```text
evidencias/
└── 13-diagramas/
    ├── mysql/
    ├── postgresql/
    ├── sql-server/
    └── oracle/
```

---

## Control de acceso

El modelo de autorización se basa en **Role-Based Access Control (RBAC)**, con tablas para usuarios, roles, recursos y la relación entre roles y recursos.

Los seis roles definidos en el modelo son:

- `ADMIN`
- `CLIENTE_EMPRESA`
- `DESPACHO`
- `MENSAJERO`
- `FACTURACION`
- `OPERADOR`

Relación conceptual:

```text
USERS
  |
  v
ROLE_USERS
  |
  v
ROLES
  |
  v
RESOURCE_ROLES
  |
  v
RESOURCES
```

Los recursos representan operaciones del sistema, que pueden asociarse con rutas y métodos HTTP. La definición del modelo de datos no implica por sí sola que la autorización esté integrada y probada en todos los endpoints del backend.

---

## Flujo operativo principal

```text
EMPRESA
   |
   | Solicita un envío
   v
ENVÍO
   |
   v
ASIGNACIÓN DE RUTA Y MENSAJERO
   |
   v
SEGUIMIENTO / TRACKING
   |
   v
PAQUETES Y ENTREGA
   |
   v
PRUEBA DE ENTREGA
   |
   v
FACTURACIÓN
```

### Estados de referencia

**Envíos**

```text
CREADO
  |
  v
ASIGNADO
  |
  v
EN_RECOGIDA
  |
  v
EN_TRANSITO
  |
  v
EN_ENTREGA
  |
  v
ENTREGADO
```

Estados adicionales documentados: `CANCELADO` y `CON_NOVEDAD`.

**Paquetes**

`REGISTRADO`, `EN_TRANSITO`, `ENTREGADO`, `DEVUELTO`, `CON_NOVEDAD`.

**Facturas**

`PENDIENTE`, `EMITIDA`, `PAGADA`, `ANULADA`, `VENCIDA`.

**Prioridades**

`BAJA`, `NORMAL`, `ALTA`, `URGENTE`.

Los estados anteriores representan el vocabulario funcional del modelo. Las transiciones válidas deben contrastarse con las restricciones y reglas efectivamente implementadas.

---

## Infraestructura de bases de datos

Los motores se organizan como servicios independientes. La estructura de referencia es:

```text
services/
└── motores-bd/
    ├── mysql/
    │   └── docker-compose.yml
    ├── postgres/
    │   └── docker-compose.yml
    ├── mssql/
    │   └── docker-compose.yml
    ├── oracle/
    │   └── docker-compose.yml
    ├── start-all.sh
    └── stop-all.sh
```

Antes de ejecutar comandos, comprueba que los nombres y las rutas existan en la versión actual del repositorio.

### Operaciones habituales

Desde WSL/Linux, y ubicándose en la carpeta correspondiente:

```bash
docker compose up -d
docker compose ps
docker compose logs
docker compose down
```

Estos comandos se ejecutan dentro del directorio que contiene el `docker-compose.yml` del servicio que se desea administrar. Los requisitos de memoria, puertos, licencias e imágenes dependen de cada motor.

---

## Scripts y persistencia

Cada motor cuenta con sus propios archivos de definición y carga de datos. La organización de referencia es:

```text
database/
├── mysql/
│   ├── enlace_express_mysql_ddl.sql
│   ├── inserts_mysql.sql
│   ├── datos_enlace_express_mysql.csv
│   └── README.md
├── postgresql/
│   ├── enlace_express_postgresql_ddl.sql
│   ├── inserts_postgresql.sql
│   ├── datos_enlace_express_postgresql.csv
│   └── README.md
├── sql-server/
│   ├── enlace_express_sqlserver_ddl.sql
│   ├── inserts_sqlserver.sql
│   ├── datos_enlace_express_sqlserver.csv
│   └── README.md
└── oracle/
    ├── enlace_express_oracle_ddl.sql
    ├── inserts_oracle.sql
    ├── datos_enlace_express_oracle.csv
    └── README.md
```

Los scripts deben ejecutarse en el motor correspondiente y en el orden descrito por el README de cada carpeta. Antes de volver a cargar datos, revisa si los scripts son idempotentes o si podrían duplicar registros.

---

## Consultas avanzadas

La documentación del proyecto registra un conjunto de **38 consultas avanzadas** para trabajar con los cuatro motores. Incluye técnicas SQL como:

- Filtrado con `WHERE`, `IN`, `BETWEEN` y `LIKE`.
- Ordenamiento con `ORDER BY`.
- Agregaciones con `COUNT`, `SUM` y `AVG`.
- Agrupación con `GROUP BY` y `HAVING`.
- Combinación de tablas con `JOIN`.
- Subconsultas y `EXISTS`.
- Expresiones `CASE` y `COALESCE`.
- Expresiones de tabla comunes (CTE).
- Funciones de ventana como `RANK` y `ROW_NUMBER`.
- Consultas relacionadas con RBAC y combinaciones con `UNION`.

Consulta [CONSULTAS-AVANZADAS.md](docs/CONSULTAS-AVANZADAS.md) para ver el detalle de las consultas. La compatibilidad y los resultados deben verificarse en el motor específico, ya que no todos los dialectos implementan exactamente la misma sintaxis.

Evidencias de referencia:

```text
evidencias/
└── 11-consultas-avanzadas/
    ├── 01-mysql/
    ├── 02-postgresql/
    ├── 03-sql-server/
    └── 04-oracle/
```

---

## Casos de uso

La documentación funcional registra **16 casos de uso**, agrupados en las siguientes áreas:

| Área | Ejemplos |
|:--|:--|
| Usuarios y roles | Gestionar usuarios, roles y recursos |
| Envíos | Registrar y consultar envíos; asignar mensajeros |
| Rutas | Gestionar rutas |
| Seguimiento | Registrar eventos y consultar tracking |
| Entregas | Gestionar paquetes y registrar pruebas de entrega |
| Facturación | Gestionar tarifas y consultar o generar facturas |
| Administración | Consultar auditoría y gestionar autenticación/sesiones |

Consulta [CASOS-DE-USO.md](docs/CASOS-DE-USO.md) para revisar la especificación funcional.

---

## Triggers y auditoría

Los triggers se documentan por motor, con especial atención a la actualización automática de campos como `updated_at` en las tablas que lo requieren.

La documentación y las capturas de evidencia se encuentran en [TRIGGERS.md](docs/TRIGGERS.md), si esa ruta está disponible en la versión actual del repositorio, y en las carpetas de evidencias organizadas por motor.

> La definición de un trigger y la evidencia de que existe no sustituyen una prueba funcional. Para declarar un trigger verificado, debe comprobarse su comportamiento al insertar o actualizar registros y revisar el valor resultante. Las particularidades de Oracle deben evaluarse con sus propias evidencias y scripts.

---

## Backend Django

El proyecto incorpora un backend desarrollado con **Python y Django**. Su trabajo se realiza en WSL/Linux y se organiza separando la configuración del proyecto, las aplicaciones de negocio y la documentación.

### Tecnologías

| Tecnología | Propósito |
|:--|:--|
| Python | Lenguaje del backend |
| Django | Framework web |
| PostgreSQL, MySQL, SQL Server y Oracle | Motores contemplados en el enfoque multimotor |
| Entorno virtual `.venv` | Aislamiento de dependencias |
| Variables de entorno | Configuración por ambiente |
| Git y GitHub | Control de versiones |

La disponibilidad de cada motor para Django depende de su controlador, de la configuración correspondiente y de la compatibilidad de las migraciones. Que un motor exista en el proyecto SQL no significa que el backend ya se haya conectado y probado con él.

### Organización del backend

La estructura de trabajo incluye el paquete de configuración `config/`, `manage.py`, `requirements.txt`, `.env.example` y un directorio `config/settings/`. La estructura exacta debe verificarse contra los archivos actuales del repositorio.

También se están organizando aplicaciones Django para separar responsabilidades, entre ellas:

- `common`: componentes compartidos.
- `security`: funcionalidades relacionadas con seguridad.
- `client`: dominio de clientes.
- `product`: dominio de productos.
- `sale`: dominio de ventas.

Estas aplicaciones representan la organización de trabajo; cada modelo, endpoint y regla de negocio debe comprobarse en el código antes de considerarse terminado.

### Configuración local

Desde WSL/Linux, entra al backend y activa el entorno virtual:

```bash
cd backend

python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

Si todavía no existe el archivo local de configuración, copia la plantilla:

```bash
cp .env.example .env
```

Edita `.env` con los valores correspondientes al entorno. No guardes contraseñas, tokens ni claves reales en Git ni en la documentación.

Entre las variables de configuración pueden encontrarse:

- `DJANGO_SECRET_KEY`
- `DJANGO_DEBUG`
- `DJANGO_ALLOWED_HOSTS`
- `DB_ENGINE`
- Variables de conexión específicas del motor seleccionado

Los nombres definitivos y los valores aceptados deben consultarse en `.env.example` y en la implementación de la configuración.

### Comprobaciones y migraciones

Con el entorno virtual activado, los siguientes comandos permiten comprobar el proyecto:

```bash
python manage.py check
python -m pip check
python manage.py showmigrations
```

Para revisar los cambios de modelos antes de aplicarlos:

```bash
python manage.py makemigrations
python manage.py migrate
```

Ejecuta las migraciones solamente después de verificar el motor activo, la base de datos de destino y las credenciales. En un proyecto multimotor, las migraciones y restricciones deben comprobarse por separado para cada motor soportado.

### Estado del backend

Durante el trabajo reciente se aplicó correctamente la migración inicial de la aplicación `client` en el entorno seleccionado:

```text
Applying client.0001_initial... OK
```

Este resultado confirma esa migración en ese entorno, pero no demuestra por sí solo que todas las aplicaciones, los cuatro motores, las API HTTP ni la documentación Swagger estén completamente implementados o probados.

La documentación de API y las evidencias asociadas se deben revisar en [API-HTTP-SWAGGER.md](docs/API-HTTP-SWAGGER.md) y en la carpeta de evidencias correspondiente, si esas rutas están presentes.

---

## Herramientas gráficas

El proyecto contempla herramientas gráficas para inspeccionar esquemas, ejecutar consultas y revisar datos:

- DBeaver.
- MySQL Workbench.
- pgAdmin 4.
- SQL Server Management Studio.
- Oracle SQL Developer.

Las capturas de cada herramienta se conservan dentro de `evidencias/`. La disponibilidad de una captura debe comprobarse en el repositorio antes de enlazarla o considerarla evidencia de una prueba concreta.

---

## Estructura general del repositorio

La estructura de referencia del proyecto es:

```text
bdii-2026ii-jairovaron404/
├── backend/
│   ├── config/
│   ├── common/
│   ├── security/
│   ├── client/
│   ├── product/
│   ├── sale/
│   ├── manage.py
│   ├── requirements.txt
│   └── .env.example
├── database/
│   ├── mysql/
│   ├── postgresql/
│   ├── sql-server/
│   └── oracle/
├── services/
│   └── motores-bd/
├── docs/
│   ├── API-HTTP-SWAGGER.md
│   ├── CASOS-DE-USO.md
│   ├── CONSULTAS-AVANZADAS.md
│   ├── DOMINIO.md
│   ├── GUI.md
│   ├── PROCESO.md
│   ├── REPOSITORIOS.md
│   ├── TRIGGERS.md
│   ├── contexto/
│   ├── informes/
│   └── semanas/
├── evidencias/
│   ├── 01-proyecto/
│   ├── 02-mysql/
│   ├── 03-postgresql/
│   ├── 04-sql-server/
│   ├── 05-oracle/
│   ├── 06-entorno-general/
│   ├── 07-dbeaver/
│   ├── 08-persistencia/
│   ├── 09-backups/
│   ├── 10-verificacion-final/
│   ├── 11-consultas-avanzadas/
│   ├── 12-GUI/
│   ├── 13-diagramas/
│   ├── 14-casos-de-uso/
│   ├── 15-repositorios/
│   ├── 16-triggers/
│   └── 17-django-business-http-swagger/
├── .gitignore
└── README.md
```

Esta representación es una guía de organización, no un inventario automático. Los nombres exactos deben mantenerse sincronizados con `tree /F` en Windows o `tree` en WSL.

---

## Documentación del proyecto

| Documento | Contenido |
|:--|:--|
| [Dominio](docs/DOMINIO.md) | Entidades, relaciones y reglas del negocio |
| [Casos de uso](docs/CASOS-DE-USO.md) | Funcionalidades y actores |
| [Consultas avanzadas](docs/CONSULTAS-AVANZADAS.md) | Consultas SQL y técnicas utilizadas |
| [Repositorios](docs/REPOSITORIOS.md) | Organización de scripts y datos |
| [GUI](docs/GUI.md) | Herramientas gráficas y evidencias |
| [API HTTP / Swagger](docs/API-HTTP-SWAGGER.md) | Documentación del trabajo de API |
| [Triggers](docs/TRIGGERS.md) | Triggers por motor y sus evidencias |
| [Proceso](docs/PROCESO.md) | Bitácora de implementación y verificación |
| [Informes](docs/informes/) | Informes académicos |
| [Metodología por semanas](docs/semanas/) | Seguimiento semanal y metodología |
| [Contexto del proyecto](docs/contexto/CONTEXTO_DEL_PROYECTO_ENLEEXPRESS.md) | Contexto general y decisiones del proyecto |

Si algún enlace no se resuelve, confirma que el archivo exista y que el nombre coincida exactamente con el del repositorio.

---

## Evidencias

Las evidencias se agrupan por etapas y componentes. Entre las carpetas de referencia se encuentran:

| Área | Ubicación |
|:--|:--|
| Proyecto y herramientas | `evidencias/01-proyecto/` |
| MySQL | `evidencias/02-mysql/` |
| PostgreSQL | `evidencias/03-postgresql/` |
| SQL Server | `evidencias/04-sql-server/` |
| Oracle | `evidencias/05-oracle/` |
| Entorno general | `evidencias/06-entorno-general/` |
| DBeaver | `evidencias/07-dbeaver/` |
| Persistencia | `evidencias/08-persistencia/` |
| Backups | `evidencias/09-backups/` |
| Verificación final | `evidencias/10-verificacion-final/` |
| Consultas avanzadas | `evidencias/11-consultas-avanzadas/` |
| Herramientas GUI | `evidencias/12-GUI/` |
| Diagramas ER | `evidencias/13-diagramas/` |
| Casos de uso | `evidencias/14-casos-de-uso/` |
| Repositorios | `evidencias/15-repositorios/` |
| Triggers | `evidencias/16-triggers/` |
| Django, negocio, HTTP y Swagger | `evidencias/17-django-business-http-swagger/` |

En las evidencias de Django, cada captura debe demostrar una acción concreta: entorno y dependencias, estructura del backend, configuración, comprobaciones, migraciones, endpoints o documentación. Consulta los archivos Markdown relacionados para conocer el nombre y el propósito de cada captura.

---

## Estado del proyecto

El estado debe interpretarse por componente y respaldarse con scripts, pruebas o capturas verificables.

| Componente | Estado documentado |
|:--|:--|
| Modelo lógico relacional | Desarrollado y documentado |
| Scripts para cuatro motores | Implementados; verificar cada ejecución en su entorno |
| Datos de prueba | Preparados; verificar carga e integridad por motor |
| Consultas avanzadas | Documentadas; comprobar resultados y evidencias por motor |
| RBAC en el modelo de datos | Estructura documentada |
| Diagramas ER | Evidencias organizadas por motor; revisar archivos concretos |
| Triggers | Documentados por etapas; confirmar pruebas funcionales individuales |
| Backend Django | En desarrollo |
| Aplicación `client` | Migración inicial aplicada en el entorno seleccionado |
| Integración Django con los cuatro motores | Pendiente de comprobar individualmente |
| API HTTP y Swagger | Revisar implementación y evidencias correspondientes |
| Documentación académica | Organizada en `docs/` |
| Infraestructura Docker | Definiciones organizadas; verificar el estado de los contenedores |

No se utiliza una etiqueta global de «completado» para funcionalidades que aún no cuentan con evidencia suficiente.

---

## Metodología de trabajo

El proyecto utiliza la metodología **MIRIA — Integración Responsable de IA para el Aprendizaje** como apoyo para organizar, documentar y verificar el desarrollo.

```text
OBJETIVOS
   |
   v
REQUISITOS
   |
   v
DISEÑO
   |
   v
IMPLEMENTACIÓN
   |
   v
PRUEBAS
   |
   v
EVIDENCIAS
   |
   v
VERIFICACIÓN HUMANA
   |
   v
DOCUMENTACIÓN
```

La bitácora [PROCESO.md](docs/PROCESO.md) registra las actividades, decisiones técnicas, comprobaciones, problemas identificados y tareas pendientes.

---

## Resumen técnico

<div align="center">

<img src="https://img.shields.io/badge/18-Tablas-6366F1?style=for-the-badge" alt="18 tablas"/>
<img src="https://img.shields.io/badge/4-Motores-0891B2?style=for-the-badge" alt="4 motores"/>
<img src="https://img.shields.io/badge/38-Consultas%20documentadas-7C3AED?style=for-the-badge" alt="38 consultas documentadas"/>
<img src="https://img.shields.io/badge/16-Casos%20de%20uso%20documentados-10B981?style=for-the-badge" alt="16 casos de uso documentados"/>
<img src="https://img.shields.io/badge/6-Roles-F59E0B?style=for-the-badge" alt="6 roles"/>

<br><br>

<img src="https://img.shields.io/badge/Python-Backend-3776AB?style=flat-square&logo=python&logoColor=white" alt="Python"/>
<img src="https://img.shields.io/badge/Django-Backend%20en%20desarrollo-092E20?style=flat-square&logo=django&logoColor=white" alt="Django"/>
<img src="https://img.shields.io/badge/Docker-Infraestructura-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Docker"/>

</div>

---

## Autor

<div align="center">

<strong>Jairo Varón</strong>

Ingeniería de Sistemas  
Universidad de La Guajira

<img src="https://img.shields.io/badge/Base%20de%20Datos-II-2563EB?style=for-the-badge" alt="Base de Datos II"/>
<img src="https://img.shields.io/badge/Proyecto-EnlaceExpress-7C3AED?style=for-the-badge" alt="EnlaceExpress"/>

</div>

---

<div align="center">

<strong>EnlaceExpress</strong>

<sub>Proyecto académico de implementación, documentación y verificación de bases de datos multimotor.</sub>

<img src="https://capsule-render.vercel.app/api?type=waving&height=140&section=footer&theme=tokyonight&animation=fadeIn" width="100%" alt="Pie de página"/>

</div>
