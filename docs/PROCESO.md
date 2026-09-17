# Bitácora general del proyecto – EnlaceExpress

## 1. Información general

**Proyecto:** EnlaceExpress
**Curso:** Base de Datos II
**Metodología:** MIRIA – Integración Responsable de IA para el Aprendizaje

Este documento registra el proceso general de desarrollo del proyecto EnlaceExpress. Se documentan las decisiones tomadas, cambios realizados, pruebas, problemas encontrados, soluciones aplicadas, estado del proyecto, uso de inteligencia artificial y acciones pendientes.

El documento funciona como una bitácora general y complementa los documentos correspondientes a cada semana:

```text
docs/semanas/
├── MIRIA-semana-01.md
├── MIRIA-semana-02.md
└── MIRIA-semana-03.md
```

---

# 2. Propósito

El propósito de esta bitácora es mantener un registro del proceso seguido durante el desarrollo del proyecto.

Se busca dejar evidencia de:

* Las decisiones tomadas.
* Los cambios realizados.
* Las configuraciones realizadas.
* Las pruebas ejecutadas.
* Los problemas encontrados.
* Las soluciones aplicadas.
* El uso de inteligencia artificial.
* La verificación humana de las soluciones.
* El estado actual del proyecto.
* Las actividades pendientes.

La bitácora también permite relacionar el trabajo realizado con la metodología MIRIA y mantener una trazabilidad entre los objetivos, requisitos, criterios de aceptación y evidencias.

---

# 3. Contexto del proyecto

EnlaceExpress es un sistema orientado a la gestión de envíos y servicios de entrega para empresas.

El proyecto requiere implementar el mismo dominio de datos utilizando cuatro motores:

* MySQL
* PostgreSQL
* MS SQL Server
* Oracle

El proyecto contempla tanto las entidades relacionadas con el negocio como las estructuras necesarias para autenticación y control de acceso.

Entre las principales entidades de negocio se encuentran:

```text
empresas
contactos
direcciones
mensajeros
rutas
tarifas
envios
paquetes
eventos_tracking
pruebas_entrega
facturas
```

También se incluyen estructuras relacionadas con autenticación y RBAC:

```text
users
roles
role_users
resources
resource_roles
refresh_tokens
auditoria
```

---

# 4. Organización del repositorio

La documentación y evidencias del proyecto se organizaron de la siguiente manera:

```text
docs/
├── contexto/
├── diagramas/
├── informes/
├── semanas/
│   ├── MIRIA-semana-01.md
│   ├── MIRIA-semana-02.md
│   └── MIRIA-semana-03.md
└── proceso.md
```

Los scripts de las bases de datos se encuentran separados por motor:

```text
database/
├── mysql/
├── postgresql/
├── sql-server/
└── oracle/
```

Las evidencias se organizaron también por motor y por actividad:

```text
evidencias/
├── 01-proyecto/
├── 02-mysql/
├── 03-postgresql/
├── 04-sql-server/
├── 05-oracle/
├── 06-entorno-general/
├── 07-dbeaver/
├── 08-persistencia/
├── 09-backups/
└── 10-verificacion-final/
```

---

# 5. Semana 01 – Problema de datos y entorno reproducible

## Propósito

La primera etapa permitió establecer el contexto del problema y organizar la base inicial del proyecto.

Se identificaron los actores, procesos, reglas, entidades, atributos y relaciones principales de EnlaceExpress.

También se definió la necesidad de trabajar con cuatro motores de bases de datos y de mantener evidencias del proceso.

## Decisiones

Se decidió utilizar EnlaceExpress como dominio del proyecto.

También se decidió implementar el proyecto en:

* MySQL.
* PostgreSQL.
* MS SQL Server.
* Oracle.

Se decidió utilizar Docker para facilitar la creación y administración de los diferentes servicios.

Para la administración y verificación se utilizaron DBeaver y las herramientas gráficas propias de cada motor.

## Cambios realizados

Se organizó la estructura inicial del repositorio y se crearon directorios separados para:

* Bases de datos.
* Documentación.
* Diagramas.
* Evidencias.
* Servicios.

También se organizaron los archivos de configuración de los servicios.

## Pruebas

Se realizaron pruebas de:

* Ejecución de los contenedores.
* Conectividad.
* Puertos.
* Redes.
* Acceso a las bases de datos.

## Resultado

Se obtuvo un entorno preparado para trabajar con los cuatro motores de bases de datos.

---

# 6. Semana 02 – Del dominio al modelo lógico

## Propósito

La segunda etapa estuvo enfocada en transformar el dominio de EnlaceExpress en una estructura organizada de datos.

Se definieron las entidades, atributos, relaciones, claves y restricciones necesarias.

## Decisiones

Se decidió mantener un modelo lógico equivalente para los cuatro motores.

La lógica del proyecto debía mantenerse igual aunque la implementación necesitara adaptaciones específicas para cada sistema.

También se decidió utilizar un script DDL independiente para cada motor.

## Cambios realizados

Se crearon y organizaron los scripts:

```text
database/mysql/enlace_express_mysql_ddl.sql
database/postgresql/enlace_express_postgresql_ddl.sql
database/sql-server/enlace_express_sqlserver_ddl.sql
database/oracle/enlace_express_oracle_ddl.sql
```

Se generaron diagramas correspondientes a las estructuras implementadas.

## Pruebas

Se verificaron:

* Tablas.
* Claves primarias.
* Claves foráneas.
* Relaciones.
* Restricciones.
* Estructuras de usuarios y roles.
* Correspondencia entre el modelo y los scripts.

## Resultado

El modelo lógico quedó preparado e implementado en los cuatro motores.

---

# 7. Semana 03 – Administración y operación

## Propósito

La tercera etapa estuvo enfocada en la configuración, administración y operación de los cuatro motores.

Se trabajó con:

* Instancias.
* Bases de datos.
* Esquemas.
* Usuarios.
* Roles.
* Privilegios.
* Persistencia.
* Respaldos.
* Conexiones.
* Diferencias entre motores.

## Decisiones

Se decidió mantener cada motor en un servicio independiente.

Se utilizó Docker para administrar los servicios y permitir su ejecución de forma controlada.

También se decidió utilizar DBeaver como herramienta común de administración y las herramientas nativas de cada motor como segunda forma de verificación.

## Cambios realizados

Se configuraron los servicios de:

```text
MySQL
PostgreSQL
MS SQL Server
Oracle
```

Se configuraron los puertos y las variables necesarias para permitir las conexiones.

También se implementaron estructuras relacionadas con usuarios, roles y control de acceso.

## Pruebas

Se verificaron:

* Estado de los contenedores.
* Conectividad.
* Puertos.
* Redes.
* Bases de datos.
* Estructuras.
* Usuarios.
* Roles.
* Persistencia.
* Respaldos.
* Funcionamiento simultáneo de los servicios.

## Resultado

Los cuatro motores quedaron configurados y disponibles para el proyecto.

---

# 8. Decisiones técnicas generales

## 8.1 Uso de Docker

Se utilizó Docker para mantener los motores separados y facilitar su administración.

Cada motor tiene su propia configuración y servicio.

La estructura permite iniciar o detener los motores de manera independiente o mediante los scripts generales del proyecto.

---

## 8.2 Uso de DBeaver

DBeaver se utilizó como herramienta común para trabajar con los cuatro motores.

Esto permitió realizar tareas como:

* Conectar a las bases de datos.
* Ejecutar SQL.
* Revisar tablas.
* Revisar relaciones.
* Consultar datos.
* Generar DDL.
* Verificar estructuras.

---

## 8.3 Uso de herramientas nativas

Además de DBeaver se utilizaron herramientas específicas:

| Motor         | Herramienta                  |
| ------------- | ---------------------------- |
| MySQL         | MySQL Workbench              |
| PostgreSQL    | pgAdmin 4                    |
| MS SQL Server | SQL Server Management Studio |
| Oracle        | Oracle SQL Developer         |

El objetivo fue realizar una segunda comprobación de las bases de datos y sus estructuras.

---

## 8.4 DDL independiente

Aunque el modelo lógico es el mismo, se utilizaron scripts separados porque cada motor posee diferencias en:

* Tipos de datos.
* Sintaxis.
* Identidades y secuencias.
* Restricciones.
* Procedimientos.
* Triggers.
* Funciones.
* Usuarios y privilegios.
* Características propias del motor.

Por esta razón no se intentó utilizar un único script SQL para los cuatro sistemas.

---

# 9. Cambios importantes durante el desarrollo

Durante la implementación fue necesario adaptar diferentes partes del proyecto según el motor utilizado.

Uno de los principales aprendizajes fue que una estructura que funciona directamente en un motor no necesariamente puede copiarse sin cambios a otro.

Por esta razón se realizaron verificaciones independientes después de implementar cada estructura.

También se organizaron los scripts DDL generados a partir de las bases de datos implementadas.

---

# 10. Pruebas y verificación

La verificación del proyecto se realizó en diferentes niveles.

## 10.1 Verificación de servicios

Se comprobaron los contenedores y servicios mediante Docker.

Se revisaron:

* Estado de los contenedores.
* Puertos.
* Redes.
* Persistencia.

---

## 10.2 Verificación de conexiones

Se comprobaron las conexiones de los cuatro motores desde DBeaver.

Se verificó que cada conexión permitiera acceder a su respectiva base de datos.

---

## 10.3 Verificación de estructuras

Se revisaron las tablas y relaciones utilizando DBeaver y las herramientas nativas.

---

## 10.4 Verificación de datos

Se realizaron consultas y pruebas para comprobar que las estructuras permitieran almacenar y consultar información.

---

## 10.5 Verificación de persistencia

Se comprobó que los datos permanecieran disponibles después de reiniciar los servicios correspondientes.

Las evidencias se encuentran en:

```text
evidencias/08-persistencia/
```

---

## 10.6 Verificación de respaldos

Se realizaron procesos de respaldo para comprobar la capacidad de conservar la información.

Las evidencias se encuentran en:

```text
evidencias/09-backups/
```

También existen evidencias específicas de respaldo para algunos motores.

---

# 11. Evidencias

Las evidencias fueron organizadas para facilitar su revisión.

## Proyecto general

```text
evidencias/01-proyecto/
```

Contiene evidencias generales del proyecto y del entorno.

## MySQL

```text
evidencias/02-mysql/
```

## PostgreSQL

```text
evidencias/03-postgresql/
```

## MS SQL Server

```text
evidencias/04-sql-server/
```

## Oracle

```text
evidencias/05-oracle/
```

## Entorno general

```text
evidencias/06-entorno-general/
```

## DBeaver

```text
evidencias/07-dbeaver/
```

## Persistencia

```text
evidencias/08-persistencia/
```

## Backups

```text
evidencias/09-backups/
```

## Verificación final

```text
evidencias/10-verificacion-final/
```

---

# 12. Uso de inteligencia artificial

La inteligencia artificial se utilizó como herramienta de apoyo durante diferentes etapas del proyecto.

Su utilización estuvo orientada principalmente a:

* Resolver dudas técnicas.
* Revisar comandos SQL.
* Analizar estructuras de bases de datos.
* Ayudar con la sintaxis de los diferentes motores.
* Revisar relaciones entre tablas.
* Identificar posibles errores.
* Orientar configuraciones de Docker.
* Ayudar a organizar la documentación.
* Revisar problemas encontrados durante la implementación.

La IA fue utilizada como apoyo y las respuestas obtenidas no se consideraron automáticamente correctas.

---

# 13. Verificación humana del uso de IA

Las propuestas obtenidas mediante IA fueron revisadas antes de incorporarlas al proyecto.

La verificación se realizó mediante:

* Ejecución de comandos.
* Ejecución de scripts SQL.
* Pruebas de conexión.
* Revisión de tablas.
* Revisión de relaciones.
* Consultas de prueba.
* Comprobación de contenedores.
* Revisión mediante DBeaver.
* Revisión mediante herramientas nativas.

Cuando una propuesta no funcionaba directamente, se revisó el error y se realizaron los ajustes necesarios.

La implementación final fue realizada y comprobada dentro del entorno del proyecto.

---

# 14. Estado del proyecto

## Estado actual

**Proyecto funcional y documentado en los cuatro motores.**

Actualmente se cuenta con:

* Modelo de datos de EnlaceExpress.
* MySQL implementado.
* PostgreSQL implementado.
* MS SQL Server implementado.
* Oracle implementado.
* Scripts DDL por motor.
* Diagramas por motor.
* Servicios Docker.
* Configuración de persistencia.
* Usuarios y roles.
* Evidencias de administración.
* Evidencias de DBeaver.
* Evidencias de herramientas nativas.
* Evidencias de respaldos.
* Evidencias de verificación.

---

# 15. Bloqueos y problemas encontrados

Durante el desarrollo se presentaron problemas relacionados principalmente con las diferencias entre motores y con la configuración del entorno.

Los problemas fueron tratados mediante:

1. Revisión del error.
2. Identificación de la causa.
3. Consulta de documentación o apoyo mediante IA.
4. Modificación de la configuración o consulta.
5. Nueva ejecución.
6. Verificación del resultado.

Este proceso permitió corregir los problemas sin cambiar la lógica principal del proyecto.

---

# 16. Control de cambios

El proyecto utiliza Git para controlar los cambios realizados.

Los cambios se organizan mediante commits relacionados con actividades concretas.

Entre los cambios registrados se encuentran:

* Configuración de servicios.
* Actualización del README.
* Incorporación de scripts DDL.
* Documentación de los motores.
* Incorporación de evidencias.
* Documentación de la metodología MIRIA.

Los commits permiten mantener un historial del desarrollo y facilitar la revisión del proyecto.

---

# 17. Documentación relacionada

La documentación del proyecto se encuentra organizada en:

### Contexto

```text
docs/contexto/
```

### Diagramas

```text
docs/diagramas/
```

### Informes

```text
docs/informes/
```

### Semanas MIRIA

```text
docs/semanas/
```

### Evidencias GUI

```text
evidencias/GUI.md
```

### Bitácora general

```text
docs/proceso.md
```

---

# 18. Estado de MIRIA

| Semana    | Tema                                     | Estado     |
| --------- | ---------------------------------------- | ---------- |
| Semana 01 | Problema de datos y entorno reproducible | Completada |
| Semana 02 | Del dominio al modelo lógico             | Completada |
| Semana 03 | Administración y operación               | Completada |

Las actividades correspondientes a estas tres etapas se encuentran documentadas en sus respectivos archivos.

---

# 19. Próxima acción

La siguiente acción consiste en continuar con las actividades definidas por el proyecto y mantener actualizada la documentación.

Se debe continuar registrando:

* Nuevos cambios.
* Pruebas realizadas.
* Problemas encontrados.
* Soluciones aplicadas.
* Evidencias.
* Uso de IA.
* Verificación humana.
* Nuevos requisitos o actividades.

La bitácora debe mantenerse actualizada para que el estado del proyecto corresponda con el estado real del repositorio.

---

# 20. Cierre de la bitácora inicial

Con las tres primeras semanas documentadas se cuenta con una base organizada para continuar el proyecto EnlaceExpress.

La metodología MIRIA permitió relacionar el trabajo realizado con objetivos, requisitos, criterios de aceptación, evidencias, Issues y aprendizaje.

La documentación busca mostrar no solamente el resultado final, sino también el proceso seguido para llegar a él y las verificaciones realizadas durante el desarrollo.
