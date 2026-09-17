# MIRIA – Semana 02

## Del dominio al modelo lógico

**Proyecto:** EnlaceExpress
**Semana:** 02
**Metodología:** MIRIA – Integración Responsable de IA para el Aprendizaje

---

## 1. Información de la semana

### Objetivo

Transformar el dominio identificado en la primera semana en un modelo conceptual y lógico de datos, definiendo las entidades, atributos, relaciones, claves e integridad necesarias para el funcionamiento de EnlaceExpress.

Durante esta etapa también se buscó que el diseño pudiera implementarse en los cuatro motores de bases de datos requeridos por el proyecto:

* MySQL
* PostgreSQL
* MS SQL Server
* Oracle

---

## 2. Antes de clase

Para esta semana se tomó como base el análisis realizado sobre el dominio de EnlaceExpress.

Se revisaron las entidades principales del sistema y las relaciones existentes entre ellas. También se tuvo en cuenta la necesidad de implementar el mismo modelo en diferentes motores de bases de datos.

Se identificaron como principales entidades del sistema:

* Empresas
* Contactos
* Direcciones
* Mensajeros
* Rutas
* Tarifas
* Envíos
* Paquetes
* Eventos de tracking
* Pruebas de entrega
* Facturas

También se consideraron las entidades relacionadas con autenticación y control de acceso:

* Users
* Roles
* Role_users
* Resources
* Resource_roles
* Refresh_tokens
* Auditoria

---

## 3. Durante la clase

Se trabajó en la transformación del modelo del dominio hacia una estructura de datos más organizada.

Se definieron las relaciones entre las entidades y se identificaron las claves primarias y foráneas necesarias.

También se revisaron las dependencias entre tablas para establecer un orden correcto de creación.

El diseño se preparó pensando en que la estructura debía mantenerse equivalente entre los cuatro motores de bases de datos, realizando posteriormente las adaptaciones necesarias según el dialecto SQL de cada uno.

---

## 4. Después de clase

Después del trabajo de modelado se comenzó la implementación de la estructura de la base de datos.

Se organizaron los scripts DDL correspondientes a cada motor:

```text
database/
├── mysql/
│   └── enlace_express_mysql_ddl.sql
├── postgresql/
│   └── enlace_express_postgresql_ddl.sql
├── sql-server/
│   └── enlace_express_sqlserver_ddl.sql
└── oracle/
    └── enlace_express_oracle_ddl.sql
```

También se generaron diagramas de estructura para cada motor y se verificó que las tablas y relaciones principales correspondieran con el modelo planteado.

---

# 5. Requisitos y criterios de aceptación

## REQ-S02-01 – Modelo conceptual y lógico

Se debe contar con un modelo que represente las entidades, atributos y relaciones principales de EnlaceExpress.

### AC-S02-01

El modelo debe permitir identificar las entidades principales y sus relaciones.

**Resultado:** Cumplido.

---

## REQ-S02-02 – Claves y dependencias

Se deben definir las claves primarias y las relaciones mediante claves foráneas.

### AC-S02-02

Las tablas deben contar con claves que permitan mantener las relaciones y dependencias del modelo.

**Resultado:** Cumplido.

---

## REQ-S02-03 – Normalización y anomalías

Se debe revisar la organización de los datos para reducir duplicidad y evitar problemas de inserción, actualización o eliminación.

### AC-S02-03

La estructura debe separar la información en entidades relacionadas y evitar almacenar información repetida innecesariamente.

**Resultado:** Cumplido.

---

## REQ-S02-04 – Integridad y diccionario de datos

Se deben establecer reglas básicas de integridad para mantener datos consistentes.

### AC-S02-04

Las tablas deben contar con restricciones y relaciones que ayuden a mantener la integridad de los datos.

**Resultado:** Cumplido.

---

## REQ-S02-05 – Issues

Se deben registrar y actualizar las actividades de la semana mediante Issues y mantener el flujo de trabajo con WIP = 1.

### AC-S02-05

Las actividades de la semana deben quedar registradas y relacionadas con sus resultados.

**Resultado:** Cumplido mediante la documentación y evidencias disponibles.

---

## REQ-S02-06 – Registro del proceso

Se debe registrar el proceso seguido, las decisiones tomadas, cambios, pruebas y uso de IA.

### AC-S02-06

El proceso debe quedar documentado en la bitácora general del proyecto.

**Resultado:** Cumplido.

---

# 6. Trazabilidad

| Objetivo | Requisito  | Criterio de aceptación | Evidencia                 |
| -------- | ---------- | ---------------------- | ------------------------- |
| OBJ-S02  | REQ-S02-01 | AC-S02-01              | `docs/diagramas/`         |
| OBJ-S02  | REQ-S02-02 | AC-S02-02              | DDL de los cuatro motores |
| OBJ-S02  | REQ-S02-03 | AC-S02-03              | Estructura de las tablas  |
| OBJ-S02  | REQ-S02-04 | AC-S02-04              | DDL y restricciones       |
| OBJ-S02  | REQ-S02-05 | AC-S02-05              | Issues del proyecto       |
| OBJ-S02  | REQ-S02-06 | AC-S02-06              | `docs/proceso.md`         |

---

# 7. Evidencias

Las principales evidencias relacionadas con esta semana se encuentran en:

### Diagramas

```text
docs/diagramas/mysql/
docs/diagramas/postgresql/
docs/diagramas/sql-server/
docs/diagramas/oracle/
```

### Scripts DDL

```text
database/mysql/enlace_express_mysql_ddl.sql
database/postgresql/enlace_express_postgresql_ddl.sql
database/sql-server/enlace_express_sqlserver_ddl.sql
database/oracle/enlace_express_oracle_ddl.sql
```

### Evidencias de estructuras

```text
evidencias/02-mysql/
evidencias/03-postgresql/
evidencias/04-sql-server/
evidencias/05-oracle/
```

Estas evidencias permiten comprobar que el modelo fue llevado a los cuatro motores de bases de datos.

---

# 8. Issues

Se mantuvo la organización de actividades siguiendo el principio de WIP = 1.

### ISS-S02-01

**Actividad:** Definir el modelo conceptual.

**Dependencia:** Ninguna.

**Estado:** Done.

---

### ISS-S02-02

**Actividad:** Convertir el modelo conceptual al modelo lógico.

**Dependencia:** ISS-S02-01.

**Estado:** Done.

---

### ISS-S02-03

**Actividad:** Definir claves y dependencias.

**Dependencia:** ISS-S02-02.

**Estado:** Done.

---

### ISS-S02-04

**Actividad:** Revisar normalización e integridad.

**Dependencia:** ISS-S02-03.

**Estado:** Done.

---

### ISS-S02-05

**Actividad:** Registrar evidencias y actualizar Issues.

**Dependencia:** ISS-S02-04.

**Estado:** Done.

---

### ISS-S02-06

**Actividad:** Registrar el proceso y las decisiones tomadas.

**Dependencia:** ISS-S02-05.

**Estado:** Done.

---

## Flujo de dependencias

```text
ISS-S02-01
     ↓
ISS-S02-02
     ↓
ISS-S02-03
     ↓
ISS-S02-04
     ↓
ISS-S02-05
     ↓
ISS-S02-06
```

---

# 9. Gate semanal

### Verificación

| Elemento                 | Estado   |
| ------------------------ | -------- |
| Modelo conceptual        | Cumplido |
| Modelo lógico            | Cumplido |
| Claves y relaciones      | Cumplido |
| Normalización            | Cumplido |
| Integridad               | Cumplido |
| Evidencias               | Cumplido |
| Issues                   | Done     |
| Registro del proceso     | Cumplido |
| Uso y verificación de IA | Cumplido |

### Resultado del Gate

**Gate S02: CUMPLIDO**

El modelo de datos de EnlaceExpress quedó definido y preparado para su implementación en los diferentes motores de bases de datos.

---

# 10. Gate Learning

Durante esta semana se aprendió que el diseño de una base de datos no consiste solamente en crear tablas. Primero es necesario entender las entidades y las relaciones del problema para después convertirlas en una estructura lógica.

También se identificó que un mismo modelo puede necesitar algunos cambios de sintaxis dependiendo del motor utilizado.

Uno de los puntos importantes fue mantener la misma lógica de negocio en MySQL, PostgreSQL, MS SQL Server y Oracle, haciendo solamente las adaptaciones necesarias para cada sistema.

---

# 11. Retrospectiva

### ¿Qué funcionó?

La separación de las entidades permitió organizar mejor la información del sistema.

También funcionó trabajar primero el modelo y después llevarlo a los diferentes motores.

### ¿Qué problema se presentó?

Al implementar el modelo en diferentes motores aparecieron diferencias en los tipos de datos y en la sintaxis utilizada por cada sistema.

### ¿Qué cambio se realizó?

Se mantuvo el mismo modelo lógico y se adaptó el DDL según las características de cada motor.

### ¿Qué se puede mejorar?

Se puede mejorar la documentación de las decisiones tomadas durante cada adaptación y mantener una trazabilidad más detallada entre el modelo y cada script DDL.

---

# 12. Uso de IA

La inteligencia artificial se utilizó como herramienta de apoyo durante el desarrollo del proyecto.

Se utilizó principalmente para:

* Revisar la estructura del modelo.
* Analizar relaciones entre entidades.
* Resolver dudas sobre normalización.
* Revisar diferencias entre motores SQL.
* Ayudar a organizar los scripts DDL.
* Identificar posibles errores de sintaxis.
* Proponer formas de documentar el proceso.

La IA no se tomó como sustituto de la verificación.

Las estructuras fueron comprobadas mediante la ejecución de los scripts y la revisión de las bases de datos en las herramientas utilizadas para cada motor.

La decisión final sobre los cambios realizados quedó bajo revisión del estudiante.

---

# 13. Verificación humana

La estructura desarrollada fue revisada mediante las herramientas de administración de bases de datos.

Se utilizaron:

* DBeaver
* MySQL Workbench
* pgAdmin 4
* SQL Server Management Studio
* Oracle SQL Developer

También se verificaron los diagramas y las estructuras generadas para comprobar que las tablas correspondieran con el modelo definido.

---

# 14. Estado final de la semana

**Estado:** COMPLETADA

Al finalizar la Semana 02 se cuenta con el modelo lógico de EnlaceExpress y con su implementación estructural en los cuatro motores requeridos.

El proyecto cuenta con:

* Entidades definidas.
* Relaciones definidas.
* Claves primarias.
* Claves foráneas.
* Restricciones de integridad.
* Scripts DDL para los cuatro motores.
* Diagramas de estructura.
* Evidencias de implementación.
* Registro del proceso.

La siguiente etapa corresponde a la administración y operación de los motores de bases de datos.
