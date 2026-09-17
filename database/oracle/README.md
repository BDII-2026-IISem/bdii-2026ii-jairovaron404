# EnlaceExpress - Oracle

## Descripción

Esta carpeta contiene los archivos correspondientes a la implementación de la base de datos **EnlaceExpress** en Oracle Database.

EnlaceExpress es un sistema orientado a la gestión de envíos y servicios de mensajería empresarial.

## Archivos

* `enlace_express_oracle_ddl.sql`: Script DDL utilizado para definir la estructura de la base de datos.

## Base de datos

* **Motor:** Oracle Database
* **PDB:** `TECNOGUA`
* **Esquema:** `ENLACE_EXPRESS`

## Contenido

La base de datos está compuesta por las tablas de seguridad, autenticación, usuarios, roles y las tablas correspondientes al funcionamiento del sistema de envíos.

Entre las principales tablas se encuentran:

* `users`
* `roles`
* `role_users`
* `resources`
* `resource_roles`
* `refresh_tokens`
* `empresas`
* `contactos`
* `direcciones`
* `mensajeros`
* `rutas`
* `tarifas`
* `envios`
* `paquetes`
* `eventos_tracking`
* `pruebas_entrega`
* `facturas`
* `auditoria`

## Implementación

La base de datos fue implementada y verificada mediante DDL y herramientas de administración de bases de datos.

El script incluido corresponde a la estructura actual de la base de datos **EnlaceExpress** en Oracle Database.
