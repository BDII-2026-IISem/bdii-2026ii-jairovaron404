# Motores de Bases de Datos

Proyecto académico para la **implementación, configuración, conexión y validación de cuatro motores de bases de datos** utilizando Docker, Docker Compose, WSL y DBeaver.

El proyecto forma parte del desarrollo de **EnlaceExpress**, una plataforma de mensajería corporativa para la gestión de envíos, seguimiento, tarifas y facturación.

## Motores implementados

Los cuatro motores de bases de datos implementados son:

* **MySQL 8.0**
* **PostgreSQL 17**
* **SQL Server 2022**
* **Oracle Database XE 21c**

Los motores fueron configurados para trabajar de forma independiente. Se verificó su funcionamiento, conexión, persistencia de datos y ejecución simultánea.

## Herramientas utilizadas

* Docker
* Docker Compose
* WSL
* DBeaver
* MySQL Workbench
* pgAdmin 4
* SQL Server Management Studio (SSMS)
* Oracle SQL Developer
* Git
* GitHub

## Bases de datos

La estructura de **EnlaceExpress** se encuentra implementada en los cuatro motores solicitados.

Para cada motor se dispone de:

1. **Script DDL:** contiene la definición de la estructura de la base de datos.
2. **Administración mediante DBeaver:** utilizada para la conexión, ejecución y verificación de las bases de datos.
3. **Administración mediante la GUI propia del motor:** utilizada para visualizar y verificar la implementación.
4. **Evidencias:** organizadas por motor y por etapa del proyecto.

### Implementaciones DDL

| Motor      | Base de datos / esquema       | DDL                                                                     |
| ---------- | ----------------------------- | ----------------------------------------------------------------------- |
| MySQL      | `enlace_express`              | [DDL MySQL](database/mysql/enlace_express_mysql_ddl.sql)                |
| PostgreSQL | `enlace_express` / `public`   | [DDL PostgreSQL](database/postgresql/enlace_express_postgresql_ddl.sql) |
| SQL Server | `enlace_express` / `dbo`      | [DDL SQL Server](database/sql-server/enlace_express_sqlserver_ddl.sql)  |
| Oracle     | `TECNOGUA` / `ENLACE_EXPRESS` | [DDL Oracle](database/oracle/enlace_express_oracle_ddl.sql)             |

La documentación específica de cada implementación se encuentra en:

* [MySQL](database/mysql/)
* [PostgreSQL](database/postgresql/)
* [SQL Server](database/sql-server/)
* [Oracle](database/oracle/)

## Documentación

### Informes

* [01 - Implementación de Motores de Base de Datos](docs/informes/01-INFORME_IMPLEMENTACIÓN_MOTORES_BASE_DATOS.md)
* [02 - Informe Inicial del Proyecto Integrador](docs/informes/02-INFORME_INICIAL_PROYECTO_INTEGRADOR.md)
* [03 - Verificación de Bases de Datos](docs/informes/03-INFORME_VERIFICACION_BASES_DE_DATOS.md)

### Contexto del proyecto

* [Contexto del Proyecto EnlaceExpress](docs/contexto/CONTEXTO_DEL_PROYECTO_ENLEEXPRESS.md)

### Evidencias de GUI

Las evidencias de la administración y verificación gráfica de los cuatro motores se encuentran documentadas en:

* [Evidencias de GUI – DBeaver y herramientas propias](evidencias/GUI.md)

Este documento reúne las evidencias realizadas mediante:

* DBeaver
* MySQL Workbench
* pgAdmin 4
* SQL Server Management Studio
* Oracle SQL Developer

## Servicios Docker

Los archivos necesarios para ejecutar los cuatro motores mediante Docker y Docker Compose se encuentran organizados en:

```text
services/motores-bd/
```

Cada motor cuenta con su propio archivo `docker-compose.yml` y documentación específica.

También se incluyen scripts para facilitar la ejecución y detención de todos los servicios:

* `start-all.sh` — inicia los servicios de los cuatro motores.
* `stop-all.sh` — detiene los servicios de los cuatro motores.

### Servicios disponibles

* [MySQL](services/motores-bd/mysql/)
* [PostgreSQL](services/motores-bd/postgres/)
* [SQL Server](services/motores-bd/mssql/)
* [Oracle](services/motores-bd/oracle/)

> Los archivos `.env` utilizados para configurar las credenciales y variables de entorno no forman parte del repositorio por razones de seguridad.

## Diagramas ER

Los diagramas entidad-relación de cada motor se encuentran organizados individualmente:

* [MySQL](docs/diagramas/mysql/ER-diagram.jpg)
* [PostgreSQL](docs/diagramas/postgresql/ER-diagram.jpg)
* [SQL Server](docs/diagramas/sql-server/ER-diagram.jpg)
* [Oracle XE](docs/diagramas/oracle/ER-diagram.jpg)

## Evidencias

Las evidencias del proyecto están organizadas por etapas:

* [01 - Proyecto](evidencias/01-proyecto/)
* [02 - MySQL](evidencias/02-mysql/)
* [03 - PostgreSQL](evidencias/03-postgresql/)
* [04 - SQL Server](evidencias/04-sql-server/)
* [05 - Oracle](evidencias/05-oracle/)
* [06 - Entorno general](evidencias/06-entorno-general/)
* [07 - DBeaver](evidencias/07-dbeaver/)
* [08 - Persistencia](evidencias/08-persistencia/)
* [09 - Backups](evidencias/09-backups/)
* [10 - Verificación final](evidencias/10-verificacion-final/)
* [GUI - Evidencias gráficas](evidencias/GUI.md)

Las evidencias documentan la configuración de los motores, ejecución de contenedores, conexiones mediante DBeaver, administración mediante las herramientas gráficas propias de cada motor, pruebas de funcionamiento, persistencia de datos, backups y verificación del entorno.

## Estructura del proyecto

```text
bdii-2026ii-jairovaron404/
│
├── database/
│   ├── mysql/
│   │   ├── enlace_express_mysql_ddl.sql
│   │   └── README.md
│   │
│   ├── oracle/
│   │   ├── enlace_express_oracle_ddl.sql
│   │   └── README.md
│   │
│   ├── postgresql/
│   │   ├── enlace_express_postgresql_ddl.sql
│   │   └── README.md
│   │
│   └── sql-server/
│       ├── enlace_express_sqlserver_ddl.sql
│       └── README.md
│
├── docs/
│   ├── contexto/
│   │   └── CONTEXTO_DEL_PROYECTO_ENLEEXPRESS.md
│   │
│   ├── diagramas/
│   │   ├── mysql/
│   │   │   └── ER-diagram.jpg
│   │   ├── oracle/
│   │   │   └── ER-diagram.jpg
│   │   ├── postgresql/
│   │   │   └── ER-diagram.jpg
│   │   └── sql-server/
│   │       └── ER-diagram.jpg
│   │
│   └── informes/
│       ├── 01-INFORME_IMPLEMENTACIÓN_MOTORES_BASE_DATOS.md
│       ├── 02-INFORME_INICIAL_PROYECTO_INTEGRADOR.md
│       └── 03-INFORME_VERIFICACION_BASES_DE_DATOS.md
│
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
│   └── GUI.md
│
├── services/
│   └── motores-bd/
│       ├── mysql/
│       │   ├── docker-compose.yml
│       │   └── README.md
│       │
│       ├── postgres/
│       │   ├── docker-compose.yml
│       │   └── README.md
│       │
│       ├── mssql/
│       │   ├── docker-compose.yml
│       │   └── README.md
│       │
│       ├── oracle/
│       │   ├── docker-compose.yml
│       │   └── README.md
│       │
│       ├── README.md
│       ├── start-all.sh
│       └── stop-all.sh
│
├── .gitignore
└── README.md
```

## Autor

**Jairo de Jesús Varón Hernández**

Proyecto académico — Ingeniería de Sistemas