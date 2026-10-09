<!-- ========================================================= -->

<!--                         HEADER                            -->

<!-- ========================================================= -->

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&height=230&section=header&text=EnlaceExpress&fontSize=58&fontColor=FFFFFF&fontAlignY=38&desc=Multimotor%20Database%20%7C%20Base%20de%20Datos%20II&descAlignY=60&theme=tokyonight&animation=fadeIn" width="100%"/>

<br>

<img src="https://img.shields.io/badge/Proyecto-Académico-7C3AED?style=for-the-badge" alt="Proyecto académico"/>
<img src="https://img.shields.io/badge/Base%20de%20Datos-II-2563EB?style=for-the-badge" alt="Base de Datos II"/>
<img src="https://img.shields.io/badge/Motores-4-0891B2?style=for-the-badge" alt="Cuatro motores"/>
<img src="https://img.shields.io/badge/Estado-Completado-16A34A?style=for-the-badge" alt="Estado"/>

<br>

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=20&duration=3000&pause=1000&color=6366F1&center=true&vCenter=true&width=850&lines=Sistema+de+gestión+de+envíos;Seguimiento+y+facturación;Un+mismo+modelo+lógico+en+cuatro+motores;MySQL+%7C+PostgreSQL+%7C+SQL+Server+%7C+Oracle" alt="Descripción animada"/>

<strong>Sistema de gestión de envíos, seguimiento y facturación</strong>

<sub>Un mismo modelo lógico implementado y validado en cuatro motores de bases de datos.</sub>

</div>

---

# EnlaceExpress

## Sobre el proyecto

**EnlaceExpress** es un proyecto académico desarrollado para la asignatura **Base de Datos II** de Ingeniería de Sistemas.

El proyecto representa una plataforma para la gestión de operaciones de mensajería y distribución, centralizando procesos relacionados con empresas, envíos, paquetes, rutas, seguimiento, entregas y facturación.

El modelo lógico fue implementado en cuatro motores de bases de datos, realizando las adaptaciones necesarias según el dialecto y las características de cada plataforma.

<div align="center">

<img src="https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL 8.0"/>
<img src="https://img.shields.io/badge/PostgreSQL-17-316192?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL 17"/>
<img src="https://img.shields.io/badge/SQL%20Server-2022-CC292B?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" alt="SQL Server 2022"/>
<img src="https://img.shields.io/badge/Oracle-XE%2021c-F80000?style=for-the-badge&logo=oracle&logoColor=white" alt="Oracle XE 21c"/>

</div>

---

## Alcance del sistema

El sistema permite gestionar los principales procesos de una plataforma de distribución:

<table align="center">
<tr>
<td align="center" width="25%">

<strong>Envíos</strong>

Registro, consulta, asignación y control de estados.

</td>

<td align="center" width="25%">

<strong>Seguimiento</strong>

Eventos de tracking y trazabilidad de los envíos.

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
</table>

<br>

<table align="center">
<tr>
<td align="center" width="25%">

<strong>Usuarios</strong>

Usuarios, roles y permisos.

</td>

<td align="center" width="25%">

<strong>Autenticación</strong>

Sesiones y refresh tokens.

</td>

<td align="center" width="25%">

<strong>Auditoría</strong>

Registro de operaciones importantes.

</td>

<td align="center" width="25%">

<strong>Rutas</strong>

Rutas y asignación de mensajeros.

</td>
</tr>
</table>

---

# Arquitectura general

```text
                            ENLACEEXPRESS
                                  |
             +--------------------+--------------------+
             |                    |                    |
             v                    v                    v
        OPERACIÓN             SEGURIDAD           FACTURACIÓN
             |                    |                    |
      +------+------+        +----+----+          +----+----+
      |      |      |        |         |          |         |
    Envíos Paquetes Tracking RBAC  Autenticación Tarifas Facturas
      |      |      |        |         |
      +------+------+        |         |
             |               |         |
             v               v         v
        Modelo lógico     Usuarios   Roles
             |               |         |
             |               +----+----+
             |                    |
             v                    v
      +------+------+          Recursos
      |      |      |
      v      v      v
    MySQL PostgreSQL SQL Server
             |
             v
           Oracle
```

---

# Entorno tecnológico

Una de las características principales del proyecto es la implementación del mismo modelo lógico en cuatro motores de bases de datos.

Las siguientes imágenes corresponden a los recursos gráficos propios del proyecto y se encuentran almacenadas en `evidencias/01-proyecto/`.

<div align="center">

<table>
<tr>

<td align="center">
<img src="evidencias/01-proyecto/0.1-MySQL.png" width="150" alt="MySQL"/>
<br>
<strong>MySQL 8.0</strong>
</td>

<td align="center">
<img src="evidencias/01-proyecto/0.2-PostgreSQL.png" width="150" alt="PostgreSQL"/>
<br>
<strong>PostgreSQL 17</strong>
</td>

<td align="center">
<img src="evidencias/01-proyecto/0.3-SQLServer.png" width="150" alt="SQL Server"/>
<br>
<strong>SQL Server 2022</strong>
</td>

<td align="center">
<img src="evidencias/01-proyecto/0.4-OracleXE.png" width="150" alt="Oracle XE"/>
<br>
<strong>Oracle XE 21c</strong>
</td>

<td align="center">
<img src="evidencias/01-proyecto/0.5-DBeaver.png" width="150" alt="DBeaver"/>
<br>
<strong>DBeaver</strong>
</td>

</tr>
</table>

</div>

### Motores implementados

<div align="center">

|                                              Motor                                              | Versión |      Esquema     |
| :---------------------------------------------------------------------------------------------: | :-----: | :--------------: |
|          <img src="https://cdn.simpleicons.org/mysql/4479A1" height="26" alt="MySQL"/>          |   8.0   | `enlace_express` |
|     <img src="https://cdn.simpleicons.org/postgresql/4169E1" height="26" alt="PostgreSQL"/>     |    17   | `enlace_express` |
| <img src="https://cdn.simpleicons.org/microsoftsqlserver/CC2927" height="26" alt="SQL Server"/> |   2022  |       `dbo`      |
|         <img src="https://cdn.simpleicons.org/oracle/F80000" height="26" alt="Oracle"/>         |  XE 21c | `ENLACE_EXPRESS` |

</div>

### Herramientas principales

<div align="center">

<img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker"/>
<img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" alt="Ubuntu"/>
<img src="https://img.shields.io/badge/WSL-4D4D4D?style=for-the-badge&logo=linux&logoColor=white" alt="WSL"/>
<img src="https://img.shields.io/badge/DBeaver-372923?style=for-the-badge&logo=dbeaver&logoColor=white" alt="DBeaver"/>
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git"/>
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>

</div>

---

# Cuatro motores, un mismo modelo

```text
                         MODELO LÓGICO
                               |
              +----------------+----------------+
              |                |                |
              v                v                v
            MySQL         PostgreSQL       SQL Server
              |                |                |
              |                |                |
              +----------------+----------------+
                               |
                               v
                             Oracle

                MISMA LÓGICA DE NEGOCIO
                              +
                  ADAPTACIÓN DEL DIALECTO
                              +
                  CARACTERÍSTICAS NATIVAS
```

La equivalencia se mantiene a nivel lógico, mientras que cada motor utiliza las características y sintaxis apropiadas para su plataforma.

---

# Modelo de datos

El sistema está compuesto por **18 tablas**.

<div align="center">

<img src="https://img.shields.io/badge/18-Tablas-6366F1?style=for-the-badge" alt="18 tablas"/>
<img src="https://img.shields.io/badge/4-Motores-0891B2?style=for-the-badge" alt="4 motores"/>
<img src="https://img.shields.io/badge/6-Roles-F59E0B?style=for-the-badge" alt="6 roles"/>
<img src="https://img.shields.io/badge/16-Casos%20de%20uso-10B981?style=for-the-badge" alt="16 casos de uso"/>

</div>

### Tablas

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
|
+-- CONTACTOS
|
+-- DIRECCIONES
|
+-- ENVIOS
|
+-- FACTURAS


ENVIOS
|
+-- PAQUETES
|
+-- EVENTOS_TRACKING
|
+-- PRUEBAS_ENTREGA
|
+-- RUTAS
|
+-- MENSAJEROS
|
+-- TARIFAS


USERS
|
+-- ROLE_USERS
|      |
|      +-- ROLES
|             |
|             +-- RESOURCE_ROLES
|                    |
|                    +-- RESOURCES
|
+-- REFRESH_TOKENS


AUDITORIA
```

### Modelo completo

[Consultar documentación del dominio](docs/DOMINIO.md)

### Diagramas ER

Los diagramas entidad-relación se mantienen como evidencia independiente para cada motor.

```text
evidencias/
└── 13-diagramas/
    ├── mysql/
    │   └── ER-diagram.jpg
    ├── postgresql/
    │   └── ER-diagram.jpg
    ├── sql-server/
    │   └── ER-diagram.jpg
    └── oracle/
        └── ER-diagram.jpg
```

---

# Control de acceso

EnlaceExpress utiliza un modelo de **Role-Based Access Control (RBAC)**.

<div align="center">

<img src="https://img.shields.io/badge/ADMIN-7C3AED?style=for-the-badge" alt="ADMIN"/>
<img src="https://img.shields.io/badge/CLIENTE_EMPRESA-2563EB?style=for-the-badge" alt="CLIENTE EMPRESA"/>
<img src="https://img.shields.io/badge/DESPACHO-0891B2?style=for-the-badge" alt="DESPACHO"/>
<img src="https://img.shields.io/badge/MENSAJERO-059669?style=for-the-badge" alt="MENSAJERO"/>
<img src="https://img.shields.io/badge/FACTURACION-D97706?style=for-the-badge" alt="FACTURACION"/>
<img src="https://img.shields.io/badge/OPERADOR-DC2626?style=for-the-badge" alt="OPERADOR"/>

</div>

### Modelo de autorización

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

Los recursos representan operaciones del sistema mediante rutas y métodos HTTP, permitiendo asociar permisos a los diferentes roles.

---

# Flujo principal

```text
+----------------+
|    EMPRESA     |
+-------+--------+
        |
        | Solicita envío
        v
+----------------+
|     ENVÍO      |
+-------+--------+
        |
        v
+----------------+
|     RUTA       |
+-------+--------+
        |
        v
+----------------+
|    MENSAJERO   |
+-------+--------+
        |
        v
+----------------+
|    TRACKING    |
+-------+--------+
        |
        v
+----------------+
|    PAQUETE     |
+-------+--------+
        |
        v
+----------------+
|    ENTREGA     |
+-------+--------+
        |
        v
+----------------+
|    FACTURA     |
+----------------+
```

---

# Estados del sistema

## Envíos

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

Estados adicionales:

```text
CANCELADO
CON_NOVEDAD
```

## Paquetes

```text
REGISTRADO
EN_TRANSITO
ENTREGADO
DEVUELTO
CON_NOVEDAD
```

## Facturas

```text
PENDIENTE
EMITIDA
PAGADA
ANULADA
VENCIDA
```

## Prioridades

<div align="center">

<img src="https://img.shields.io/badge/BAJA-94A3B8?style=flat-square" alt="Baja"/>
<img src="https://img.shields.io/badge/NORMAL-3B82F6?style=flat-square" alt="Normal"/>
<img src="https://img.shields.io/badge/ALTA-F59E0B?style=flat-square" alt="Alta"/>
<img src="https://img.shields.io/badge/URGENTE-EF4444?style=flat-square" alt="Urgente"/>

</div>

---

# Infraestructura

Los cuatro motores se ejecutan mediante servicios independientes utilizando Docker.

```text
services/
└── motores-bd/
    |
    +-- mysql/
    |   └── docker-compose.yml
    |
    +-- postgres/
    |   └── docker-compose.yml
    |
    +-- mssql/
    |   └── docker-compose.yml
    |
    +-- oracle/
    |   └── docker-compose.yml
    |
    +-- start-all.sh
    └── stop-all.sh
```

### Arquitectura de servicios

```text
                         DOCKER
                            |
          +-----------------+-----------------+
          |                 |                 |
          v                 v                 v
        MySQL          PostgreSQL        SQL Server
          |                 |                 |
          +-----------------+-----------------+
                            |
                            v
                          Oracle
```

### Servicios

<div align="center">

<img src="https://img.shields.io/badge/MySQL-Container-4479A1?style=flat-square&logo=mysql&logoColor=white" alt="MySQL container"/>
<img src="https://img.shields.io/badge/PostgreSQL-Container-4169E1?style=flat-square&logo=postgresql&logoColor=white" alt="PostgreSQL container"/>
<img src="https://img.shields.io/badge/SQL%20Server-Container-CC2927?style=flat-square&logo=microsoftsqlserver&logoColor=white" alt="SQL Server container"/>
<img src="https://img.shields.io/badge/Oracle-Container-F80000?style=flat-square&logo=oracle&logoColor=white" alt="Oracle container"/>

</div>

---

# Datos y persistencia

Se generaron e insertaron datos de prueba en los cuatro motores para validar la estructura, relaciones y consultas.

Cada motor dispone de sus propios archivos:

```text
database/
|
+-- mysql/
|   +-- datos_enlace_express_mysql.csv
|   +-- enlace_express_mysql_ddl.sql
|   +-- inserts_mysql.sql
|   └── README.md
|
+-- postgresql/
|   +-- datos_enlace_express_postgresql.csv
|   +-- enlace_express_postgresql_ddl.sql
|   +-- inserts_postgresql.sql
|   └── README.md
|
+-- sql-server/
|   +-- datos_enlace_express_sqlserver.csv
|   +-- enlace_express_sqlserver_ddl.sql
|   +-- inserts_sqlserver.sql
|   └── README.md
|
└── oracle/
    +-- datos_enlace_express_oracle.csv
    +-- enlace_express_oracle_ddl.sql
    +-- inserts_oracle.sql
    └── README.md
```

---

# Consultas avanzadas

Se implementaron y validaron **38 consultas avanzadas** en los cuatro motores.

<div align="center">

<img src="https://img.shields.io/badge/38-Consultas-7C3AED?style=for-the-badge" alt="38 consultas"/>
<img src="https://img.shields.io/badge/4-Motores-0891B2?style=for-the-badge" alt="4 motores"/>
<img src="https://img.shields.io/badge/SQL-Avanzado-059669?style=for-the-badge" alt="SQL avanzado"/>

</div>

### Categorías

```text
SELECT
WHERE
IN
BETWEEN
LIKE
ORDER BY

COUNT
SUM
AVG

GROUP BY
HAVING

JOIN
Subconsultas
EXISTS

CASE
COALESCE

CTE
RANK
ROW_NUMBER

RBAC
UNION
```

### Documentación

[Consultar las 38 consultas avanzadas](docs/CONSULTAS-AVANZADAS.md)

### Evidencias

```text
evidencias/
└── 11-consultas-avanzadas/
    ├── 01-mysql/
    ├── 02-postgresql/
    ├── 03-sql-server/
    └── 04-oracle/
```

---

# Casos de uso

El proyecto cuenta con **16 casos de uso**.

<div align="center">

<img src="https://img.shields.io/badge/16-Casos%20de%20uso-10B981?style=for-the-badge" alt="16 casos de uso"/>
<img src="https://img.shields.io/badge/6-Roles-F59E0B?style=for-the-badge" alt="6 roles"/>

</div>

### Usuarios y roles

```text
Gestionar usuarios
Gestionar roles
Gestionar recursos
```

### Envíos

```text
Registrar envío
Consultar envío
Asignar mensajero
Gestionar rutas
```

### Seguimiento

```text
Registrar evento de tracking
Consultar seguimiento
```

### Entregas

```text
Gestionar paquetes
Registrar prueba de entrega
```

### Facturación

```text
Gestionar tarifas
Generar factura
Consultar factura
```

### Administración

```text
Consultar auditoría
Gestionar sesión y autenticación
```

### Documentación

[Consultar casos de uso](docs/CASOS-DE-USO.md)

### Evidencias

```text
evidencias/
└── 14-casos-de-uso/
```

---


## Backend Django

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

---

# Herramientas gráficas

El proyecto fue administrado y verificado mediante herramientas gráficas específicas para cada motor.

<div align="center">

<table>
<tr>

<td align="center">
<img src="evidencias/01-proyecto/0.5-DBeaver.png" width="180" alt="DBeaver"/>
<br>
<strong>DBeaver</strong>
</td>

<td align="center">

<strong>Herramientas nativas</strong>

<br><br>

MySQL Workbench

<br>

pgAdmin 4

<br>

SQL Server Management Studio

<br>

Oracle SQL Developer

</td>

</tr>
</table>

</div>

### Entornos utilizados

```text
DBeaver
|
+-- MySQL
+-- PostgreSQL
+-- SQL Server
└── Oracle


Herramientas nativas
|
+-- MySQL Workbench
+-- pgAdmin 4
+-- SQL Server Management Studio
└── Oracle SQL Developer
```

---

# Estructura del repositorio

```text
EnlaceExpress/
|
+-- database/
|   |
|   +-- mysql/
|   |   +-- datos_enlace_express_mysql.csv
|   |   +-- enlace_express_mysql_ddl.sql
|   |   +-- inserts_mysql.sql
|   |   └── README.md
|   |
|   +-- postgresql/
|   |   +-- datos_enlace_express_postgresql.csv
|   |   +-- enlace_express_postgresql_ddl.sql
|   |   +-- inserts_postgresql.sql
|   |   └── README.md
|   |
|   +-- sql-server/
|   |   +-- datos_enlace_express_sqlserver.csv
|   |   +-- enlace_express_sqlserver_ddl.sql
|   |   +-- inserts_sqlserver.sql
|   |   └── README.md
|   |
|   └── oracle/
|       +-- datos_enlace_express_oracle.csv
|       +-- enlace_express_oracle_ddl.sql
|       +-- inserts_oracle.sql
|       └── README.md
|
+-- services/
|   └── motores-bd/
|
+-- docs/
|   +-- DOMINIO.md
|   +-- CASOS-DE-USO.md
|   +-- CONSULTAS-AVANZADAS.md
|   +-- REPOSITORIOS.md
|   +-- GUI.md
|   +-- PROCESO.md
|   +-- contexto/
|   +-- informes/
|   └── semanas/
|
+-- evidencias/
|   +-- 01-proyecto/
|   +-- 02-mysql/
|   +-- 03-postgresql/
|   +-- 04-sql-server/
|   +-- 05-oracle/
|   +-- 06-entorno-general/
|   +-- 07-dbeaver/
|   +-- 08-persistencia/
|   +-- 09-backups/
|   +-- 10-verificacion-final/
|   +-- 11-consultas-avanzadas/
|   +-- 12-GUI/
|   +-- 13-diagramas/
|   +-- 14-casos-de-uso/
|   └── 15-repositorios/
|
+-- .gitignore
└── README.md
```

---

# Documentación

<div align="center">

| Documento                                          | Descripción                      |
| :------------------------------------------------- | :------------------------------- |
| [Dominio](docs/DOMINIO.md)                         | Modelo y reglas del sistema      |
| [Casos de uso](docs/CASOS-DE-USO.md)               | Funcionalidades principales      |
| [Consultas avanzadas](docs/CONSULTAS-AVANZADAS.md) | Consultas SQL implementadas      |
| [Repositorios](docs/REPOSITORIOS.md)               | Organización de scripts y datos  |
| [GUI](docs/GUI.md)                                 | Herramientas gráficas utilizadas |
| [Proceso](docs/PROCESO.md)                         | Bitácora y proceso de desarrollo |
| [Informes](docs/informes/)                         | Informes académicos              |
| [Semanas](docs/semanas/)                           | Documentación por semanas        |

</div>

---

# Evidencias

Las evidencias se encuentran organizadas por etapas y componentes del proyecto.

```text
evidencias/
|
+-- 01-proyecto
+-- 02-mysql
+-- 03-postgresql
+-- 04-sql-server
+-- 05-oracle
+-- 06-entorno-general
+-- 07-dbeaver
+-- 08-persistencia
+-- 09-backups
+-- 10-verificacion-final
+-- 11-consultas-avanzadas
+-- 12-GUI
+-- 13-diagramas
+-- 14-casos-de-uso
└── 15-repositorios
```

### Evidencias destacadas

| Evidencia                 | Ubicación                            |
| :------------------------ | :----------------------------------- |
| Proyecto y herramientas   | `evidencias/01-proyecto/`            |
| Implementación MySQL      | `evidencias/02-mysql/`               |
| Implementación PostgreSQL | `evidencias/03-postgresql/`          |
| Implementación SQL Server | `evidencias/04-sql-server/`          |
| Implementación Oracle     | `evidencias/05-oracle/`              |
| Entorno general           | `evidencias/06-entorno-general/`     |
| DBeaver                   | `evidencias/07-dbeaver/`             |
| Persistencia              | `evidencias/08-persistencia/`        |
| Backups                   | `evidencias/09-backups/`             |
| Verificación final        | `evidencias/10-verificacion-final/`  |
| Consultas avanzadas       | `evidencias/11-consultas-avanzadas/` |
| Herramientas GUI          | `evidencias/12-GUI/`                 |
| Diagramas ER              | `evidencias/13-diagramas/`           |
| Casos de uso              | `evidencias/14-casos-de-uso/`        |
| Repositorio               | `evidencias/15-repositorios/`        |

---

# Estado del proyecto

<div align="center">

| Componente          |    Estado    |
| :------------------ | :----------: |
| Modelo lógico       | `COMPLETADO` |
| MySQL               | `COMPLETADO` |
| PostgreSQL          | `COMPLETADO` |
| SQL Server          | `COMPLETADO` |
| Oracle              | `COMPLETADO` |
| Datos de prueba     | `COMPLETADO` |
| Consultas avanzadas | `COMPLETADO` |
| RBAC                | `COMPLETADO` |
| Diagramas ER        | `COMPLETADO` |
| Casos de uso        | `COMPLETADO` |
| Evidencias          | `COMPLETADO` |
| Documentación       | `COMPLETADO` |
| Docker              | `COMPLETADO` |

</div>

---

# Metodología

El desarrollo utiliza **MIRIA — Integración Responsable de IA para el Aprendizaje** como apoyo para organizar, documentar y verificar el proceso.

El proceso registra:

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

[Consultar proceso del proyecto](docs/PROCESO.md)

---

# Resumen técnico

<div align="center">

<img src="https://img.shields.io/badge/18-Tablas-6366F1?style=for-the-badge" alt="18 tablas"/>
<img src="https://img.shields.io/badge/4-Motores-0891B2?style=for-the-badge" alt="4 motores"/>
<img src="https://img.shields.io/badge/38-Consultas-7C3AED?style=for-the-badge" alt="38 consultas"/>
<img src="https://img.shields.io/badge/16-Casos%20de%20uso-10B981?style=for-the-badge" alt="16 casos de uso"/>
<img src="https://img.shields.io/badge/6-Roles-F59E0B?style=for-the-badge" alt="6 roles"/>
<img src="https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker Ready"/>

<br><br>

<img src="https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat-square&logo=mysql&logoColor=white" alt="MySQL"/>
<img src="https://img.shields.io/badge/PostgreSQL-17-4169E1?style=flat-square&logo=postgresql&logoColor=white" alt="PostgreSQL"/>
<img src="https://img.shields.io/badge/SQL%20Server-2022-CC2927?style=flat-square&logo=microsoftsqlserver&logoColor=white" alt="SQL Server"/>
<img src="https://img.shields.io/badge/Oracle-XE%2021c-F80000?style=flat-square&logo=oracle&logoColor=white" alt="Oracle"/>

</div>

```text
                         ENLACEEXPRESS
                              |
              +---------------+---------------+
              |               |               |
              v               v               v
           MODELO           DATOS         EVIDENCIAS
              |               |               |
              +---------------+---------------+
                              |
                              v
                       CUATRO MOTORES
                              |
            +-----------------+-----------------+
            |                 |                 |
            v                 v                 v
          MySQL          PostgreSQL        SQL Server
            |                 |                 |
            +-----------------+-----------------+
                              |
                              v
                            Oracle
```

---

# Autor

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

<sub>Proyecto académico de implementación y validación de bases de datos multimotor.</sub>

<img src="https://capsule-render.vercel.app/api?type=waving&height=140&section=footer&theme=tokyonight&animation=fadeIn" width="100%"/>

</div>
