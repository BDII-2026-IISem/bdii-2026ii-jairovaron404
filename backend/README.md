# Backend Django — EnlaceExpress

EnlaceExpress incorpora un backend desarrollado con Python y Django. Actualmente se está preparando su configuración inicial para integrar la aplicación con los motores de bases de datos contemplados en el proyecto.

### Tecnologías del backend

| Tecnología o componente   | Propósito                                                |
| ------------------------- | -------------------------------------------------------- |
| Python                    | Lenguaje del backend                                     |
| Django                    | Framework web                                            |
| PostgreSQL                | Motor seleccionado actualmente en la configuración local |
| MySQL                     | Motor contemplado por la configuración multimotor        |
| SQL Server                | Motor contemplado por la configuración multimotor        |
| Oracle                    | Motor contemplado por la configuración multimotor        |
| Variables de entorno      | Configuración de credenciales y parámetros               |
| Entorno virtual (`.venv`) | Aislamiento de las dependencias de Python                |
| Git y GitHub              | Control de versiones                                     |

### Estructura del backend

```text
backend/
├── config/
│   ├── settings/
│   │   └── __init__.py
│   ├── asgi.py
│   ├── wsgi.py
│   ├── database.py
│   └── project_python.py
├── .env.example
├── manage.py
└── requirements.txt
```

* `config/settings/`: configuración principal de Django.
* `config/database.py`: configuración de conexión según el motor seleccionado.
* `config/project_python.py`: selección del intérprete del entorno virtual.
* `.env.example`: plantilla de variables de entorno.
* `manage.py`: punto de entrada para los comandos de administración.

### Configuración del entorno

El backend utiliza un archivo `.env` local para definir los parámetros de ejecución y conexión. Este archivo contiene información específica del entorno y no debe publicarse en GitHub.

Las variables principales incluyen:

* `DJANGO_SECRET_KEY`: clave secreta de Django.
* `DJANGO_DEBUG`: modo de depuración.
* `DJANGO_ALLOWED_HOSTS`: hosts permitidos.
* `DB_ENGINE`: motor seleccionado.
* Variables específicas de conexión para PostgreSQL, MySQL, SQL Server y Oracle.

Los valores deben configurarse según el entorno local. No deben incluirse contraseñas ni claves reales en la documentación.

### Preparación y comprobación

Desde la terminal WSL/Linux, entra en el directorio `backend/`. Si el entorno virtual aún no existe, créalo y actívalo:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Instala las dependencias:

```bash
python -m pip install -r requirements.txt
```

Crea la configuración local a partir de la plantilla:

```bash
cp .env.example .env
```

Completa las variables necesarias antes de ejecutar Django.

Para comprobar la configuración y las dependencias:

```bash
.venv/bin/python manage.py check
.venv/bin/python -m pip check
```

Para consultar las migraciones:

```bash
.venv/bin/python manage.py showmigrations
```

Las migraciones deben aplicarse únicamente después de confirmar que el motor seleccionado está disponible y que las credenciales corresponden a la base de datos correcta.

### Estado actual

La configuración inicial del backend ha superado la comprobación del sistema de Django y la validación de dependencias instaladas. La configuración multimotor está preparada para seleccionar el motor mediante variables de entorno.

La conexión con cada motor, la aplicación de migraciones y la implementación de las funcionalidades de negocio deben validarse de forma independiente. La configuración inicial no implica que la API completa esté terminada.

