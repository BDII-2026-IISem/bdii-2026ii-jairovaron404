# MIRIA – Semana 03

## Administración y operación

**Proyecto:** EnlaceExpress
**Semana:** 03
**Metodología:** MIRIA – Integración Responsable de IA para el Aprendizaje

---

# 1. Información de la semana

## Objetivo

Configurar y administrar los motores de bases de datos requeridos para EnlaceExpress, trabajando con instancias, bases de datos, esquemas, usuarios, roles, respaldos y herramientas de administración.

También se buscó comprobar que el proyecto pudiera funcionar de manera equivalente en:

* MySQL
* PostgreSQL
* MS SQL Server
* Oracle

---

# 2. Antes de clase

Para esta etapa se tomó como base el modelo lógico desarrollado anteriormente.

Se revisaron los cuatro motores de bases de datos que forman parte del proyecto y se organizó el entorno necesario para trabajar con ellos.

También se tuvo en cuenta la necesidad de mantener los servicios separados y poder acceder a cada motor mediante herramientas de administración.

Las herramientas utilizadas fueron:

* Docker
* WSL / Ubuntu
* DBeaver
* MySQL Workbench
* pgAdmin 4
* SQL Server Management Studio
* Oracle SQL Developer

---

# 3. Durante la clase

Se trabajó en la configuración y administración de los motores de bases de datos.

Se configuraron los servicios utilizando contenedores Docker y se establecieron los puertos correspondientes para permitir la conexión desde las herramientas de administración.

También se revisó la estructura de las bases de datos y se realizaron pruebas de conexión y funcionamiento.

Se trabajó con los usuarios, roles y estructuras necesarias para el control de acceso.

Además, se revisaron las diferencias existentes entre los motores, principalmente en la forma de definir tipos de datos, usuarios, esquemas, restricciones, procedimientos y otros objetos.

---

# 4. Después de clase

Se continuó con la verificación de los servicios y la documentación de las configuraciones realizadas.

Se comprobó que los cuatro motores pudieran ejecutarse y mantenerse disponibles de forma independiente.

También se verificó la persistencia de los datos mediante los volúmenes utilizados por Docker.

Se realizaron respaldos de las bases de datos y se organizaron las evidencias correspondientes.

Finalmente, se revisaron las estructuras desde DBeaver y desde las herramientas gráficas propias de cada motor.

---

# 5. Requisitos y criterios de aceptación

## REQ-S03-01 – Instancias, bases, esquemas y objetos

Se deben configurar las instancias y bases de datos necesarias para ejecutar EnlaceExpress.

### AC-S03-01

Los cuatro motores deben estar configurados y permitir el acceso a sus respectivas bases de datos.

**Resultado:** Cumplido.

Se verificaron los cuatro motores:

* MySQL
* PostgreSQL
* MS SQL Server
* Oracle

También se verificaron sus estructuras y objetos mediante las herramientas de administración.

---

## REQ-S03-02 – Usuarios, roles y privilegios

Se deben configurar usuarios y roles para controlar el acceso a los recursos del sistema.

### AC-S03-02

La base de datos debe contar con una estructura de usuarios y roles que permita representar los diferentes tipos de acceso del sistema.

**Resultado:** Cumplido.

En el modelo de EnlaceExpress se implementaron estructuras relacionadas con:

* Usuarios.
* Roles.
* Relación entre usuarios y roles.
* Recursos.
* Relación entre recursos y roles.
* Tokens de actualización.

La estructura permite representar diferentes perfiles de acceso dentro del sistema.

---

## REQ-S03-03 – Importación, exportación y respaldo

Se deben realizar procesos de respaldo y recuperación de las bases de datos.

### AC-S03-03

Deben existir evidencias de los procesos de respaldo y de la conservación de los datos.

**Resultado:** Cumplido.

Se realizaron y documentaron procesos relacionados con respaldos y persistencia de los datos.

Las evidencias se encuentran principalmente en:

```text
evidencias/08-persistencia/
evidencias/09-backups/
```

También existen evidencias específicas relacionadas con SQL Server y Oracle.

---

## REQ-S03-04 – Portabilidad y diferencias de dialecto

Se deben identificar y manejar las diferencias existentes entre los motores de bases de datos.

### AC-S03-04

El modelo de EnlaceExpress debe poder implementarse en los cuatro motores realizando las adaptaciones necesarias de cada dialecto.

**Resultado:** Cumplido.

Se cuenta con un DDL independiente para cada motor:

```text
database/mysql/enlace_express_mysql_ddl.sql
database/postgresql/enlace_express_postgresql_ddl.sql
database/sql-server/enlace_express_sqlserver_ddl.sql
database/oracle/enlace_express_oracle_ddl.sql
```

Los scripts mantienen la misma estructura lógica del proyecto, adaptando la sintaxis y características propias de cada motor.

---

## REQ-S03-05 – Issues

Se deben registrar y actualizar las actividades de la semana mediante Issues, manteniendo WIP = 1.

### AC-S03-05

Las actividades deben quedar registradas y relacionadas con los resultados obtenidos.

**Resultado:** Cumplido mediante la documentación y evidencias disponibles.

---

## REQ-S03-06 – Registro del proceso

Se deben documentar las decisiones, cambios, pruebas, bloqueos y uso de IA.

### AC-S03-06

El proceso debe quedar registrado en la bitácora general.

**Resultado:** Cumplido.

---

# 6. Trazabilidad

| Objetivo | Requisito  | Criterio de aceptación | Evidencia                                                                |
| -------- | ---------- | ---------------------- | ------------------------------------------------------------------------ |
| OBJ-S03  | REQ-S03-01 | AC-S03-01              | `evidencias/02-mysql/`, `03-postgresql/`, `04-sql-server/`, `05-oracle/` |
| OBJ-S03  | REQ-S03-02 | AC-S03-02              | Estructuras RBAC y evidencias de usuarios                                |
| OBJ-S03  | REQ-S03-03 | AC-S03-03              | `evidencias/08-persistencia/`, `evidencias/09-backups/`                  |
| OBJ-S03  | REQ-S03-04 | AC-S03-04              | `database/*/`                                                            |
| OBJ-S03  | REQ-S03-05 | AC-S03-05              | Issues del proyecto                                                      |
| OBJ-S03  | REQ-S03-06 | AC-S03-06              | `docs/proceso.md`                                                        |

---

# 7. Evidencias

Las principales evidencias relacionadas con esta semana se encuentran organizadas de la siguiente manera.

## MySQL

```text
evidencias/02-mysql/
```

Incluye evidencias de:

* Configuración.
* Docker Compose.
* Variables de entorno.
* Persistencia.
* Base de datos.
* DBeaver.
* Pruebas de funcionamiento.
* MySQL Workbench.

---

## PostgreSQL

```text
evidencias/03-postgresql/
```

Incluye evidencias de:

* Configuración.
* Docker Compose.
* Variables de entorno.
* Persistencia.
* Contenedor.
* Base de datos.
* DBeaver.
* Pruebas de funcionamiento.
* pgAdmin 4.

---

## MS SQL Server

```text
evidencias/04-sql-server/
```

Incluye evidencias de:

* Configuración.
* Docker.
* Variables de entorno.
* Persistencia.
* Contenedor.
* Base de datos.
* Respaldo.
* DBeaver.
* Pruebas de funcionamiento.
* SQL Server Management Studio.

---

## Oracle

```text
evidencias/05-oracle/
```

Incluye evidencias de:

* Configuración.
* Docker Compose.
* Variables de entorno.
* Persistencia.
* Configuración del servicio.
* Usuarios.
* Data Pump.
* DBeaver.
* Pruebas de funcionamiento.
* Oracle SQL Developer.

---

## Entorno general

También se cuenta con evidencias del funcionamiento conjunto de los motores:

```text
evidencias/06-entorno-general/
```

Estas evidencias permiten comprobar los servicios, puertos, redes y contenedores utilizados.

---

# 8. Issues

Las actividades se organizaron siguiendo el principio de WIP = 1.

## ISS-S03-01

**Actividad:** Configurar las instancias y servicios de los cuatro motores.

**Dependencia:** Ninguna.

**Estado:** Done.

---

## ISS-S03-02

**Actividad:** Configurar y verificar bases de datos, usuarios y roles.

**Dependencia:** ISS-S03-01.

**Estado:** Done.

---

## ISS-S03-03

**Actividad:** Realizar procesos de persistencia, importación, exportación y respaldo.

**Dependencia:** ISS-S03-02.

**Estado:** Done.

---

## ISS-S03-04

**Actividad:** Revisar las diferencias de dialecto y portabilidad entre los motores.

**Dependencia:** ISS-S03-03.

**Estado:** Done.

---

## ISS-S03-05

**Actividad:** Registrar evidencias y actualizar las Issues.

**Dependencia:** ISS-S03-04.

**Estado:** Done.

---

## ISS-S03-06

**Actividad:** Registrar el proceso y el uso de IA.

**Dependencia:** ISS-S03-05.

**Estado:** Done.

---

## Flujo de dependencias

```text
ISS-S03-01
     ↓
ISS-S03-02
     ↓
ISS-S03-03
     ↓
ISS-S03-04
     ↓
ISS-S03-05
     ↓
ISS-S03-06
```

---

# 9. Gate semanal

## Verificación

| Elemento                 | Estado   |
| ------------------------ | -------- |
| Instancias y servicios   | Cumplido |
| Bases de datos           | Cumplido |
| Esquemas y objetos       | Cumplido |
| Usuarios y roles         | Cumplido |
| Persistencia             | Cumplido |
| Respaldos                | Cumplido |
| Portabilidad             | Cumplido |
| Diferencias de dialecto  | Cumplido |
| Evidencias               | Cumplido |
| Issues                   | Done     |
| Registro del proceso     | Cumplido |
| Uso y verificación de IA | Cumplido |

## Resultado del Gate

**Gate S03: CUMPLIDO**

Los cuatro motores de bases de datos fueron configurados, administrados y verificados para el proyecto EnlaceExpress.

---

# 10. Gate Learning

Durante esta semana se aprendió que administrar una base de datos implica más que crear las tablas.

Fue necesario trabajar también con los servicios, conexiones, usuarios, roles, respaldos, persistencia y herramientas de administración.

También se comprobó que los cuatro motores tienen diferencias en su funcionamiento y en su sintaxis.

Por esta razón, aunque el modelo lógico de EnlaceExpress se mantiene igual, cada motor necesita su propio script DDL y algunas configuraciones específicas.

Otro aprendizaje importante fue la utilización de Docker para mantener los diferentes motores separados y poder ejecutarlos de forma controlada.

---

# 11. Retrospectiva

## ¿Qué funcionó?

El uso de Docker permitió separar los cuatro motores y facilitar su administración.

También funcionó utilizar DBeaver como herramienta común para conectarse a los diferentes motores.

Las herramientas nativas permitieron realizar una segunda verificación de las bases de datos.

---

## ¿Qué problema se presentó?

Cada motor utiliza características y sintaxis diferentes.

Esto hizo necesario adaptar los scripts y revisar individualmente la implementación de cada base de datos.

---

## ¿Qué cambio se realizó?

Se decidió mantener un DDL independiente para cada motor y conservar la misma lógica del modelo de EnlaceExpress.

También se organizaron las evidencias por motor para facilitar la revisión.

---

## ¿Qué se puede mejorar?

Se puede mejorar la automatización de los procesos de respaldo y la documentación de las diferencias específicas entre cada motor.

También se puede mantener una comparación más detallada de los objetos y características disponibles en cada sistema.

---

# 12. Uso de IA

La inteligencia artificial se utilizó como apoyo durante el desarrollo y administración del proyecto.

Se utilizó principalmente para:

* Resolver dudas sobre la configuración de los motores.
* Revisar comandos SQL.
* Analizar diferencias entre dialectos.
* Ayudar a identificar posibles errores.
* Orientar la configuración de Docker.
* Revisar estructuras de usuarios y roles.
* Apoyar la organización de los respaldos.
* Ayudar a documentar el proceso.

La IA fue utilizada como herramienta de apoyo y no como sustituto de la comprobación.

Las instrucciones y soluciones propuestas fueron verificadas mediante la ejecución de comandos, conexión a los motores, revisión de estructuras y pruebas de funcionamiento.

---

# 13. Verificación humana

La verificación se realizó mediante diferentes herramientas.

### Herramienta común

**DBeaver**

Se utilizó para comprobar las conexiones y estructuras de los cuatro motores.

### Herramientas nativas

* MySQL Workbench para MySQL.
* pgAdmin 4 para PostgreSQL.
* SQL Server Management Studio para MS SQL Server.
* Oracle SQL Developer para Oracle.

También se utilizaron Docker y WSL para comprobar el estado de los servicios, contenedores, redes, puertos y persistencia.

Las evidencias correspondientes quedaron organizadas dentro del directorio `evidencias/`.

---

# 14. Estado final de la semana

**Estado:** COMPLETADA

Al finalizar la Semana 03, EnlaceExpress cuenta con los cuatro motores de bases de datos configurados y funcionando.

Se cuenta con:

* MySQL configurado.
* PostgreSQL configurado.
* MS SQL Server configurado.
* Oracle configurado.
* Bases de datos creadas.
* Estructuras implementadas.
* Usuarios y roles.
* Persistencia de datos.
* Respaldos.
* Scripts DDL independientes.
* Conexiones mediante DBeaver.
* Verificación mediante herramientas nativas.
* Evidencias organizadas.
* Documentación del proceso.

Con esta etapa se completa la configuración y administración inicial de los motores requeridos para el proyecto EnlaceExpress.
