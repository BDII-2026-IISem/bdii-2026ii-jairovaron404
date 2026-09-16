# INFORME INICIAL DEL PROYECTO INTEGRADOR

## EnlaceExpress – Mensajería corporativa

**Asignatura:** Desarrollo Web
**Programa:** Ingeniería de Sistemas
**Periodo:** 2026-II
**Tecnologías principales:** NestJS, Sequelize, API REST, Clean Architecture, DDD y RBAC

---

# 1. Introducción

El presente documento tiene como objetivo establecer una base inicial para el desarrollo del proyecto integrador **EnlaceExpress**, propuesto en la guía de proyectos integradores de la asignatura Desarrollo Web.

El proyecto consiste en desarrollar un sistema backend para una empresa de mensajería corporativa. El sistema permitirá gestionar empresas, direcciones, envíos, paquetes, mensajeros, rutas, tarifas, seguimiento de los envíos, pruebas de entrega y facturación.

El proyecto será desarrollado mediante una **API REST con NestJS**, utilizando **Sequelize** para la comunicación con las bases de datos y aplicando conceptos de **Clean Architecture, Domain-Driven Design (DDD) y RBAC** para organizar el sistema.

Como parte de la preparación del proyecto también se está trabajando con diferentes motores de bases de datos con el objetivo de mantener una estructura lógica equivalente y poder comprobar el comportamiento de la información en cada uno de ellos.

---

# 2. Descripción del proyecto

El proyecto asignado corresponde al **Proyecto 24: EnlaceExpress – Mensajería corporativa**, cuyo enfoque principal es la gestión de:

* Empresas clientes.
* Contactos.
* Direcciones de recogida y entrega.
* Envíos.
* Paquetes.
* Mensajeros.
* Rutas.
* Tarifas.
* Seguimiento de envíos.
* Pruebas de entrega.
* Facturación.

El sistema permitirá que una empresa pueda registrar solicitudes de envío desde diferentes puntos de recogida y entrega.

Cada envío podrá tener uno o varios paquetes y podrá ser asignado a un mensajero y a una ruta. También se podrá registrar el estado del envío mediante eventos de tracking.

Uno de los puntos importantes del proyecto es que un envío **no debe marcarse como entregado sin contar con una prueba de entrega y la información del receptor**.

Además, el sistema deberá permitir manejar tarifas según las reglas establecidas por el negocio y posteriormente realizar procesos de facturación.

---

# 3. Objetivo general

Desarrollar una API REST para gestionar el proceso de mensajería corporativa de EnlaceExpress, aplicando una arquitectura organizada por capas y conceptos de dominio, seguridad y autorización mediante roles y recursos.

---

# 4. Objetivos específicos

* Diseñar el modelo de datos necesario para el funcionamiento de EnlaceExpress.
* Implementar las entidades principales del negocio.
* Gestionar empresas, contactos y direcciones.
* Registrar y administrar los envíos.
* Asociar paquetes a los envíos.
* Gestionar mensajeros y rutas.
* Registrar eventos de seguimiento.
* Gestionar las pruebas de entrega.
* Administrar tarifas y procesos de facturación.
* Implementar autenticación de usuarios.
* Implementar autorización mediante RBAC.
* Proteger los recursos de la API según los roles de los usuarios.
* Aplicar Clean Architecture y conceptos de DDD.
* Crear migraciones y seeders reproducibles.
* Realizar pruebas unitarias, de integración y e2e.
* Documentar la API mediante Swagger.

---

# 5. Arquitectura propuesta

El backend será desarrollado utilizando **NestJS** y estará organizado siguiendo los principios de **Clean Architecture y Domain-Driven Design**.

Cada módulo estará dividido en diferentes capas para separar las responsabilidades.

### Domain

Contendrá las entidades y reglas principales del negocio.

Ejemplos:

* Empresa.
* Envío.
* Paquete.
* Mensajero.
* Ruta.
* Tarifa.
* Factura.
* EventoTracking.

Las entidades de esta capa no deben depender directamente de NestJS ni de Sequelize.

### Application

Contendrá los casos de uso del sistema y la lógica necesaria para coordinar las operaciones.

Algunos ejemplos serán:

* Crear envío.
* Consultar envío.
* Actualizar estado del envío.
* Asignar mensajero.
* Registrar evento de tracking.
* Registrar prueba de entrega.
* Consolidar facturación.

### Infrastructure

Esta capa será responsable de la comunicación con las bases de datos y otros elementos externos.

Aquí estarán principalmente:

* Modelos Sequelize.
* Repositorios.
* Migraciones.
* Seeders.
* Configuración de conexión.
* Adaptadores.

### Presentation

Será la parte encargada de exponer las funcionalidades mediante HTTP.

Aquí se encontrarán:

* Controladores.
* DTO.
* Validaciones.
* Serializadores.
* Decoradores.
* Documentación Swagger.

---

# 6. Modelo de negocio

El sistema estará compuesto por las siguientes entidades principales:

| Entidad        | Función                                              |
| -------------- | ---------------------------------------------------- |
| Empresa        | Representa las empresas que utilizan el servicio     |
| Contacto       | Guarda los contactos de una empresa                  |
| Dirección      | Guarda los puntos relacionados con una empresa       |
| Envío          | Representa una solicitud de mensajería               |
| Paquete        | Elemento físico asociado a un envío                  |
| EventoTracking | Registra los cambios y eventos de un envío           |
| Mensajero      | Persona encargada de realizar los envíos             |
| Ruta           | Ruta utilizada para realizar un envío                |
| Tarifa         | Define las reglas y valores para calcular los envíos |
| PruebaEntrega  | Evidencia de que un envío fue entregado              |
| Factura        | Registra la facturación de los servicios             |

---

# 7. Relaciones principales

Las relaciones planteadas para el proyecto son:

* Una **Empresa** puede tener varios **Contactos**.
* Una **Empresa** puede tener varias **Direcciones**.
* Una **Empresa** puede realizar varios **Envíos**.
* Un **Envío** puede tener varios **Paquetes**.
* Un **Mensajero** puede estar relacionado con varios **Envíos**.
* Una **Ruta** puede estar relacionada con varios **Envíos**.
* Una **Tarifa** puede ser utilizada por varios **Envíos**.
* Un **Envío** puede tener varios **EventosTracking**.
* Un **Envío** puede tener una **PruebaEntrega**.
* Una **Empresa** puede tener varias **Facturas**.
* Una **Factura** puede agrupar envíos cerrados.

Estas relaciones serán representadas posteriormente en el diagrama entidad-relación y en las estructuras de las bases de datos.

---

# 8. Modelo de seguridad RBAC

Además de las entidades del negocio, el proyecto contará con un sistema transversal de autenticación y autorización.

Para esto se utilizará el modelo **RBAC (Role-Based Access Control)**.

El sistema tendrá inicialmente los siguientes roles:

* **ADMIN**
* **CLIENTE_EMPRESA**
* **DESPACHO**
* **MENSAJERO**
* **FACTURACION**

La estructura de seguridad estará compuesta por:

* `users`
* `roles`
* `role_users`
* `resources`
* `resource_roles`
* `refresh_tokens`

Los usuarios podrán tener roles y los roles podrán tener permisos sobre diferentes recursos de la API.

Por ejemplo, se plantean inicialmente recursos como:

* `POST /envios`
* `POST /asignaciones`
* `POST /tracking`
* `POST /facturas/consolidar`

La autorización deberá comprobar que el usuario esté activo, que su rol esté activo y que dicho rol tenga acceso al recurso solicitado.

---

# 9. Modelo de base de datos

Como parte de la preparación del proyecto se diseñó una estructura de base de datos compuesta por **18 tablas**.

### Tablas del negocio

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
11. `rutas`
12. `tarifas`

### Tablas de seguridad RBAC

13. `refresh_tokens`
14. `resource_roles`
15. `resources`
16. `role_users`
17. `roles`
18. `users`

La estructura busca mantener las mismas entidades y relaciones principales independientemente del motor utilizado.

---

# 10. Motores de bases de datos utilizados

Para el desarrollo y comprobación del modelo de datos se han trabajado diferentes motores de bases de datos.

Actualmente se han configurado:

* **MySQL**
* **PostgreSQL**
* **Microsoft SQL Server**
* **Oracle Database**

La administración y conexión de los diferentes motores se está realizando principalmente mediante **DBeaver**.

El objetivo es mantener una estructura equivalente entre los motores, teniendo en cuenta que cada uno utiliza diferentes tipos de datos y mecanismos para algunas características.

Por ejemplo:

| Característica           | MySQL                | PostgreSQL | SQL Server | Oracle    |
| ------------------------ | -------------------- | ---------- | ---------- | --------- |
| Identificador automático | AUTO_INCREMENT       | IDENTITY   | IDENTITY   | IDENTITY  |
| Texto                    | VARCHAR              | VARCHAR    | VARCHAR    | VARCHAR2  |
| Fecha/hora               | DATETIME             | TIMESTAMP  | DATETIME2  | TIMESTAMP |
| Decimal                  | DECIMAL              | NUMERIC    | DECIMAL    | NUMBER    |
| Estados                  | ENUM                 | ENUM       | CHECK      | CHECK     |
| Actualización automática | ON UPDATE / triggers | Triggers   | Triggers   | Triggers  |

De esta manera se mantiene el mismo modelo lógico aunque la implementación física tenga diferencias dependiendo del motor.

---

# 11. Herramientas y entorno de trabajo

Para la preparación y desarrollo del proyecto se están utilizando diferentes herramientas y tecnologías.

### Sistema operativo

**Windows 11** como entorno principal de trabajo.

### DBeaver

Se utiliza **DBeaver** para realizar las conexiones, ejecutar consultas SQL, crear tablas, revisar relaciones y verificar las estructuras de los diferentes motores de bases de datos.

### MySQL

Se configuró la estructura de las 18 tablas utilizando las características propias de MySQL.

### PostgreSQL

Se configuró la estructura utilizando tipos como `IDENTITY`, `NUMERIC`, `TIMESTAMP` y `ENUM`, además de restricciones, claves foráneas, índices y triggers.

### SQL Server

Se creó la base de datos `enlace_express` utilizando el esquema `dbo`, `IDENTITY`, `DATETIME2`, `DECIMAL` y restricciones `CHECK` para representar los estados.

### Oracle

Se configuró el esquema **ENLACE_EXPRESS**, utilizando tipos como `NUMBER`, `VARCHAR2`, `TIMESTAMP` y restricciones `CHECK`.

### Ubuntu / WSL

El entorno de Ubuntu mediante **WSL** forma parte del entorno de trabajo utilizado para herramientas y configuraciones relacionadas con el proyecto.

### Docker

Docker forma parte del entorno utilizado para facilitar la ejecución y administración de servicios necesarios durante el desarrollo.

### Backend

El backend será desarrollado con:

* Node.js
* NestJS
* Sequelize
* TypeScript
* API REST

---

# 12. Estado actual del proyecto

En esta primera etapa se ha avanzado principalmente en el **diseño y preparación de la base de datos**.

Se realizó la configuración de las estructuras principales en los cuatro motores:

**MySQL → PostgreSQL → SQL Server → Oracle**

En cada motor se verificaron las tablas, columnas, claves primarias, claves foráneas, restricciones, índices y tipos de datos necesarios.

También se configuraron mecanismos equivalentes para manejar campos como `created_at` y `updated_at`.

En PostgreSQL se utilizaron principalmente tipos y características propias del motor como `IDENTITY` y `ENUM`.

En SQL Server se utilizaron `IDENTITY`, `DATETIME2`, `DECIMAL` y restricciones `CHECK`.

En Oracle se utilizaron columnas `IDENTITY`, `NUMBER`, `VARCHAR2`, `TIMESTAMP` y restricciones `CHECK`.

Por lo tanto, la etapa de preparación del modelo de base de datos se encuentra bastante avanzada y sirve como base para continuar con la implementación del backend.

---

# 13. Reglas importantes del negocio

El proyecto no solamente tendrá operaciones CRUD. También deberá controlar algunas reglas propias del negocio.

Una de las reglas principales establecidas en la guía es:

> Un envío no puede marcarse como entregado sin evidencia y receptor.

Esto significa que antes de cambiar un envío al estado **ENTREGADO**, el sistema deberá comprobar que exista una prueba de entrega y que se haya registrado la información correspondiente del receptor.

También deberán controlarse las transiciones de estado de los envíos.

Los estados definidos actualmente son:

* CREADO
* ASIGNADO
* EN_RECOGIDA
* EN_TRANSITO
* EN_ENTREGA
* ENTREGADO
* CANCELADO
* CON_NOVEDAD

De igual manera, se deberá controlar la información relacionada con tarifas, paquetes, mensajeros, rutas y facturación.

---

# 14. Auditoría y trazabilidad

El sistema contará con mecanismos para mantener la trazabilidad de las operaciones.

La tabla `auditoria` permitirá registrar información relacionada con cambios realizados sobre diferentes tablas.

También se conservarán fechas como:

* `created_at`
* `updated_at`
* `fecha_solicitud`
* `fecha_entrega`
* `fecha_evento`
* `fecha_emision`
* `fecha_prueba`

Esto permitirá conocer cuándo fueron creados, modificados o registrados diferentes elementos del sistema.

En lugar de eliminar directamente información importante, se utilizarán estados como `ACTIVE` e `INACTIVE` cuando sea necesario conservar la trazabilidad.

---

# 15. Migraciones y seeders

Uno de los objetivos del proyecto será crear **migraciones reproducibles**.

Las migraciones deberán permitir construir nuevamente la estructura de las bases de datos sin depender de una creación manual de las tablas.

También se deberán crear **seeders** para introducir información inicial de prueba.

Entre los datos iniciales podrán encontrarse:

* Roles.
* Usuarios.
* Recursos.
* Permisos.
* Empresas.
* Mensajeros.
* Rutas.
* Tarifas.
* Información de prueba para los envíos.

---

# 16. Pruebas

El proyecto deberá contar con diferentes niveles de pruebas.

### Pruebas unitarias

Se utilizarán para comprobar reglas y lógica del dominio de manera independiente.

### Pruebas de integración

Permitirán comprobar la comunicación entre el backend, los repositorios y la base de datos.

### Pruebas end-to-end

Se utilizarán para comprobar los flujos completos de la API.

Entre los flujos importantes estarán:

* Autenticación.
* Creación de un envío.
* Asignación de un mensajero.
* Registro de tracking.
* Registro de prueba de entrega.
* Cambio del estado del envío.
* Consolidación de facturación.
* Validación de permisos RBAC.

También se deberán probar casos donde el acceso sea permitido y casos donde sea rechazado.

---

# 17. Documentación de la API

La API será documentada utilizando **Swagger**.

La documentación permitirá conocer:

* Endpoints disponibles.
* Métodos HTTP.
* Parámetros.
* DTO.
* Respuestas.
* Códigos de error.
* Requisitos de autenticación.

También se deberá preparar una colección para realizar pruebas de los diferentes endpoints.

---

# 18. Resultado esperado

Al finalizar el proyecto se espera contar con un backend funcional para EnlaceExpress que permita administrar los principales procesos de una empresa de mensajería corporativa.

El resultado final deberá incluir:

* Código organizado por módulos y capas.
* Entidades de dominio.
* Casos de uso.
* Repositorios.
* Modelos Sequelize.
* Migraciones.
* Seeders.
* Autenticación.
* Autorización RBAC.
* API REST.
* Validaciones.
* Manejo de errores.
* Paginación y filtros.
* Swagger.
* Pruebas unitarias.
* Pruebas de integración.
* Pruebas e2e.
* Diagrama entidad-relación.
* Colección de pruebas de API.
* Evidencias del funcionamiento.

---

# 19. Plan general de trabajo

El desarrollo del proyecto se puede organizar en las siguientes etapas:

### Etapa 1. Análisis del proyecto

Revisar la narrativa, entidades, relaciones y reglas establecidas por el docente.

### Etapa 2. Diseño del modelo de datos

Definir tablas, campos, relaciones, claves primarias, claves foráneas, restricciones e índices.

### Etapa 3. Configuración de bases de datos

Implementar y verificar el modelo en MySQL, PostgreSQL, SQL Server y Oracle.

### Etapa 4. Migraciones y seeders

Crear la estructura reproducible y los datos iniciales.

### Etapa 5. Configuración del proyecto NestJS

Crear la estructura base del backend y organizar las diferentes capas.

### Etapa 6. Implementación del dominio

Crear las entidades, reglas e invariantes del negocio.

### Etapa 7. Implementación de casos de uso

Desarrollar las operaciones principales de EnlaceExpress.

### Etapa 8. Persistencia

Implementar Sequelize, modelos y repositorios.

### Etapa 9. Autenticación y RBAC

Implementar usuarios, roles, recursos, JWT y refresh tokens.

### Etapa 10. API REST

Crear controladores, DTO, validaciones y endpoints.

### Etapa 11. Pruebas

Realizar pruebas unitarias, de integración y e2e.

### Etapa 12. Documentación y entrega

Preparar Swagger, diagrama ER, colección de API, evidencias y documentación final.

---

# 20. Conclusión inicial

EnlaceExpress será desarrollado como una solución backend para la gestión de mensajería corporativa. El proyecto combina las necesidades del negocio con un sistema de autenticación y autorización basado en roles.

La primera etapa se ha enfocado en comprender la guía entregada por el docente y preparar el modelo de datos. Para esto se han trabajado cuatro motores de bases de datos: MySQL, PostgreSQL, SQL Server y Oracle, utilizando DBeaver como herramienta principal de administración y consulta.

La estructura creada servirá como base para continuar con el desarrollo del backend en NestJS. Posteriormente se implementarán las entidades de dominio, casos de uso, repositorios, autenticación, RBAC, API REST y las diferentes pruebas requeridas.

De esta manera, el proyecto seguirá una construcción progresiva desde el modelo de datos hasta una API funcional y documentada.
