# Motores de Bases de Datos

Proyecto académico para la **implementación, configuración, conexión, administración y validación de cuatro motores de bases de datos** utilizando Docker, Docker Compose, WSL y DBeaver.

El proyecto forma parte del desarrollo de **EnlaceExpress**, una plataforma de mensajería corporativa orientada a la gestión de empresas, envíos, paquetes, seguimiento, rutas, tarifas, pruebas de entrega y facturación.

El mismo modelo lógico de **EnlaceExpress** fue implementado en cuatro motores de bases de datos, realizando las adaptaciones necesarias según las características de cada sistema.

---

## Motores implementados

Los cuatro motores de bases de datos implementados son:

* **MySQL 8.0**
* **PostgreSQL 17**
* **SQL Server 2022**
* **Oracle Database XE 21c**

Los motores fueron configurados como servicios independientes.

Se verificó:

* Funcionamiento.
* Conectividad.
* Ejecución de scripts.
* Estructura de las bases de datos.
* Persistencia de datos.
* Inserción de datos.
* Ejecución de consultas.
* Respaldos.
* Ejecución simultánea.
* Administración mediante DBeaver.
* Administración mediante herramientas gráficas propias de cada motor.

---

## Herramientas utilizadas

* Docker
* Docker Compose
* WSL / Ubuntu
* DBeaver
* MySQL Workbench
* pgAdmin 4
* SQL Server Management Studio (SSMS)
* Oracle SQL Developer
* Git
* GitHub
* Visual Studio Code

---

# Bases de datos

La estructura de **EnlaceExpress** se encuentra implementada en los cuatro motores solicitados.

Para cada motor se dispone de:

1. **Script DDL:** contiene la definición de la estructura de la base de datos.
2. **Script de inserción:** contiene los datos utilizados para poblar las tablas de cada motor.
3. **Archivo CSV:** contiene los datos utilizados como base para las consultas SQL avanzadas y la validación de resultados.
4. **Administración mediante DBeaver:** utilizada para conexión, ejecución y verificación.
5. **Administración mediante la GUI propia del motor:** utilizada para una segunda comprobación.
6. **Documentación específica:** explica la configuración de cada motor.
7. **Evidencias:** organizadas por motor y por etapa del proyecto.
8. **Diagrama ER:** representa visualmente la estructura implementada.

---

## Implementaciones DDL

| Motor      | Base de datos / esquema     | DDL                                                                     |
| ---------- | --------------------------- | ----------------------------------------------------------------------- |
| MySQL      | `enlace_express`            | [DDL MySQL](database/mysql/enlace_express_mysql_ddl.sql)                |
| PostgreSQL | `enlace_express` / `public` | [DDL PostgreSQL](database/postgresql/enlace_express_postgresql_ddl.sql) |
| SQL Server | `enlace_express` / `dbo`    | [DDL SQL Server](database/sql-server/enlace_express_sqlserver_ddl.sql)  |
| Oracle     | `ENLACE_EXPRESS`            | [DDL Oracle](database/oracle/enlace_express_oracle_ddl.sql)             |

---

## Datos e inserciones

Cada motor cuenta con los archivos necesarios para reproducir la carga de datos utilizada durante las pruebas y consultas.

| Motor      | Datos CSV                                                                                      | Script de inserción                                                |
| ---------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| MySQL      | [datos_enlace_express_mysql.csv](database/mysql/datos_enlace_express_mysql.csv)                | [inserts_mysql.sql](database/mysql/inserts_mysql.sql)              |
| PostgreSQL | [datos_enlace_express_postgresql.csv](database/postgresql/datos_enlace_express_postgresql.csv) | [insert_postgresql.sql](database/postgresql/insert_postgresql.sql) |
| SQL Server | [datos_enlace_express_sqlserver.csv](database/sql-server/datos_enlace_express_sqlserver.csv)   | [insert_sqlserver.sql](database/sql-server/insert_sqlserver.sql)   |
| Oracle     | [datos_enlace_express_oracle.csv](database/oracle/datos_enlace_express_oracle.csv)             | [inserts_oracle.sql](database/oracle/inserts_oracle.sql)           |

### Propósito de los archivos

Los archivos cumplen funciones diferentes:

* **`.sql` DDL:** crea la estructura de tablas, claves, relaciones y demás elementos de la base de datos.
* **`insert*.sql`:** contiene los registros que fueron insertados en cada motor.
* **`.csv`:** contiene los datos utilizados como referencia para realizar y validar las consultas SQL avanzadas.

De esta manera, cada motor cuenta con su propia estructura y con los datos necesarios para reproducir las pruebas realizadas durante el proyecto.

---

## Documentación específica

La documentación de cada motor se encuentra organizada en:

* [MySQL](database/mysql/)
* [PostgreSQL](database/postgresql/)
* [SQL Server](database/sql-server/)
* [Oracle](database/oracle/)

---

# Estructura de la base de datos

El proyecto cuenta actualmente con **18 tablas**:

1. `auditoria`
2. `contactos`
3. `direcciones`
4. `empresas`
5. `envios`
6. `eventos_tracking`
7. `facturas`
8. `mensajeros`
9. `paquetes`
10. `pruebas_entrega`
11. `refresh_tokens`
12. `resource_roles`
13. `resources`
14. `role_users`
15. `roles`
16. `rutas`
17. `tarifas`
18. `users`

Estas tablas se encuentran implementadas en los cuatro motores.

El modelo incluye las entidades principales del negocio y las estructuras relacionadas con autenticación, autorización y RBAC.

---

# Usuarios y RBAC

El proyecto incluye un sistema de usuarios y control de acceso basado en roles.

Las principales tablas relacionadas son:

* `users`
* `roles`
* `role_users`
* `resources`
* `resource_roles`
* `refresh_tokens`
* `auditoria`

Los roles definidos son:

* `ADMIN`
* `CLIENTE_EMPRESA`
* `DESPACHO`
* `MENSAJERO`
* `FACTURACION`
* `OPERADOR`

Los recursos representan rutas y métodos de la API.

Algunos ejemplos son:

```text
POST /envios

POST /asignaciones

POST /tracking

POST /facturas/consolidar
```

La relación entre usuarios y roles se realiza mediante `role_users`.

La relación entre roles y recursos se realiza mediante `resource_roles`.

---

# Consultas SQL Avanzadas

Como parte del proyecto se desarrollaron **38 consultas SQL avanzadas** sobre la base de datos EnlaceExpress.

Las consultas fueron adaptadas y ejecutadas en:

* MySQL
* PostgreSQL
* SQL Server
* Oracle XE

Se trabajaron diferentes operaciones de SQL, entre ellas:

* Filtros con `WHERE`.
* Operadores `AND`, `IN`, `BETWEEN` y `LIKE`.
* Ordenamiento de resultados.
* Funciones de agregación.
* `GROUP BY` y `HAVING`.
* `INNER JOIN`.
* `LEFT JOIN`.
* Subconsultas.
* `EXISTS`.
* `CASE`.
* `COALESCE`.
* CTE.
* Funciones de ventana.
* `RANK`.
* `ROW_NUMBER`.
* `UNION`.
* Consultas relacionadas con usuarios y roles.
* Consultas de seguimiento y facturación.
* Consultas de resumen y análisis de datos.

La documentación completa se encuentra en:

* [Consultas SQL Avanzadas](docs/CONSULTAS-AVANZADAS.md)

Las evidencias están organizadas por motor:

* [Evidencias MySQL](evidencias/11-consultas-avanzadas/01-mysql/)
* [Evidencias PostgreSQL](evidencias/11-consultas-avanzadas/02-postgresql/)
* [Evidencias SQL Server](evidencias/11-consultas-avanzadas/03-sql-server/)
* [Evidencias Oracle](evidencias/11-consultas-avanzadas/04-oracle/)

En total, se cuenta con las evidencias correspondientes a las **38 consultas ejecutadas en cada uno de los cuatro motores**.

Los archivos CSV almacenados en `database/` contienen los datos utilizados como referencia para estas consultas, mientras que los scripts de inserción permiten reproducir la carga de datos utilizada en cada motor.

---

# Documentación

## Informes

Los informes académicos se encuentran en:

* [01 - Implementación de Motores de Base de Datos](docs/informes/01-INFORME_IMPLEMENTACIÓN_MOTORES_BASE_DATOS.md)
* [02 - Informe Inicial del Proyecto Integrador](docs/informes/02-INFORME_INICIAL_PROYECTO_INTEGRADOR.md)
* [03 - Verificación de Bases de Datos](docs/informes/03-INFORME_VERIFICACION_BASES_DE_DATOS.md)

---

## Contexto del proyecto

La información general del dominio, arquitectura, entidades, relaciones y estado actual del proyecto se encuentra en:

* [Contexto del Proyecto EnlaceExpress](docs/contexto/CONTEXTO_DEL_PROYECTO_ENLEEXPRESS.md)

---

# Metodología MIRIA

El proyecto también cuenta con documentación relacionada con la metodología **MIRIA – Integración Responsable de IA para el Aprendizaje**.

La documentación se encuentra organizada por semana:

```text
docs/semanas/

├── semana01/
│   ├── METODOLOGIA-MIRA-SEMANA-01.md
│   └── README.md
│
├── semana02/
│   ├── METODOLOGIA-MIRA-SEMANA-02.md
│   └── README.md
│
└── semana03/
    ├── METODOLOGIA-MIRA-SEMANA-03.md
    └── README.md
```

Cada semana documenta:

* Objetivo.
* Requisitos.
* Criterios de aceptación.
* Actividades.
* Evidencias.
* Issues.
* Gate semanal.
* Gate Learning.
* Retrospectiva.
* Uso de IA.
* Verificación humana.
* Estado final.

---

## Bitácora general

El proceso general del proyecto se registra en:

* [Bitácora general del proyecto](docs/PROCESO.md)

La bitácora registra:

* Propósito.
* Decisiones.
* Cambios.
* Pruebas.
* Problemas encontrados.
* Soluciones.
* Uso de IA.
* Verificación humana.
* Estado del proyecto.
* Próximas acciones.

---

# Evidencias de GUI

Las evidencias de administración y verificación gráfica de los cuatro motores se encuentran documentadas en:

* [Evidencias de GUI – DBeaver y herramientas propias](evidencias/GUI.md)

Este documento reúne evidencias realizadas mediante:

* DBeaver.
* MySQL Workbench.
* pgAdmin 4.
* SQL Server Management Studio.
* Oracle SQL Developer.

---

# Servicios Docker

Los archivos necesarios para ejecutar los cuatro motores mediante Docker y Docker Compose se encuentran organizados en:

```text
services/motores-bd/
```

Cada motor cuenta con su propio archivo `docker-compose.yml` y documentación específica.

También se incluyen scripts para facilitar la ejecución y detención de los servicios:

* `start-all.sh` — inicia los servicios de los cuatro motores.
* `stop-all.sh` — detiene los servicios de los cuatro motores.

---

## Servicios disponibles

* [MySQL](services/motores-bd/mysql/)
* [PostgreSQL](services/motores-bd/postgres/)
* [SQL Server](services/motores-bd/mssql/)
* [Oracle](services/motores-bd/oracle/)

> Los archivos `.env` utilizados para configurar credenciales y variables de entorno no forman parte del repositorio por razones de seguridad.

---

# Diagramas ER

Los diagramas entidad-relación de cada motor se encuentran organizados individualmente:

* [MySQL](docs/diagramas/mysql/ER-diagram.jpg)
* [PostgreSQL](docs/diagramas/postgresql/ER-diagram.jpg)
* [SQL Server](docs/diagramas/sql-server/ER-diagram.jpg)
* [Oracle XE](docs/diagramas/oracle/ER-diagram.jpg)

Los diagramas permiten visualizar las tablas y relaciones principales de cada implementación.

---

# Evidencias

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
* [11 - Consultas SQL Avanzadas](evidencias/11-consultas-avanzadas/)
* [GUI - Evidencias gráficas](evidencias/GUI.md)

Las evidencias documentan:

* Configuración de los motores.
* Configuración de Docker.
* Ejecución de contenedores.
* Conexiones mediante DBeaver.
* Administración mediante herramientas gráficas propias.
* Pruebas de funcionamiento.
* Inserción y consulta de datos.
* Persistencia de datos.
* Respaldos.
* Verificación de servicios.
* Puertos y redes.
* Ejecución simultánea de los motores.
* Ejecución de consultas SQL avanzadas.
* Verificación final del entorno.

---

# Persistencia y respaldos

El proyecto incluye evidencias específicas relacionadas con la conservación de los datos y los procesos de respaldo.

## Persistencia

Las evidencias se encuentran en:

```text
evidencias/08-persistencia/
```

## Backups

Las evidencias se encuentran en:

```text
evidencias/09-backups/
```

Estas evidencias permiten comprobar las pruebas realizadas sobre la conservación y respaldo de la información.

---

# Verificación final

Las verificaciones generales del entorno se encuentran en:

```text
evidencias/10-verificacion-final/
```

Se verificaron principalmente:

* Servicios Docker.
* Contenedores.
* Puertos.
* Estructura de directorios.
* Datos.
* Conexiones.
* DBeaver.
* Scripts de inicio y detención.

---

# Estructura del proyecto

```text
bdii-2026ii-jairovaron404/

├── database/
│   ├── mysql/
│   │   ├── enlace_express_mysql_ddl.sql
│   │   ├── inserts_mysql.sql
│   │   ├── datos_enlace_express_mysql.csv
│   │   └── README.md
│   │
│   ├── oracle/
│   │   ├── enlace_express_oracle_ddl.sql
│   │   ├── inserts_oracle.sql
│   │   ├── datos_enlace_express_oracle.csv
│   │   └── README.md
│   │
│   ├── postgresql/
│   │   ├── enlace_express_postgresql_ddl.sql
│   │   ├── insert_postgresql.sql
│   │   ├── datos_enlace_express_postgresql.csv
│   │   └── README.md
│   │
│   └── sql-server/
│       ├── enlace_express_sqlserver_ddl.sql
│       ├── insert_sqlserver.sql
│       ├── datos_enlace_express_sqlserver.csv
│       └── README.md
│
├── docs/
│   ├── CONSULTAS-AVANZADAS.md
│   ├── PROCESO.md
│   │
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
│   ├── informes/
│   │   ├── 01-INFORME_IMPLEMENTACIÓN_MOTORES_BASE_DATOS.md
│   │   ├── 02-INFORME_INICIAL_PROYECTO_INTEGRADOR.md
│   │   └── 03-INFORME_VERIFICACION_BASES_DE_DATOS.md
│   │
│   └── semanas/
│       ├── semana01/
│       │   ├── METODOLOGIA-MIRA-SEMANA-01.md
│       │   └── README.md
│       │
│       ├── semana02/
│       │   ├── METODOLOGIA-MIRA-SEMANA-02.md
│       │   └── README.md
│       │
│       └── semana03/
│           ├── METODOLOGIA-MIRA-SEMANA-03.md
│           └── README.md
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
│   ├── 11-consultas-avanzadas/
│   │   ├── 01-mysql/
│   │   ├── 02-postgresql/
│   │   ├── 03-sql-server/
│   │   └── 04-oracle/
│   └── GUI.md
│
├── services/
│   └── motores-bd/
│       ├── mssql/
│       │   ├── docker-compose.yml
│       │   └── README.md
│       │
│       ├── mysql/
│       │   ├── docker-compose.yml
│       │   └── README.md
│       │
│       ├── oracle/
│       │   ├── docker-compose.yml
│       │   └── README.md
│       │
│       ├── postgres/
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

---

# Estado actual

Los cuatro motores requeridos se encuentran configurados y verificados:

| Motor      | Versión | Estado                   |
| ---------- | ------- | ------------------------ |
| MySQL      | 8.0     | Configurado y verificado |
| PostgreSQL | 17      | Configurado y verificado |
| SQL Server | 2022    | Configurado y verificado |
| Oracle     | XE 21c  | Configurado y verificado |

Actualmente los cuatro motores cuentan con las **18 tablas principales de EnlaceExpress**, sus estructuras correspondientes y sus respectivos scripts DDL.

También se cuenta con:

* Servicios Docker.
* Conexiones mediante DBeaver.
* Herramientas gráficas nativas.
* Diagramas ER.
* Evidencias.
* Datos de prueba.
* Scripts de inserción para los cuatro motores.
* Archivos CSV utilizados como referencia para las consultas.
* Persistencia.
* Backups.
* Documentación.
* Consultas SQL avanzadas.
* 38 consultas ejecutadas por motor.
* Evidencias de las consultas.
* Metodología MIRIA.
* Bitácora general del proyecto.
* Control de versiones mediante Git.

---

# Autor

**Jairo de Jesús Varón Hernández**

Proyecto académico — Ingeniería de Sistemas
