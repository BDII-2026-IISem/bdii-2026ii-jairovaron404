# CONTEXTO DEL PROYECTO – ENLACEEXPRESS

## 1. Información general

Estoy desarrollando un proyecto académico llamado **EnlaceExpress**, relacionado con una plataforma de mensajería corporativa, gestión de envíos, seguimiento de paquetes, tarifas y facturación.

El proyecto se desarrolla dentro de la carrera de **Ingeniería de Sistemas** y una de sus partes principales consiste en trabajar con diferentes motores de bases de datos.

El objetivo es implementar el mismo modelo lógico de EnlaceExpress en cuatro motores:

* MySQL
* PostgreSQL
* Microsoft SQL Server
* Oracle

La finalidad es mantener la misma lógica de negocio y estructura general en los cuatro motores, realizando las adaptaciones necesarias según las características y el dialecto SQL de cada sistema.

Actualmente los cuatro motores se encuentran configurados y cuentan con la estructura de la base de datos implementada.

---

# 2. Herramientas y plataformas utilizadas

Durante el desarrollo del proyecto se han utilizado principalmente las siguientes herramientas.

## Sistema operativo

* Windows 11

## Entorno Linux

* Ubuntu mediante WSL (Windows Subsystem for Linux)

WSL se utiliza como parte del entorno de trabajo y para administrar diferentes elementos relacionados con los servicios de bases de datos.

## Docker

Docker se utiliza para ejecutar y administrar los servicios de los motores de bases de datos.

Cada motor cuenta con su propia configuración y servicio independiente.

## DBeaver

**DBeaver** es la herramienta principal utilizada para conectarse y administrar las cuatro bases de datos.

Desde DBeaver se han realizado tareas como:

* Conexiones.
* Ejecución de scripts SQL.
* Consultas.
* Revisión de tablas.
* Revisión de columnas.
* Revisión de tipos de datos.
* Revisión de claves.
* Revisión de restricciones.
* Revisión de índices.
* Revisión de triggers.
* Generación y revisión de DDL.
* Comparación de estructuras entre motores.

---

# 3. Herramientas gráficas nativas

Además de DBeaver, cada motor fue revisado utilizando una herramienta gráfica propia.

| Motor                | Herramienta                  |
| -------------------- | ---------------------------- |
| MySQL                | MySQL Workbench              |
| PostgreSQL           | pgAdmin 4                    |
| Microsoft SQL Server | SQL Server Management Studio |
| Oracle               | Oracle SQL Developer         |

Estas herramientas se utilizaron como una segunda forma de comprobar la existencia de las bases de datos y sus estructuras.

Las evidencias se encuentran organizadas dentro de:

```text
evidencias/
```

y específicamente en:

```text
evidencias/07-dbeaver/
```

---

# 4. Base de datos del proyecto

El nombre utilizado para la base de datos es:

```text
enlace_express
```

En Oracle se utiliza el usuario/esquema:

```text
ENLACE_EXPRESS
```

La intención es que los cuatro motores representen el mismo modelo de negocio.

Debido a las diferencias propias de cada sistema, algunos elementos físicos como tipos de datos, nombres de esquemas, mecanismos de identidad y restricciones pueden variar sin modificar la lógica del modelo.

---

# 5. Motores de bases de datos configurados

Actualmente los cuatro motores requeridos por el proyecto se encuentran configurados:

1. MySQL
2. PostgreSQL
3. Microsoft SQL Server
4. Oracle

Cada motor cuenta con su propio script DDL dentro del repositorio.

La estructura es:

```text
database/
├── mysql/
│   ├── README.md
│   └── enlace_express_mysql_ddl.sql
├── postgresql/
│   ├── README.md
│   └── enlace_express_postgresql_ddl.sql
├── sql-server/
│   ├── README.md
│   └── enlace_express_sqlserver_ddl.sql
└── oracle/
    ├── README.md
    └── enlace_express_oracle_ddl.sql
```

---

# 6. MySQL

MySQL fue configurado como uno de los motores principales del proyecto.

Base de datos:

```text
enlace_express
```

Entre las características utilizadas se encuentran:

* InnoDB.
* UTF8MB4.
* `AUTO_INCREMENT`.
* `VARCHAR`.
* `DATETIME`.
* `DECIMAL`.
* `ENUM`.
* PRIMARY KEY.
* FOREIGN KEY.
* UNIQUE.
* INDEX.
* `CURRENT_TIMESTAMP`.
* Triggers y otros objetos definidos por el modelo.

La estructura fue revisada mediante DBeaver y MySQL Workbench.

El DDL correspondiente se encuentra en:

```text
database/mysql/enlace_express_mysql_ddl.sql
```

---

# 7. PostgreSQL

PostgreSQL fue configurado utilizando la base:

```text
enlace_express
```

Entre las características utilizadas se encuentran:

* `GENERATED ALWAYS AS IDENTITY`.
* `VARCHAR`.
* `TIMESTAMP`.
* `NUMERIC`.
* Tipos ENUM personalizados.
* PRIMARY KEY.
* FOREIGN KEY.
* UNIQUE.
* INDEX.
* TRIGGERS.

PostgreSQL utiliza tipos ENUM para representar diferentes estados del sistema.

Entre ellos:

* `estado_usuario`
* `estado_recurso`
* `estado_rol`
* `estado_envio`
* `prioridad_envio`
* `estado_factura`
* `estado_paquete`
* `tipo_prueba_entrega`

La estructura fue revisada mediante consultas y desde DBeaver.

También se utilizó pgAdmin 4 para realizar una verificación adicional.

El DDL correspondiente se encuentra en:

```text
database/postgresql/enlace_express_postgresql_ddl.sql
```

---

# 8. Microsoft SQL Server

Microsoft SQL Server fue configurado como el tercer motor del proyecto.

Base de datos:

```text
enlace_express
```

Esquema:

```text
dbo
```

Entre las características utilizadas se encuentran:

* `IDENTITY(1,1)`.
* `VARCHAR`.
* `DATETIME2`.
* `DECIMAL`.
* `DATE`.
* PRIMARY KEY.
* FOREIGN KEY.
* UNIQUE.
* INDEX.
* CHECK CONSTRAINTS.
* TRIGGERS.

SQL Server no utiliza ENUM de la misma manera que MySQL o PostgreSQL.

Por esta razón, los valores controlados se implementan mediante restricciones `CHECK`.

Entre los campos que utilizan valores controlados se encuentran:

* Estados.
* Prioridades.
* `is_active`.
* Tipos de prueba.

También se implementaron triggers para actualizar automáticamente campos como `updated_at` cuando corresponde.

El DDL correspondiente se encuentra en:

```text
database/sql-server/enlace_express_sqlserver_ddl.sql
```

La estructura fue revisada mediante DBeaver y SQL Server Management Studio.

---

# 9. Oracle

Oracle es el cuarto motor configurado para el proyecto.

Se utiliza el usuario/esquema:

```text
ENLACE_EXPRESS
```

Entre las características utilizadas se encuentran:

* `NUMBER`.
* `VARCHAR2`.
* `TIMESTAMP`.
* `DATE`.
* Identity Columns.
* PRIMARY KEY.
* FOREIGN KEY.
* UNIQUE.
* INDEX.
* CHECK CONSTRAINTS.
* TRIGGERS.

Los identificadores utilizan columnas Identity.

Oracle puede mostrar internamente valores relacionados con secuencias utilizadas por Identity Columns, como:

```text
ISEQ$$_...
```

Estos valores corresponden al funcionamiento interno de Oracle y no representan un problema en la estructura del proyecto.

La estructura fue revisada mediante DBeaver y Oracle SQL Developer.

El DDL correspondiente se encuentra en:

```text
database/oracle/enlace_express_oracle_ddl.sql
```

---

# 10. Estructura de las tablas

El proyecto cuenta actualmente con **18 tablas**.

Son:

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

Las 18 tablas se encuentran implementadas en los cuatro motores.

---

# 11. Módulo de usuarios y RBAC

El proyecto incluye un sistema de usuarios y control de acceso basado en roles.

Las principales tablas relacionadas son:

* `users`
* `roles`
* `role_users`
* `resources`
* `resource_roles`
* `refresh_tokens`

También existe:

* `auditoria`

para registrar información relacionada con la trazabilidad del sistema.

Los roles definidos conceptualmente son:

* ADMIN
* CLIENTE_EMPRESA
* DESPACHO
* MENSAJERO
* FACTURACION
* OPERADOR

Los recursos representan rutas HTTP y métodos de la API.

Algunos ejemplos son:

```text
POST /envios
POST /asignaciones
POST /tracking
POST /facturas/consolidar
```

La relación entre usuarios y roles se realiza mediante:

```text
role_users
```

La relación entre roles y recursos se realiza mediante:

```text
resource_roles
```

Esto permite representar el control de acceso basado en roles.

---

# 12. Tabla refresh_tokens

La tabla `refresh_tokens` forma parte del sistema de autenticación.

Su estructura real contiene:

* `id`
* `user_id`
* `token`
* `expires_at`
* `revoked_at`
* `created_at`

Esta estructura corresponde a la implementación actual.

No se deben agregar campos pertenecientes a versiones anteriores de la guía sin una decisión posterior que lo justifique.

---

# 13. Módulo de negocio

Las principales entidades de negocio son:

* Empresa.
* Contacto.
* Dirección.
* Envío.
* Paquete.
* Evento de tracking.
* Mensajero.
* Ruta.
* Tarifa.
* Prueba de entrega.
* Factura.

Estas entidades representan el funcionamiento principal de EnlaceExpress.

---

# 14. Relaciones principales

## Empresas

Una empresa puede tener:

* Contactos.
* Direcciones.
* Envíos.
* Facturas.

## Envíos

Un envío pertenece a una empresa.

También puede relacionarse con:

* Mensajero.
* Ruta.
* Tarifa.
* Dirección de recogida.
* Dirección de entrega.
* Paquetes.
* Eventos de tracking.
* Pruebas de entrega.
* Factura.

## Usuarios y roles

Los usuarios se relacionan con los roles mediante:

```text
role_users
```

Los roles se relacionan con los recursos mediante:

```text
resource_roles
```

Esto permite implementar el sistema RBAC.

---

# 15. Equivalencia entre motores

El objetivo del proyecto no es que la sintaxis física de los cuatro motores sea idéntica.

El objetivo es mantener un **modelo lógico equivalente**.

Por ejemplo:

## Identificadores

MySQL:

```text
AUTO_INCREMENT
```

PostgreSQL:

```text
IDENTITY
```

SQL Server:

```text
IDENTITY(1,1)
```

Oracle:

```text
IDENTITY
```

Los cuatro mecanismos cumplen la función de generar identificadores automáticamente.

## Texto

MySQL:

```text
VARCHAR
```

PostgreSQL:

```text
VARCHAR
```

SQL Server:

```text
VARCHAR
```

Oracle:

```text
VARCHAR2
```

## Fechas y horas

MySQL:

```text
DATETIME
```

PostgreSQL:

```text
TIMESTAMP
```

SQL Server:

```text
DATETIME2
```

Oracle:

```text
TIMESTAMP
```

## Números decimales

MySQL:

```text
DECIMAL
```

PostgreSQL:

```text
NUMERIC
```

SQL Server:

```text
DECIMAL
```

Oracle:

```text
NUMBER
```

Por ejemplo:

```text
DECIMAL(12,2)
NUMERIC(12,2)
DECIMAL(12,2)
NUMBER(12,2)
```

representan conceptualmente el mismo tipo de dato numérico con dos posiciones decimales.

---

# 16. Estados

En MySQL y PostgreSQL se utilizan ENUM para algunos estados.

En SQL Server y Oracle se utilizan restricciones `CHECK`.

Entre los estados del envío se encuentran:

* CREADO
* ASIGNADO
* EN_RECOGIDA
* EN_TRANSITO
* EN_ENTREGA
* ENTREGADO
* CANCELADO
* CON_NOVEDAD

La prioridad del envío utiliza:

* BAJA
* NORMAL
* ALTA
* URGENTE

El estado de factura utiliza:

* PENDIENTE
* EMITIDA
* PAGADA
* ANULADA
* VENCIDA

El estado del paquete utiliza:

* REGISTRADO
* EN_TRANSITO
* ENTREGADO
* DEVUELTO
* CON_NOVEDAD

---

# 17. Campos de auditoría y fechas

Las tablas que manejan información de creación y actualización utilizan, cuando corresponde:

* `created_at`
* `updated_at`

La forma de manejar estos campos cambia dependiendo del motor.

## MySQL

Utiliza principalmente:

```text
DEFAULT CURRENT_TIMESTAMP
```

y:

```text
ON UPDATE CURRENT_TIMESTAMP
```

## PostgreSQL

Utiliza:

```text
DEFAULT CURRENT_TIMESTAMP
```

y triggers cuando es necesario actualizar automáticamente `updated_at`.

## SQL Server

Utiliza valores por defecto como:

```text
GETDATE()
```

y triggers para actualizar `updated_at` cuando corresponde.

## Oracle

Utiliza valores por defecto como:

```text
CURRENT_TIMESTAMP
```

y triggers `BEFORE UPDATE` cuando es necesario actualizar `updated_at`.

---

# 18. Tablas que no tienen updated_at

Se mantiene el modelo real del proyecto.

No todas las tablas necesitan tener `updated_at`.

Entre las tablas que actualmente no utilizan este campo se encuentran:

* `auditoria`
* `eventos_tracking`
* `pruebas_entrega`
* `refresh_tokens`
* `role_users`
* `roles`
* `tarifas`
* `users`

No se agregan campos únicamente para hacer que la estructura física de los cuatro motores sea idéntica.

La prioridad es mantener la misma lógica del modelo.

---

# 19. DDL de los cuatro motores

Cada motor cuenta con su propio script DDL.

## MySQL

```text
database/mysql/enlace_express_mysql_ddl.sql
```

## PostgreSQL

```text
database/postgresql/enlace_express_postgresql_ddl.sql
```

## SQL Server

```text
database/sql-server/enlace_express_sqlserver_ddl.sql
```

## Oracle

```text
database/oracle/enlace_express_oracle_ddl.sql
```

Estos scripts permiten conservar una versión reproducible de la estructura de cada base de datos.

---

# 20. Diagramas

El repositorio cuenta con diagramas de estructura para cada motor.

Se encuentran organizados en:

```text
docs/diagramas/
├── mysql/
├── postgresql/
├── sql-server/
└── oracle/
```

Los diagramas permiten comprobar visualmente las tablas y sus relaciones.

---

# 21. Verificaciones realizadas

Durante el desarrollo se realizaron verificaciones de:

* Existencia de las 18 tablas.
* Nombres de tablas.
* Columnas.
* Tipos de datos.
* Longitudes.
* Valores NULL.
* Valores por defecto.
* Claves primarias.
* Claves foráneas.
* Restricciones UNIQUE.
* Índices.
* CHECK constraints.
* ENUM.
* Triggers.
* Identity.
* Auto Increment.
* Esquemas.
* Conexiones.
* Funcionamiento de los servicios.

Las verificaciones se realizaron principalmente mediante DBeaver y también mediante las herramientas nativas de cada motor.

---

# 22. Persistencia

Los motores se ejecutan utilizando servicios configurados para conservar los datos.

Se realizaron pruebas de persistencia para comprobar que la información permaneciera disponible después de reiniciar los servicios correspondientes.

Las evidencias relacionadas se encuentran en:

```text
evidencias/08-persistencia/
```

---

# 23. Respaldos

Se realizaron procesos de respaldo para comprobar la conservación de la información.

Las evidencias relacionadas con los respaldos se encuentran en:

```text
evidencias/09-backups/
```

También existen evidencias específicas dentro de las carpetas correspondientes a cada motor.

---

# 24. Funcionamiento simultáneo

Los cuatro motores fueron configurados como servicios independientes.

También se realizaron verificaciones relacionadas con:

* Contenedores.
* Puertos.
* Redes.
* Servicios ejecutándose simultáneamente.

Las evidencias generales se encuentran en:

```text
evidencias/06-entorno-general/
```

---

# 25. Evidencias de DBeaver

Se cuenta con evidencias del uso de DBeaver para los cuatro motores.

Estas evidencias se encuentran en:

```text
evidencias/07-dbeaver/
```

También existe un documento específico que organiza las evidencias de las herramientas gráficas:

```text
evidencias/GUI.md
```

Este documento reúne evidencias de:

* DBeaver.
* MySQL Workbench.
* pgAdmin 4.
* SQL Server Management Studio.
* Oracle SQL Developer.

---

# 26. Metodología MIRIA

El proceso del proyecto también se está documentando utilizando la metodología **MIRIA – Integración Responsable de IA para el Aprendizaje**.

Las primeras tres semanas se documentan en:

```text
docs/semanas/
├── MIRIA-semana-01.md
├── MIRIA-semana-02.md
└── MIRIA-semana-03.md
```

También existe una bitácora general:

```text
docs/proceso.md
```

Los documentos registran:

* Objetivos.
* Requisitos.
* Criterios de aceptación.
* Evidencias.
* Issues.
* Gates.
* Gate Learning.
* Retrospectivas.
* Uso de IA.
* Verificación humana.
* Estado del trabajo.

---

# 27. Uso de inteligencia artificial

La inteligencia artificial se ha utilizado como herramienta de apoyo durante el desarrollo.

Entre sus usos se encuentran:

* Resolver dudas técnicas.
* Revisar comandos SQL.
* Analizar estructuras.
* Revisar relaciones entre tablas.
* Comparar dialectos SQL.
* Ayudar con configuraciones.
* Analizar errores.
* Organizar documentación.
* Proponer soluciones para problemas técnicos.
* Apoyar la elaboración de informes y bitácoras.

La IA no se utiliza como sustituto de la verificación.

Las soluciones propuestas se comprueban mediante la ejecución de comandos, pruebas de conexión, revisión de estructuras y herramientas de administración.

---

# 28. Verificación humana

Las propuestas y cambios realizados con apoyo de IA son revisados antes de incorporarse al proyecto.

La verificación se realiza mediante:

* Ejecución de scripts.
* Consultas SQL.
* DBeaver.
* MySQL Workbench.
* pgAdmin 4.
* SQL Server Management Studio.
* Oracle SQL Developer.
* Docker.
* WSL.

Esto permite comprobar que las soluciones funcionen realmente dentro del entorno del proyecto.

---

# 29. Arquitectura del proyecto

El proyecto EnlaceExpress está orientado a una arquitectura backend moderna.

Se contemplan conceptos como:

* NestJS.
* Sequelize.
* Clean Architecture.
* Domain-Driven Design (DDD).
* RBAC.
* APIs REST.
* Autenticación.
* Autorización.
* Bases de datos relacionales.

La base de datos representa una parte del sistema.

La arquitectura completa contempla posteriormente elementos como:

* Entidades de dominio.
* Casos de uso.
* Repositorios.
* Autenticación.
* Autorización.
* RBAC.
* Pruebas unitarias.
* Pruebas de integración.
* Pruebas E2E.
* Swagger.
* Manejo de errores.
* Paginación.
* Filtros.
* Trazabilidad.
* Migraciones.
* Seeders.
* Pruebas de API.
* Documentación.

---

# 30. Organización actual del repositorio

La estructura principal del proyecto se encuentra organizada de la siguiente manera:

```text
bdii-2026ii-jairovaron404/
├── database/
│   ├── mysql/
│   ├── postgresql/
│   ├── sql-server/
│   └── oracle/
│
├── docs/
│   ├── contexto/
│   ├── diagramas/
│   ├── informes/
│   ├── semanas/
│   └── proceso.md
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
├── services/
│   └── motores-bd/
│       ├── mysql/
│       ├── postgres/
│       ├── mssql/
│       └── oracle/
│
├── .gitignore
└── README.md
```

---

# 31. Control de cambios

El proyecto utiliza Git y GitHub para controlar los cambios realizados.

Los commits se organizan de acuerdo con cambios reales del proyecto.

Entre los cambios registrados se encuentran:

* Configuración de servicios.
* Actualización del README.
* Incorporación de scripts DDL.
* Documentación de los motores.
* Incorporación de diagramas.
* Incorporación de evidencias.
* Documentación de las herramientas gráficas.
* Documentación de la metodología MIRIA.

El historial de Git permite mantener una trazabilidad del desarrollo.

---

# 32. Estado actual del proyecto

Actualmente se cuenta con los cuatro motores configurados y con la estructura de EnlaceExpress implementada.

### MySQL

**Estado:** Configurado y verificado.

### PostgreSQL

**Estado:** Configurado y verificado.

### Microsoft SQL Server

**Estado:** Configurado y verificado.

### Oracle

**Estado:** Configurado y verificado.

En los cuatro motores se cuenta con las 18 tablas principales del proyecto.

También se cuenta con:

* DDL independiente por motor.
* Diagramas.
* Evidencias.
* Persistencia.
* Respaldos.
* Usuarios y roles.
* Conexiones mediante DBeaver.
* Verificación mediante herramientas nativas.
* Configuración mediante Docker.
* Documentación MIRIA de las primeras tres semanas.
* Bitácora general del proceso.

---

# 33. Estado de la documentación

La documentación principal del proyecto se encuentra distribuida en:

```text
docs/
├── contexto/
├── diagramas/
├── informes/
├── semanas/
└── proceso.md
```

Los informes disponibles se encuentran en:

```text
docs/informes/
├── 01-INFORME_IMPLEMENTACIÓN_MOTORES_BASE_DATOS.md
├── 02-INFORME_INICIAL_PROYECTO_INTEGRADOR.md
└── 03-INFORME_VERIFICACION_BASES_DE_DATOS.md
```

La documentación de las herramientas gráficas se encuentra en:

```text
evidencias/GUI.md
```

---

# 34. Próximas etapas

Con la configuración inicial de los cuatro motores completada, el proyecto puede continuar con las siguientes etapas definidas por la guía.

Entre las actividades que pueden continuar se encuentran:

* Integración con NestJS.
* Configuración de Sequelize.
* Migraciones.
* Seeders.
* Conexión del backend con los motores.
* Implementación de casos de uso.
* Autenticación.
* Autorización.
* RBAC.
* Pruebas unitarias.
* Pruebas de integración.
* Pruebas E2E.
* Documentación de API.
* Swagger.
* Pruebas de portabilidad entre motores.

Las nuevas actividades deberán seguir registrándose en la documentación y en la bitácora del proyecto.

---

# 35. Resumen general

EnlaceExpress cuenta actualmente con una estructura de base de datos implementada en cuatro motores:

1. **MySQL**
2. **PostgreSQL**
3. **Microsoft SQL Server**
4. **Oracle**

Los cuatro motores mantienen el mismo modelo lógico de negocio y cuentan con las 18 tablas principales.

Las diferencias existentes corresponden principalmente a las características propias de cada motor, como tipos de datos, mecanismos de generación de identificadores, esquemas, ENUM, CHECK constraints y triggers.

El proyecto también cuenta con documentación, diagramas, evidencias, respaldos, persistencia, configuración de servicios y registro del proceso mediante la metodología MIRIA.

La base de datos constituye la base para continuar con la integración del backend de EnlaceExpress.
