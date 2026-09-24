# Evidencias de Implementación GUI – EnlaceExpress

## Introducción

En este documento se presentan las evidencias gráficas de la base de datos **EnlaceExpress** implementada en **MySQL, PostgreSQL, SQL Server y Oracle**.

---

# 1. MySQL

La implementación de la base de datos `enlace_express` en MySQL fue verificada mediante MySQL Workbench. En esta sección se presentan las evidencias visuales de las 18 tablas y el diagrama entidad-relación de la base de datos.

## 1.1 Visualización de las tablas

A continuación se presentan las evidencias de las 18 tablas implementadas en MySQL. Las capturas muestran la estructura de cada tabla desde el gestor gráfico, permitiendo comprobar las columnas y sus respectivos tipos de datos sin necesidad de mostrar los registros almacenados.

### 1.1.1 AUDITORIA

La tabla `auditoria` permite registrar acciones realizadas sobre los datos del sistema, facilitando el seguimiento de cambios importantes.

![Tabla auditoria](../evidencias/12-GUI/01-mysql-workbench/01-auditoria.png)

### 1.1.2 CONTACTOS

La tabla `contactos` almacena la información de contacto asociada a las empresas registradas en el sistema.

![Tabla contactos](../evidencias/12-GUI/01-mysql-workbench/02-contactos.png)

### 1.1.3 DIRECCIONES

La tabla `direcciones` contiene las direcciones relacionadas con las empresas y utilizadas para las operaciones de los envíos.

![Tabla direcciones](../evidencias/12-GUI/01-mysql-workbench/03-direcciones.png)

### 1.1.4 EMPRESAS

La tabla `empresas` almacena la información principal de las empresas que utilizan el servicio de EnlaceExpress.

![Tabla empresas](../evidencias/12-GUI/01-mysql-workbench/04-empresas.png)

### 1.1.5 ENVIOS

La tabla `envios` representa los envíos gestionados por el sistema y relaciona información como empresa, direcciones, mensajero, ruta y tarifa.

![Tabla envios](../evidencias/12-GUI/01-mysql-workbench/05-envios.png)

### 1.1.6 EVENTOS_TRACKING

La tabla `eventos_tracking` registra los diferentes eventos y cambios de estado relacionados con el seguimiento de los envíos.

![Tabla eventos\_tracking](../evidencias/12-GUI/01-mysql-workbench/06-eventos_tracking.png)

### 1.1.7 FACTURAS

La tabla `facturas` almacena la información de las facturas generadas para las operaciones realizadas dentro del sistema.

![Tabla facturas](../evidencias/12-GUI/01-mysql-workbench/07-facturas.png)

### 1.1.8 MENSAJEROS

La tabla `mensajeros` contiene la información de los mensajeros encargados de realizar las entregas.

![Tabla mensajeros](../evidencias/12-GUI/01-mysql-workbench/08-mensajeros.png)

### 1.1.9 PAQUETES

La tabla `paquetes` almacena la información de los paquetes asociados a los diferentes envíos.

![Tabla paquetes](../evidencias/12-GUI/01-mysql-workbench/09-paquetes.png)

### 1.1.10 PRUEBAS_ENTREGA

La tabla `pruebas_entrega` permite almacenar la información utilizada como evidencia de la entrega de los envíos.

![Tabla pruebas\_entrega](../evidencias/12-GUI/01-mysql-workbench/10-pruebas_entrega.png)

### 1.1.11 REFRESH_TOKENS

La tabla `refresh_tokens` almacena los tokens utilizados para mantener y renovar las sesiones de autenticación de los usuarios.

![Tabla refresh\_tokens](../evidencias/12-GUI/01-mysql-workbench/11-refresh_tokens.png)

### 1.1.12 RESOURCE_ROLES

La tabla `resource_roles` representa la relación entre los recursos del sistema y los roles que tienen permisos sobre ellos.

![Tabla resource\_roles](../evidencias/12-GUI/01-mysql-workbench/12-resource_roles.png)

### 1.1.13 RESOURCES

La tabla `resources` almacena los recursos o rutas del sistema que pueden ser controlados mediante el esquema de permisos.

![Tabla resources](../evidencias/12-GUI/01-mysql-workbench/13-resources.png)

### 1.1.14 ROLE_USERS

La tabla `role_users` relaciona los usuarios con los roles asignados dentro del sistema, permitiendo implementar el control de acceso basado en roles.

![Tabla role\_users](../evidencias/12-GUI/01-mysql-workbench/14-role_users.png)

### 1.1.15 ROLES

La tabla `roles` almacena los diferentes roles definidos para controlar los permisos de los usuarios.

![Tabla roles](../evidencias/12-GUI/01-mysql-workbench/15-roles.png)

### 1.1.16 RUTAS

La tabla `rutas` contiene la información de las rutas utilizadas para gestionar el proceso de transporte y entrega de los envíos.

![Tabla rutas](../evidencias/12-GUI/01-mysql-workbench/16-rutas.png)

### 1.1.17 TARIFAS

La tabla `tarifas` almacena la información relacionada con los valores utilizados para calcular los costos de los envíos.

![Tabla tarifas](../evidencias/12-GUI/01-mysql-workbench/17-tarifas.png)

### 1.1.18 USERS

La tabla `users` almacena los usuarios del sistema y forma parte de la estructura de control de acceso basada en roles.

![Tabla users](../evidencias/12-GUI/01-mysql-workbench/18-users.png)

---

## 1.2 Diagrama entidad-relación

El siguiente diagrama representa visualmente la estructura de la base de datos `enlace_express` en MySQL, mostrando las tablas y las relaciones definidas entre las diferentes entidades.

![Diagrama ER MySQL](../evidencias/13-diagramas/mysql/ER-diagram.jpg)

---

## 1.7 Confirmación de las 18 tablas

Se realizó una consulta sobre `information_schema.TABLES` para comprobar que las 18 tablas correspondieran a tablas base de la base de datos `enlace_express`.

### Consulta utilizada

```sql
SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'enlace_express'
  AND TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
```

### Resultado

La consulta confirmó la existencia de las siguientes 18 tablas:

|  # | Tabla              |
| -: | ------------------ |
|  1 | `auditoria`        |
|  2 | `contactos`        |
|  3 | `direcciones`      |
|  4 | `empresas`         |
|  5 | `envios`           |
|  6 | `eventos_tracking` |
|  7 | `facturas`         |
|  8 | `mensajeros`       |
|  9 | `paquetes`         |
| 10 | `pruebas_entrega`  |
| 11 | `refresh_tokens`   |
| 12 | `resource_roles`   |
| 13 | `resources`        |
| 14 | `role_users`       |
| 15 | `roles`            |
| 16 | `rutas`            |
| 17 | `tarifas`          |
| 18 | `users`            |

La consulta confirma que la base de datos MySQL cuenta con las 18 tablas requeridas para el proyecto `EnlaceExpress`.

---

# 2. PostgreSQL

La implementación de la base de datos `enlace_express` en PostgreSQL fue verificada mediante pgAdmin 4. En esta sección se presentan las evidencias visuales de las 18 tablas, el diagrama entidad-relación y la existencia de las tablas.

## 2.1 Visualización de las tablas

A continuación se presentan las evidencias de las 18 tablas implementadas en PostgreSQL. Las capturas muestran la estructura de cada tabla desde el gestor gráfico, permitiendo comprobar sus columnas y tipos de datos sin mostrar los registros almacenados.

### 2.1.1 AUDITORIA

La tabla `auditoria` registra las acciones realizadas sobre los datos del sistema y permite mantener un seguimiento de las operaciones importantes.

![Tabla auditoria](../evidencias/12-GUI/02-postgresql-pgadmin-4/01-auditoria.png)

### 2.1.2 CONTACTOS

La tabla `contactos` almacena la información de contacto asociada a las empresas registradas en el sistema.

![Tabla contactos](../evidencias/12-GUI/02-postgresql-pgadmin-4/02-contactos.png)

### 2.1.3 DIRECCIONES

La tabla `direcciones` almacena las direcciones asociadas a las empresas y utilizadas en la gestión de los envíos.

![Tabla direcciones](../evidencias/12-GUI/02-postgresql-pgadmin-4/03-direcciones.png)

### 2.1.4 EMPRESAS

La tabla `empresas` contiene la información principal de las empresas que utilizan el servicio de EnlaceExpress.

![Tabla empresas](../evidencias/12-GUI/02-postgresql-pgadmin-4/04-empresas.png)

### 2.1.5 ENVIOS

La tabla `envios` representa los envíos gestionados por el sistema y contiene relaciones con empresas, direcciones, mensajeros, rutas y tarifas.

![Tabla envios](../evidencias/12-GUI/02-postgresql-pgadmin-4/05-envios.png)

### 2.1.6 EVENTOS_TRACKING

La tabla `eventos_tracking` registra los diferentes eventos y cambios de estado asociados al seguimiento de los envíos.

![Tabla eventos\_tracking](../evidencias/12-GUI/02-postgresql-pgadmin-4/06-eventos_tracking.png)

### 2.1.7 FACTURAS

La tabla `facturas` almacena la información de las facturas generadas a partir de las operaciones realizadas en el sistema.

![Tabla facturas](../evidencias/12-GUI/02-postgresql-pgadmin-4/07-facturas.png)

### 2.1.8 MENSAJEROS

La tabla `mensajeros` almacena la información de los mensajeros encargados de realizar las entregas.

![Tabla mensajeros](../evidencias/12-GUI/02-postgresql-pgadmin-4/08-mensajeros.png)

### 2.1.9 PAQUETES

La tabla `paquetes` almacena los paquetes asociados a los diferentes envíos registrados en el sistema.

![Tabla paquetes](../evidencias/12-GUI/02-postgresql-pgadmin-4/09-paquetes.png)

### 2.1.10 PRUEBAS_ENTREGA

La tabla `pruebas_entrega` almacena la información utilizada como evidencia de las entregas realizadas.

![Tabla pruebas\_entrega](../evidencias/12-GUI/02-postgresql-pgadmin-4/10-pruebas_entrega.png)

### 2.1.11 REFRESH_TOKENS

La tabla `refresh_tokens` almacena los tokens utilizados para renovar las sesiones de autenticación de los usuarios.

![Tabla refresh\_tokens](../evidencias/12-GUI/02-postgresql-pgadmin-4/11-refresh_tokens.png)

### 2.1.12 RESOURCE_ROLES

La tabla `resource_roles` relaciona los recursos del sistema con los roles que tienen permisos sobre ellos.

![Tabla resource\_roles](../evidencias/12-GUI/02-postgresql-pgadmin-4/12-resource_roles.png)

### 2.1.13 RESOURCES

La tabla `resources` almacena los recursos o rutas del sistema que son utilizados para controlar los permisos de acceso.

![Tabla resources](../evidencias/12-GUI/02-postgresql-pgadmin-4/13-resources.png)

### 2.1.14 ROLE_USERS

La tabla `role_users` relaciona los usuarios con los roles asignados, permitiendo implementar el control de acceso basado en roles.

![Tabla role\_users](../evidencias/12-GUI/02-postgresql-pgadmin-4/14-role_users.png)

### 2.1.15 ROLES

La tabla `roles` almacena los diferentes roles definidos para administrar los permisos de los usuarios.

![Tabla roles](../evidencias/12-GUI/02-postgresql-pgadmin-4/15-roles.png)

### 2.1.16 RUTAS

La tabla `rutas` contiene la información de las rutas utilizadas para gestionar el transporte y entrega de los envíos.

![Tabla rutas](../evidencias/12-GUI/02-postgresql-pgadmin-4/16-rutas.png)

### 2.1.17 TARIFAS

La tabla `tarifas` almacena la información relacionada con los valores utilizados para calcular los costos de los envíos.

![Tabla tarifas](../evidencias/12-GUI/02-postgresql-pgadmin-4/17-tarifas.png)

### 2.1.18 USERS

La tabla `users` almacena los usuarios del sistema y forma parte de la estructura de control de acceso basada en roles.

![Tabla users](../evidencias/12-GUI/02-postgresql-pgadmin-4/18-users.png)

---

## 2.2 Diagrama entidad-relación

El siguiente diagrama representa visualmente la estructura de la base de datos `enlace_express` implementada en PostgreSQL, mostrando las tablas y las relaciones establecidas entre las diferentes entidades.

![Diagrama ER PostgreSQL](../evidencias/13-diagramas/postgresql/ER-diagram.jpg)

---

## 2.7 Confirmación de las 18 tablas

Se realizó una consulta sobre `information_schema.tables` para comprobar la existencia de las tablas base del esquema `public`.

### Consulta utilizada

```sql
SELECT
    table_schema,
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
```

### Resultado

La consulta confirmó la existencia de las siguientes 18 tablas:

|  # | Tabla              |
| -: | ------------------ |
|  1 | `auditoria`        |
|  2 | `contactos`        |
|  3 | `direcciones`      |
|  4 | `empresas`         |
|  5 | `envios`           |
|  6 | `eventos_tracking` |
|  7 | `facturas`         |
|  8 | `mensajeros`       |
|  9 | `paquetes`         |
| 10 | `pruebas_entrega`  |
| 11 | `refresh_tokens`   |
| 12 | `resource_roles`   |
| 13 | `resources`        |
| 14 | `role_users`       |
| 15 | `roles`            |
| 16 | `rutas`            |
| 17 | `tarifas`          |
| 18 | `users`            |

La consulta confirma que el esquema `public` de PostgreSQL cuenta con las 18 tablas requeridas para la implementación de la base de datos `EnlaceExpress`.

---

# 3. SQL Server

La implementación de la base de datos `enlace_express` en SQL Server fue verificada mediante SQL Server Management Studio (SSMS). En esta sección se presentan las evidencias visuales de las 18 tablas, el diagrama entidad-relación y la existencia de las tablas.

## 3.1 Visualización de las tablas

A continuación se presentan las evidencias de las 18 tablas implementadas en SQL Server. Las capturas muestran la estructura de cada tabla desde SSMS, permitiendo comprobar sus columnas y tipos de datos sin mostrar los registros almacenados.

### 3.1.1 AUDITORIA

La tabla `auditoria` permite registrar las acciones realizadas sobre los datos del sistema y mantener un historial de las operaciones importantes.

![Tabla auditoria](../evidencias/12-GUI/03-sql-server-ssms/01-auditoria.png)

### 3.1.2 CONTACTOS

La tabla `contactos` almacena la información de contacto asociada a las empresas registradas en el sistema.

![Tabla contactos](../evidencias/12-GUI/03-sql-server-ssms/02-contactos.png)

### 3.1.3 DIRECCIONES

La tabla `direcciones` contiene las direcciones asociadas a las empresas y utilizadas durante la gestión de los envíos.

![Tabla direcciones](../evidencias/12-GUI/03-sql-server-ssms/03-direcciones.png)

### 3.1.4 EMPRESAS

La tabla `empresas` almacena la información principal de las empresas que utilizan el servicio de EnlaceExpress.

![Tabla empresas](../evidencias/12-GUI/03-sql-server-ssms/04-empresas.png)

### 3.1.5 ENVIOS

La tabla `envios` representa los envíos gestionados por el sistema y mantiene relaciones con empresas, direcciones, mensajeros, rutas y tarifas.

![Tabla envios](../evidencias/12-GUI/03-sql-server-ssms/05-envios.png)

### 3.1.6 EVENTOS_TRACKING

La tabla `eventos_tracking` registra los diferentes eventos y cambios de estado relacionados con el seguimiento de los envíos.

![Tabla eventos\_tracking](../evidencias/12-GUI/03-sql-server-ssms/06-eventos_tracking.png)

### 3.1.7 FACTURAS

La tabla `facturas` almacena la información correspondiente a las facturas generadas en el sistema.

![Tabla facturas](../evidencias/12-GUI/03-sql-server-ssms/07-facturas.png)

### 3.1.8 MENSAJEROS

La tabla `mensajeros` almacena la información de los mensajeros encargados de realizar las entregas.

![Tabla mensajeros](../evidencias/12-GUI/03-sql-server-ssms/08-mensajeros.png)

### 3.1.9 PAQUETES

La tabla `paquetes` contiene la información de los paquetes asociados a los diferentes envíos.

![Tabla paquetes](../evidencias/12-GUI/03-sql-server-ssms/09-paquetes.png)

### 3.1.10 PRUEBAS_ENTREGA

La tabla `pruebas_entrega` almacena la información utilizada como evidencia de las entregas realizadas.

![Tabla pruebas\_entrega](../evidencias/12-GUI/03-sql-server-ssms/10-pruebas_entrega.png)

### 3.1.11 REFRESH_TOKENS

La tabla `refresh_tokens` almacena los tokens utilizados para renovar las sesiones de autenticación de los usuarios.

![Tabla refresh\_tokens](../evidencias/12-GUI/03-sql-server-ssms/11-refresh_tokens.png)

### 3.1.12 RESOURCE_ROLES

La tabla `resource_roles` relaciona los recursos del sistema con los roles que tienen permisos sobre ellos.

![Tabla resource\_roles](../evidencias/12-GUI/03-sql-server-ssms/12-resource_roles.png)

### 3.1.13 RESOURCES

La tabla `resources` almacena los recursos o rutas del sistema utilizados para controlar los permisos de acceso.

![Tabla resources](../evidencias/12-GUI/03-sql-server-ssms/13-resources.png)

### 3.1.14 ROLE_USERS

La tabla `role_users` relaciona los usuarios con los roles asignados dentro del sistema para implementar el control de acceso basado en roles.

![Tabla role\_users](../evidencias/12-GUI/03-sql-server-ssms/14-role_users.png)

### 3.1.15 ROLES

La tabla `roles` almacena los diferentes roles definidos para administrar los permisos de los usuarios.

![Tabla roles](../evidencias/12-GUI/03-sql-server-ssms/15-roles.png)

### 3.1.16 RUTAS

La tabla `rutas` contiene la información de las rutas utilizadas para gestionar el transporte y entrega de los envíos.

![Tabla rutas](../evidencias/12-GUI/03-sql-server-ssms/16-rutas.png)

### 3.1.17 TARIFAS

La tabla `tarifas` almacena la información relacionada con los valores utilizados para calcular los costos de los envíos.

![Tabla tarifas](../evidencias/12-GUI/03-sql-server-ssms/17-tarifas.png)

### 3.1.18 USERS

La tabla `users` almacena los usuarios del sistema y forma parte de la estructura de control de acceso basada en roles.

![Tabla users](../evidencias/12-GUI/03-sql-server-ssms/18-users.png)

---

## 3.2 Diagrama entidad-relación

El siguiente diagrama representa visualmente la estructura de la base de datos `enlace_express` implementada en SQL Server, mostrando las tablas y las relaciones establecidas entre las diferentes entidades.

![Diagrama ER SQL Server](../evidencias/13-diagramas/sql-server/ER-diagram.jpg)

---

## 3.7 Confirmación del esquema y las 18 tablas

Se realizó una consulta sobre `INFORMATION_SCHEMA.TABLES` para comprobar la existencia de las tablas base dentro del esquema `dbo`.

### Consulta utilizada

```sql id="h6d1r4"
SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
```

### Resultado

La consulta confirmó la existencia de las siguientes 18 tablas:

|  # | Tabla              |
| -: | ------------------ |
|  1 | `auditoria`        |
|  2 | `contactos`        |
|  3 | `direcciones`      |
|  4 | `empresas`         |
|  5 | `envios`           |
|  6 | `eventos_tracking` |
|  7 | `facturas`         |
|  8 | `mensajeros`       |
|  9 | `paquetes`         |
| 10 | `pruebas_entrega`  |
| 11 | `refresh_tokens`   |
| 12 | `resource_roles`   |
| 13 | `resources`        |
| 14 | `role_users`       |
| 15 | `roles`            |
| 16 | `rutas`            |
| 17 | `tarifas`          |
| 18 | `users`            |

La consulta confirma que el esquema `dbo` de SQL Server cuenta con las 18 tablas requeridas para la implementación de la base de datos `EnlaceExpress`.

---

## 4. Oracle – Oracle SQL Developer

En esta sección se presenta la evidencia gráfica de la base de datos `ENLACE_EXPRESS` en Oracle. Las capturas muestran la estructura de las 18 tablas desde Oracle SQL Developer y el diagrama entidad-relación permite visualizar las relaciones entre las diferentes entidades.

### 4.4 Visualización de las tablas

Las siguientes capturas muestran la estructura de cada tabla en Oracle SQL Developer, incluyendo sus columnas, tipos de datos y propiedades principales. No se muestran los registros almacenados, ya que la evidencia está enfocada en la estructura de la base de datos.

#### 4.4.1 AUDITORIA

![Tabla AUDITORIA](../evidencias/12-GUI/04-oracle-sql-developer/01-auditoria.png)

**Descripción:** Muestra la estructura de `AUDITORIA`, utilizada para registrar las acciones realizadas sobre los registros de la base de datos.

#### 4.4.2 CONTACTOS

![Tabla CONTACTOS](../evidencias/12-GUI/04-oracle-sql-developer/02-contactos.png)

**Descripción:** Muestra la estructura de `CONTACTOS`, relacionada con las empresas para almacenar información de sus contactos.

#### 4.4.3 DIRECCIONES

![Tabla DIRECCIONES](../evidencias/12-GUI/04-oracle-sql-developer/03-direcciones.png)

**Descripción:** Muestra la estructura de `DIRECCIONES`, utilizada para almacenar las direcciones asociadas a las empresas.

#### 4.4.4 EMPRESAS

![Tabla EMPRESAS](../evidencias/12-GUI/04-oracle-sql-developer/04-empresas.png)

**Descripción:** Muestra la estructura de `EMPRESAS`, donde se almacena la información principal de las empresas que utilizan el sistema.

#### 4.4.5 ENVIOS

![Tabla ENVIOS](../evidencias/12-GUI/04-oracle-sql-developer/05-envios.png)

**Descripción:** Muestra la estructura de `ENVIOS`, encargada de almacenar la información principal de los envíos gestionados por EnlaceExpress.

#### 4.4.6 EVENTOS_TRACKING

![Tabla EVENTOS\_TRACKING](../evidencias/12-GUI/04-oracle-sql-developer/06-eventos_tracking.png)

**Descripción:** Muestra la estructura de `EVENTOS_TRACKING`, utilizada para registrar los diferentes eventos y estados asociados a un envío.

#### 4.4.7 FACTURAS

![Tabla FACTURAS](../evidencias/12-GUI/04-oracle-sql-developer/07-facturas.png)

**Descripción:** Muestra la estructura de `FACTURAS`, utilizada para almacenar la información relacionada con la facturación de los envíos.

#### 4.4.8 MENSAJEROS

![Tabla MENSAJEROS](../evidencias/12-GUI/04-oracle-sql-developer/08-mensajeros.png)

**Descripción:** Muestra la estructura de `MENSAJEROS`, utilizada para almacenar la información de los mensajeros encargados de realizar las entregas.

#### 4.4.9 PAQUETES

![Tabla PAQUETES](../evidencias/12-GUI/04-oracle-sql-developer/09-paquetes.png)

**Descripción:** Muestra la estructura de `PAQUETES`, donde se registra la información de los paquetes asociados a los envíos.

#### 4.4.10 PRUEBAS_ENTREGA

![Tabla PRUEBAS\_ENTREGA](../evidencias/12-GUI/04-oracle-sql-developer/10-pruebas_entrega.png)

**Descripción:** Muestra la estructura de `PRUEBAS_ENTREGA`, utilizada para registrar las evidencias asociadas a la entrega de un envío.

#### 4.4.11 REFRESH_TOKENS

![Tabla REFRESH\_TOKENS](../evidencias/12-GUI/04-oracle-sql-developer/11-refresh_tokens.png)

**Descripción:** Muestra la estructura de `REFRESH_TOKENS`, utilizada para gestionar los tokens de actualización asociados a los usuarios.

#### 4.4.12 RESOURCE_ROLES

![Tabla RESOURCE\_ROLES](../evidencias/12-GUI/04-oracle-sql-developer/12-resource_roles.png)

**Descripción:** Muestra la estructura de `RESOURCE_ROLES`, que relaciona los recursos del sistema con los roles que tienen permisos sobre ellos.

#### 4.4.13 RESOURCES

![Tabla RESOURCES](../evidencias/12-GUI/04-oracle-sql-developer/13-resources.png)

**Descripción:** Muestra la estructura de `RESOURCES`, utilizada para registrar los recursos o rutas disponibles en el sistema.

#### 4.4.14 ROLES

![Tabla ROLES](../evidencias/12-GUI/04-oracle-sql-developer/14-roles.png)

**Descripción:** Muestra la estructura de `ROLES`, utilizada para definir los diferentes roles de acceso dentro del sistema.

#### 4.4.15 ROLE_USERS

![Tabla ROLE\_USERS](../evidencias/12-GUI/04-oracle-sql-developer/15-role_users.png)

**Descripción:** Muestra la estructura de `ROLE_USERS`, utilizada para relacionar los usuarios con sus respectivos roles.

#### 4.4.16 RUTAS

![Tabla RUTAS](../evidencias/12-GUI/04-oracle-sql-developer/16-rutas.png)

**Descripción:** Muestra la estructura de `RUTAS`, utilizada para almacenar las rutas disponibles para la gestión de los envíos.

#### 4.4.17 TARIFAS

![Tabla TARIFAS](../evidencias/12-GUI/04-oracle-sql-developer/17-tarifas.png)

**Descripción:** Muestra la estructura de `TARIFAS`, utilizada para almacenar las reglas y valores correspondientes a las tarifas de los servicios.

#### 4.4.18 USERS

![Tabla USERS](../evidencias/12-GUI/04-oracle-sql-developer/18-users.png)

**Descripción:** Muestra la estructura de `USERS`, utilizada para almacenar los usuarios del sistema y la información necesaria para su autenticación y control de acceso.

---

### 4.3 Diagrama entidad-relación

El diagrama entidad-relación representa las 18 tablas de `ENLACE_EXPRESS` y permite observar las relaciones existentes entre ellas mediante sus claves primarias y claves foráneas.

![Diagrama ER de Oracle](../evidencias/13-diagramas/oracle/ER-diagram.jpg)

---

### 4.2 Confirmación de las 18 tablas

La consulta realizada sobre `USER_TABLES` confirmó la existencia de las 18 tablas requeridas para el proyecto:

|  # | Tabla              |
| -: | ------------------ |
|  1 | `AUDITORIA`        |
|  2 | `CONTACTOS`        |
|  3 | `DIRECCIONES`      |
|  4 | `EMPRESAS`         |
|  5 | `ENVIOS`           |
|  6 | `EVENTOS_TRACKING` |
|  7 | `FACTURAS`         |
|  8 | `MENSAJEROS`       |
|  9 | `PAQUETES`         |
| 10 | `PRUEBAS_ENTREGA`  |
| 11 | `REFRESH_TOKENS`   |
| 12 | `RESOURCE_ROLES`   |
| 13 | `RESOURCES`        |
| 14 | `ROLES`            |
| 15 | `ROLE_USERS`       |
| 16 | `RUTAS`            |
| 17 | `TARIFAS`          |
| 18 | `USERS`            |

La consulta confirma que la base de datos Oracle cuenta con las 18 tablas requeridas para el proyecto `EnlaceExpress`.

---

## Conclusión

Las evidencias permiten comprobar que la base de datos **EnlaceExpress** fue implementada en los cuatro motores solicitados, manteniendo las 18 tablas y sus relaciones principales, demostrando que la estructura del proyecto se encuentra configurada en cada gestor de bases de datos.