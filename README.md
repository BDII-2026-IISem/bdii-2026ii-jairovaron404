# Motores de Bases de Datos

Proyecto académico para la **implementación, configuración, conexión, administración y validación de cuatro motores de bases de datos** utilizando Docker, Docker Compose, WSL y DBeaver.

El proyecto forma parte del desarrollo de **EnlaceExpress**, una plataforma de mensajería corporativa orientada a la gestión de empresas, envíos, paquetes, seguimiento, rutas, tarifas, pruebas de entrega y facturación.

Como parte del proyecto se implementó el mismo modelo lógico en cuatro motores de bases de datos, realizando las adaptaciones necesarias según las características de cada sistema.

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
2. **Administración mediante DBeaver:** utilizada para conexión, ejecución y verificación.
3. **Administración mediante la GUI propia del motor:** utilizada para una segunda comprobación.
4. **Documentación específica:** explica la configuración de cada motor.
5. **Evidencias:** organizadas por motor y por etapa del proyecto.
6. **Diagrama ER:** representa visualmente la estructura implementada.

---

## Implementaciones DDL

| Motor      | Base de datos / esquema     | DDL                                                                     |
| ---------- | --------------------------- | ----------------------------------------------------------------------- |
| MySQL      | `enlace_express`            | [DDL MySQL](database/mysql/enlace_express_mysql_ddl.sql)                |
| PostgreSQL | `enlace_express` / `public` | [DDL PostgreSQL](database/postgresql/enlace_express_postgresql_ddl.sql) |
| SQL Server | `enlace_express` / `dbo`    | [DDL SQL Server](database/sql-server/enlace_express_sqlserver_ddl.sql)  |
| Oracle     | `ENLACE_EXPRESS`            | [DDL Oracle](database/oracle/enlace_express_oracle_ddl.sql)             |

La documentación específica de cada implementación se encuentra en:

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

El modelo incluye tanto las entidades principales del negocio como las estructuras relacionadas con autenticación, autorización y RBAC.

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
* [GUI - Evidencias gráficas](evidencias/GUI.md)

Las evidencias documentan:

* Configuración de los motores.
* Configuración de Docker.
* Ejecución de contenedores.
* Conexiones mediante DBeaver.
* Administración mediante las herramientas gráficas propias.
* Pruebas de funcionamiento.
* Persistencia de datos.
* Respaldos.
* Verificación de servicios.
* Puertos y redes.
* Ejecución simultánea de los motores.
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

Estas evidencias permiten comprobar que se realizaron pruebas relacionadas con la conservación y respaldo de la información.

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
* Persistencia.
* Backups.
* Documentación.
* Metodología MIRIA.
* Bitácora general del proyecto.
* Control de versiones mediante Git.

---

# Próximas etapas

La configuración inicial de los cuatro motores se encuentra completada.

Las siguientes etapas del proyecto pueden continuar con la integración de las bases de datos con el backend de EnlaceExpress y con los demás componentes definidos en la guía.

Entre las actividades previstas se encuentran:

* Integración con NestJS.
* Configuración de Sequelize.
* Migraciones.
* Seeders.
* Conexión con los motores.
* Casos de uso.
* Autenticación.
* Autorización.
* RBAC.
* Pruebas unitarias.
* Pruebas de integración.
* Pruebas E2E.
* Swagger.
* Pruebas de API.
* Verificación de portabilidad.

Las nuevas actividades deberán continuar registrándose en la documentación, evidencias y control de versiones del proyecto.

---

# Autor

**Jairo de Jesús Varón Hernández**

Proyecto académico — Ingeniería de Sistemas
