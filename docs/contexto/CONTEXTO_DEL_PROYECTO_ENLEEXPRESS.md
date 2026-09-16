# CONTEXTO DEL PROYECTO – ENLACEEXPRESS

## 1. Información general

Estoy desarrollando un proyecto académico llamado **EnlaceExpress**, relacionado con una plataforma de mensajería corporativa, envíos, seguimiento de paquetes, tarifas y facturación.

El proyecto se está desarrollando dentro de la carrera de **Ingeniería de Sistemas** y una de las partes importantes consiste en trabajar con diferentes motores de bases de datos.

El objetivo actual es tener el mismo modelo lógico de base de datos funcionando en cuatro motores:

* MySQL
* PostgreSQL
* Microsoft SQL Server
* Oracle

La idea es poder comparar los cuatro motores utilizando una estructura equivalente.

---

# 2. Herramientas y plataformas utilizadas

Durante la configuración se han utilizado principalmente:

### Sistema operativo

* Windows 11

### Entorno Linux

* Ubuntu mediante WSL (Windows Subsystem for Linux)

WSL/Ubuntu se utiliza como parte del entorno de trabajo y para algunas herramientas relacionadas con el proyecto.

### Docker

Se ha utilizado Docker como parte del entorno de desarrollo y configuración de servicios.

### DBeaver

**DBeaver** es la herramienta principal utilizada para conectarse y administrar las bases de datos.

Desde DBeaver se han realizado las conexiones y consultas de:

* MySQL
* PostgreSQL
* Microsoft SQL Server
* Oracle

También se ha utilizado DBeaver para revisar tablas, columnas, tipos de datos, claves, restricciones, índices y otros elementos de las bases de datos.

---

# 3. Base de datos del proyecto

El nombre utilizado para la base de datos es:

`enlace_express`

En Oracle se creó un usuario/esquema llamado:

`ENLACE_EXPRESS`

La intención es que los cuatro motores representen el mismo modelo de negocio.

---

# 4. Motores de bases de datos configurados

## 4.1 MySQL

MySQL fue configurado como uno de los motores principales.

Base de datos:

`enlace_express`

Características utilizadas:

* InnoDB
* UTF8MB4
* `AUTO_INCREMENT`
* `VARCHAR`
* `DATETIME`
* `DECIMAL`
* `ENUM`
* Claves primarias
* Claves foráneas
* Restricciones UNIQUE
* Índices
* `ON UPDATE CURRENT_TIMESTAMP`

La estructura de MySQL fue revisada directamente desde DBeaver.

---

# 5. PostgreSQL

PostgreSQL también fue configurado con la base:

`enlace_express`

Características utilizadas:

* `GENERATED ALWAYS AS IDENTITY`
* `VARCHAR`
* `TIMESTAMP`
* `NUMERIC`
* Tipos `ENUM` personalizados
* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* INDEX
* TRIGGERS

PostgreSQL utiliza tipos ENUM para representar varios estados del sistema.

Entre ellos:

* `estado_usuario`
* `estado_recurso`
* `estado_rol`
* `estado_envio`
* `prioridad_envio`
* `estado_factura`
* `estado_paquete`
* `tipo_prueba_entrega`

La estructura de PostgreSQL fue revisada mediante consultas a `information_schema` y desde DBeaver.

---

# 6. Microsoft SQL Server

Microsoft SQL Server también fue configurado para el proyecto.

Base de datos:

`enlace_express`

Esquema utilizado:

`dbo`

SQL Server utiliza:

* `IDENTITY(1,1)`
* `VARCHAR`
* `DATETIME2`
* `DECIMAL`
* `DATE`
* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* INDEX
* CHECK CONSTRAINTS
* TRIGGERS

Como SQL Server no utiliza ENUM de la misma manera que MySQL/PostgreSQL, los estados se representan mediante restricciones `CHECK`.

Por ejemplo, campos como:

* `estado`
* `prioridad`
* `is_active`
* `tipo_prueba`

utilizan valores controlados mediante CHECK.

También se crearon triggers para actualizar automáticamente `updated_at`.

Los triggers principales son:

* `trg_resources_updated_at`
* `trg_resource_roles_updated_at`
* `trg_empresas_updated_at`
* `trg_contactos_updated_at`
* `trg_direcciones_updated_at`
* `trg_envios_updated_at`
* `trg_paquetes_updated_at`
* `trg_facturas_updated_at`
* `trg_mensajeros_updated_at`
* `trg_rutas_updated_at`

---

# 7. Oracle

Oracle es el cuarto motor que se configuró.

Se creó el usuario/esquema:

`ENLACE_EXPRESS`

Se utilizó DBeaver para conectarse y ejecutar los scripts.

La configuración utiliza:

* `NUMBER`
* `VARCHAR2`
* `TIMESTAMP`
* `DATE`
* Identity Columns
* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* INDEX
* CHECK CONSTRAINTS
* TRIGGERS

Los identificadores utilizan columnas Identity.

Oracle muestra internamente valores como:

`ISEQ$$_76191.nextval`

Esto corresponde a las secuencias internas utilizadas por Oracle para las columnas Identity y es normal.

---

# 8. Estructura de las tablas

El proyecto tiene actualmente **18 tablas**.

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

Estas 18 tablas fueron creadas en los cuatro motores.

---

# 9. Módulo de usuarios y RBAC

El proyecto incluye un sistema de usuarios y control de acceso basado en roles.

Las tablas relacionadas son:

* `users`
* `roles`
* `role_users`
* `resources`
* `resource_roles`
* `refresh_tokens`

Los roles definidos conceptualmente son:

* ADMIN
* CLIENTE_EMPRESA
* DESPACHO
* MENSAJERO
* FACTURACION

Los recursos representan rutas HTTP y métodos de la API.

Ejemplos:

* `POST /envios`
* `POST /asignaciones`
* `POST /tracking`
* `POST /facturas/consolidar`

También existe la tabla `refresh_tokens` para manejar tokens de actualización de autenticación.

IMPORTANTE:

La estructura real de `refresh_tokens` es:

* `id`
* `user_id`
* `token`
* `expires_at`
* `revoked_at`
* `created_at`

No se debe modificar para agregar campos de una versión anterior de la guía.

---

# 10. Módulo de negocio

Las principales entidades de negocio son:

* Empresa
* Contacto
* Dirección
* Envío
* Paquete
* Evento de tracking
* Mensajero
* Ruta
* Tarifa
* Prueba de entrega
* Factura

Estas entidades representan el funcionamiento principal de EnlaceExpress.

---

# 11. Relaciones principales

Algunas relaciones importantes son:

### Empresas

Una empresa puede tener:

* contactos
* direcciones
* envíos
* facturas

### Envíos

Un envío pertenece a una empresa.

También puede estar relacionado con:

* mensajero
* ruta
* tarifa

Además tiene:

* dirección de recogida
* dirección de entrega
* paquetes
* eventos de tracking
* pruebas de entrega
* factura

### Usuarios y roles

Los usuarios se relacionan con los roles mediante:

`role_users`

Los roles se relacionan con los recursos mediante:

`resource_roles`

Esto permite implementar el sistema RBAC.

---

# 12. Equivalencia entre motores

El objetivo NO es que la sintaxis interna de los cuatro motores sea idéntica.

El objetivo es que el modelo sea equivalente.

Por ejemplo:

### Identificadores

MySQL:

`AUTO_INCREMENT`

PostgreSQL:

`IDENTITY`

SQL Server:

`IDENTITY(1,1)`

Oracle:

`IDENTITY`

Todos cumplen la función de generar identificadores automáticamente.

### Texto

MySQL:

`VARCHAR`

PostgreSQL:

`VARCHAR`

SQL Server:

`VARCHAR`

Oracle:

`VARCHAR2`

### Fechas y horas

MySQL:

`DATETIME`

PostgreSQL:

`TIMESTAMP`

SQL Server:

`DATETIME2`

Oracle:

`TIMESTAMP`

### Números decimales

MySQL:

`DECIMAL`

PostgreSQL:

`NUMERIC`

SQL Server:

`DECIMAL`

Oracle:

`NUMBER`

Por ejemplo:

`DECIMAL(12,2)`

es equivalente conceptualmente a:

`NUMERIC(12,2)`

y:

`NUMBER(12,2)`

---

# 13. Estados

En MySQL y PostgreSQL se utilizan ENUM para algunos estados.

En SQL Server y Oracle se utilizan CHECK constraints.

Por ejemplo, `estado_envio` tiene los siguientes valores:

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

# 14. Campos de auditoría y fechas

Las tablas que manejan información de creación y actualización utilizan normalmente:

* `created_at`
* `updated_at`

Dependiendo del motor, el comportamiento se implementa de forma diferente.

### MySQL

Utiliza principalmente:

`DEFAULT CURRENT_TIMESTAMP`

y:

`ON UPDATE CURRENT_TIMESTAMP`

### PostgreSQL

Utiliza:

`DEFAULT CURRENT_TIMESTAMP`

y triggers para actualizar `updated_at`.

### SQL Server

Utiliza:

`DEFAULT GETDATE()`

y triggers para actualizar `updated_at`.

### Oracle

Utiliza:

`DEFAULT CURRENT_TIMESTAMP`

y triggers `BEFORE UPDATE` para actualizar `updated_at`.

---

# 15. Tablas que NO tienen updated_at

Se mantuvo intencionalmente el modelo real.

No se agregó `updated_at` a:

* `auditoria`
* `eventos_tracking`
* `pruebas_entrega`
* `refresh_tokens`
* `role_users`
* `roles`
* `tarifas`
* `users`

Esto es importante porque no se deben agregar campos únicamente para hacer que todos los motores tengan exactamente las mismas características físicas.

---

# 16. Verificaciones realizadas

Se han realizado consultas para comprobar:

* existencia de las 18 tablas
* nombres de tablas
* columnas
* tipos de datos
* longitud
* posibilidad de NULL
* valores por defecto
* claves primarias
* claves foráneas
* restricciones UNIQUE
* índices
* CHECK constraints
* ENUM
* triggers
* columnas Identity/Auto Increment
* estructura del esquema

Las consultas se han realizado principalmente mediante DBeaver.

---

# 17. Estado actual de la comparación

La comparación de las columnas de los cuatro motores indica que la estructura lógica está alineada.

Se confirmó que los cuatro motores contienen las mismas 18 tablas.

También se revisaron campos importantes como:

### Tracking

`latitud` y `longitud`:

`DECIMAL/NUMERIC/NUMBER(10,7)`

### Paquetes

`peso`, `largo`, `ancho`, `alto`:

`DECIMAL/NUMERIC/NUMBER(10,2)`

### Tarifas

`valor_base`:

`DECIMAL/NUMERIC/NUMBER(12,2)`

### Facturas

`subtotal`, `impuesto`, `total`:

`DECIMAL/NUMERIC/NUMBER(12,2)`

Estos valores fueron configurados para mantener equivalencia entre los motores.

---

# 18. Diferencias normales entre motores

No se deben considerar errores diferencias como:

* `dbo` en SQL Server
* `public` en PostgreSQL
* `enlace_express` en MySQL
* `ENLACE_EXPRESS` en Oracle

Cada motor maneja los esquemas de forma diferente.

También es normal que Oracle muestre secuencias internas `ISEQ$$_...` para Identity.

Los nombres de las restricciones e índices tampoco tienen que ser exactamente iguales siempre que la función sea equivalente.

---

# 19. Situación de Oracle

Oracle ya tiene las 18 tablas creadas dentro del usuario:

`ENLACE_EXPRESS`

La consulta correcta para comprobar las tablas es:

```sql
SELECT
    TABLE_NAME
FROM USER_TABLES
ORDER BY TABLE_NAME;
```

No se debe utilizar:

```sql
SELECT OWNER, TABLE_NAME
FROM USER_TABLES;
```

porque `USER_TABLES` no tiene la columna `OWNER`.

Para comprobar el esquema actual se puede utilizar:

```sql
SELECT USER FROM DUAL;

SELECT
    SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') AS CURRENT_SCHEMA
FROM DUAL;
```

---

# 20. Herramienta principal de administración

DBeaver ha sido la herramienta principal para:

* crear/conectar bases de datos
* ejecutar scripts SQL
* revisar estructuras
* comprobar tablas
* revisar columnas
* revisar restricciones
* revisar índices
* revisar triggers
* comparar los motores

Por eso, para la documentación de los informes, DBeaver debe aparecer como una de las herramientas principales utilizadas.

---

# 21. Enfoque del proyecto

El proyecto está orientado a una arquitectura backend moderna.

Se está trabajando con conceptos relacionados con:

* NestJS
* Clean Architecture
* Domain-Driven Design (DDD)
* RBAC
* Sequelize
* APIs REST
* autenticación
* autorización
* bases de datos relacionales

La base de datos es solamente una parte del proyecto.

La arquitectura completa también contempla:

* entidades de dominio independientes del framework
* casos de uso
* repositorios
* autenticación
* autorización
* RBAC
* pruebas unitarias
* pruebas de integración
* pruebas E2E
* Swagger
* manejo de errores
* paginación
* filtros
* trazabilidad
* migraciones
* seeders
* colección de pruebas de API
* documentación

---

# 22. Estado general del trabajo

Hasta este punto se ha realizado principalmente la **configuración y comparación de los cuatro motores de bases de datos**.

Motores trabajados:

1. MySQL
2. PostgreSQL
3. Microsoft SQL Server
4. Oracle

La estructura de las 18 tablas ya está creada en los cuatro motores.

El objetivo actual es terminar de verificar:

* PK
* FK
* UNIQUE
* índices
* CHECK constraints
* ENUM
* triggers
* Identity/Auto Increment
* esquema correspondiente

Después de terminar estas comprobaciones se podrá continuar con las siguientes etapas del proyecto según la guía, como datos iniciales, seeders, migraciones, conexión con NestJS/Sequelize y pruebas.