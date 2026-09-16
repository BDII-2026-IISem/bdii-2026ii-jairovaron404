# Motores de Bases de Datos

Proyecto académico para la **implementación, configuración, conexión y validación de cuatro motores de bases de datos** utilizando Docker, Docker Compose y DBeaver.

El proyecto forma parte del desarrollo de **EnlaceExpress**, una plataforma de mensajería corporativa para la gestión de envíos, seguimiento, tarifas y facturación.

## Motores implementados

* **MySQL 8.0**
* **PostgreSQL 17**
* **SQL Server 2022**
* **Oracle Database XE 21c**

Los cuatro motores fueron configurados para trabajar de forma independiente y se verificó su funcionamiento, conexión, persistencia de datos y ejecución simultánea.

## Herramientas utilizadas

* Docker
* Docker Compose
* WSL
* DBeaver
* Git
* GitHub

## Documentación

### Informes

* [01 - Implementación de Motores de Base de Datos](docs/informes/01-INFORME_IMPLEMENTACIÓN_MOTORES_BASE_DATOS.md)
* [02 - Informe Inicial del Proyecto Integrador](docs/informes/02-INFORME_INICIAL_PROYECTO_INTEGRADOR.md)
* [03 - Verificación de Bases de Datos](docs/informes/03-INFORME_VERIFICACION_BASES_DE_DATOS.md)

### Contexto del proyecto

* [Contexto del Proyecto EnlaceExpress](docs/contexto/CONTEXTO_DEL_PROYECTO_ENLEEXPRESS.md)

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

Las evidencias incluyen configuraciones, ejecución de contenedores, conexiones mediante DBeaver, pruebas de funcionamiento, persistencia de datos, backups y verificación del entorno.

## Estructura del proyecto

```text
bdii-2026ii-jairovaron404/
│
├── database/
│   ├── mysql/
│   ├── oracle/
│   ├── postgresql/
│   └── sql-server/
│
├── docs/
│   ├── contexto/
│   ├── diagramas/
│   │   ├── mysql/
│   │   ├── oracle/
│   │   ├── postgresql/
│   │   └── sql-server/
│   └── informes/
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
│   └── 10-verificacion-final/
│
├── .gitignore
└── README.md
```

## Autor

**Jairo de Jesús Varón Hernández**

Proyecto académico — Ingeniería de Sistemas
