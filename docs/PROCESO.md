# Bitácora general del proyecto – EnlaceExpress

## 1. Información general

**Proyecto:** EnlaceExpress

**Curso:** Base de Datos II

**Metodología:** MIRIA – Integración Responsable de IA para el Aprendizaje

Este documento registra el proceso general de desarrollo del proyecto EnlaceExpress. Se documentan las decisiones tomadas, cambios realizados, configuraciones, pruebas, problemas encontrados, soluciones aplicadas, inserción y consulta de datos, uso de inteligencia artificial, verificación humana y estado actual del proyecto.

La bitácora funciona como registro general del proyecto y complementa los documentos correspondientes a cada semana.

```text
docs/semanas/

├── semana01/
├── semana02/
└── semana03/
```

---

# 2. Propósito

El propósito de esta bitácora es mantener un registro del proceso seguido durante el desarrollo del proyecto.

Se busca dejar evidencia de:

* Las decisiones tomadas.
* Los cambios realizados.
* Las configuraciones realizadas.
* Las pruebas ejecutadas.
* La implementación de las bases de datos.
* La inserción de datos.
* Las consultas realizadas.
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

La documentación, scripts y evidencias del proyecto se organizaron de manera independiente.

```text
database/

├── mysql/
├── postgresql/
├── sql-server/
└── oracle/
```

La documentación se encuentra en:

```text
docs/

├── contexto/
├── diagramas/
├── informes/
├── semanas/
├── CONSULTAS-AVANZADAS.md
└── PROCESO.md
```

Las evidencias generales se organizan por actividad:

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
├── 10-verificacion-final/
└── 11-consultas-avanzadas/
```

Las evidencias de consultas avanzadas se organizan por motor:

```text
evidencias/11-consultas-avanzadas/

├── 01-mysql/
├── 02-postgresql/
├── 03-sql-server/
└── 04-oracle/
```

---

# 5. Semana 01 – Problema de datos y entorno reproducible

## Propósito

La primera etapa permitió establecer el contexto del problema y organizar la base inicial del proyecto.

Se identificaron los actores, procesos, reglas, entidades, atributos y relaciones principales de EnlaceExpress.

También se definió la necesidad de trabajar con cuatro motores de bases de datos y mantener evidencias del proceso.

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

# 8. Inserción y carga de datos

Después de completar la implementación de las estructuras, se realizó una etapa de **inserción de datos en los cuatro motores**.

El objetivo fue disponer de información suficiente para comprobar que las tablas no solamente estuvieran creadas, sino que también permitieran almacenar y consultar información relacionada con el dominio de EnlaceExpress.

## Motores utilizados

La carga de datos se realizó en:

* MySQL.
* PostgreSQL.
* SQL Server.
* Oracle XE.

## Datos utilizados

Los datos insertados corresponden a las diferentes entidades del modelo, incluyendo información relacionada con:

* Empresas.
* Contactos.
* Direcciones.
* Usuarios.
* Roles.
* Mensajeros.
* Rutas.
* Tarifas.
* Envíos.
* Paquetes.
* Eventos de seguimiento.
* Pruebas de entrega.
* Facturas.
* Recursos.
* Relaciones entre usuarios y roles.
* Relaciones entre roles y recursos.

## Verificación

Después de realizar las inserciones se ejecutaron consultas básicas para comprobar:

* Existencia de registros.
* Cantidad de registros.
* Relaciones entre tablas.
* Integridad de las claves.
* Asociación entre entidades.
* Disponibilidad de información para las consultas posteriores.

Esta etapa permitió pasar de una base de datos únicamente estructural a una base de datos con información para realizar pruebas y consultas.

## Resultado

Los cuatro motores cuentan con datos cargados sobre el modelo de EnlaceExpress, permitiendo realizar consultas y pruebas sobre información real de la implementación académica.

---

# 9. Consultas SQL avanzadas

Después de implementar las estructuras y cargar los datos en los cuatro motores, se desarrolló una etapa específica de consultas SQL avanzadas.

Se definieron y ejecutaron **38 consultas en cada motor de base de datos**.

En total se trabajó con:

```text
38 consultas × 4 motores = 152 ejecuciones
```

Los motores utilizados fueron:

* MySQL.
* PostgreSQL.
* SQL Server.
* Oracle XE.

## Propósito

El objetivo fue comprobar el funcionamiento del modelo utilizando diferentes características de SQL y verificar las adaptaciones necesarias para cada motor.

## Tipos de consultas realizadas

Entre las operaciones utilizadas se encuentran:

* `SELECT`
* `WHERE`
* `AND`
* `IN`
* `BETWEEN`
* `LIKE`
* `ORDER BY`
* `COUNT`
* `SUM`
* `AVG`
* `MIN`
* `MAX`
* `GROUP BY`
* `HAVING`
* `INNER JOIN`
* `LEFT JOIN`
* Subconsultas.
* `EXISTS`
* `CASE`
* `COALESCE`
* CTE.
* Funciones de ventana.
* `RANK`
* `ROW_NUMBER`
* `UNION`
* Consultas relacionadas con usuarios y roles.
* Consultas de seguimiento.
* Consultas de facturación.
* Consultas de resumen y análisis.

## Adaptaciones por motor

Aunque las consultas mantienen el mismo objetivo, fue necesario realizar algunas adaptaciones según el motor.

Entre las diferencias encontradas se trabajó con elementos como:

* Tipos de datos.
* Funciones de fecha.
* Conversión de tipos.
* Funciones específicas.
* Sintaxis para limitar resultados.
* Manejo de valores nulos.
* Sintaxis de CTE y funciones de ventana.
* Diferencias en funciones de agregación.

Por esta razón, las consultas fueron verificadas de manera independiente en cada motor.

## Documentación

Las 38 consultas se documentaron en:

```text
docs/CONSULTAS-AVANZADAS.md
```

El documento contiene:

* Número de consulta.
* Código SQL.
* Explicación.
* Evidencia correspondiente.

## Evidencias

Las evidencias se organizaron por motor:

```text
evidencias/11-consultas-avanzadas/

├── 01-mysql/
├── 02-postgresql/
├── 03-sql-server/
└── 04-oracle/
```

Cada directorio contiene las capturas correspondientes a las consultas ejecutadas.

## Resultado

Se completó la ejecución y documentación de las 38 consultas para los cuatro motores, obteniendo evidencias de los resultados.

Esta etapa permitió comprobar el comportamiento de los datos y aplicar diferentes operaciones de SQL sobre el modelo implementado.

---

# 10. Decisiones técnicas generales

## 10.1 Uso de Docker

Se utilizó Docker para mantener los motores separados y facilitar su administración.

Cada motor tiene su propia configuración y servicio.

La estructura permite iniciar o detener los motores de manera independiente o mediante los scripts generales del proyecto.

---

## 10.2 Uso de DBeaver

DBeaver se utilizó como herramienta común para trabajar con los cuatro motores.

Esto permitió realizar tareas como:

* Conectar a las bases de datos.
* Ejecutar SQL.
* Revisar tablas.
* Revisar relaciones.
* Consultar datos.
* Generar DDL.
* Verificar estructuras.
* Ejecutar las consultas avanzadas.

---

## 10.3 Uso de herramientas nativas

Además de DBeaver se utilizaron herramientas específicas:

| Motor         | Herramienta                  |
| ------------- | ---------------------------- |
| MySQL         | MySQL Workbench              |
| PostgreSQL    | pgAdmin 4                    |
| MS SQL Server | SQL Server Management Studio |
| Oracle        | Oracle SQL Developer         |

El objetivo fue realizar una segunda comprobación de las bases de datos y sus estructuras.

---

## 10.4 DDL independiente

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

Por esta razón no se utilizó un único script SQL para los cuatro sistemas.

---

# 11. Cambios importantes durante el desarrollo

Durante la implementación fue necesario adaptar diferentes partes del proyecto según el motor utilizado.

Uno de los principales aprendizajes fue que una estructura o consulta que funciona directamente en un motor no necesariamente puede copiarse sin cambios a otro.

Por esta razón se realizaron verificaciones independientes después de implementar cada estructura y cada grupo de consultas.

También se organizaron los scripts DDL y las consultas SQL adaptadas a cada motor.

La incorporación de datos permitió realizar pruebas sobre información relacionada entre las diferentes tablas y detectar diferencias que no podían observarse trabajando únicamente con las estructuras vacías.

---

# 12. Pruebas y verificación

La verificación del proyecto se realizó en diferentes niveles.

## 12.1 Verificación de servicios

Se comprobaron los contenedores y servicios mediante Docker.

Se revisaron:

* Estado de los contenedores.
* Puertos.
* Redes.
* Persistencia.

---

## 12.2 Verificación de conexiones

Se comprobaron las conexiones de los cuatro motores desde DBeaver.

Se verificó que cada conexión permitiera acceder a su respectiva base de datos.

---

## 12.3 Verificación de estructuras

Se revisaron las tablas y relaciones utilizando DBeaver y las herramientas nativas.

---

## 12.4 Verificación de datos

Después de la creación de las estructuras se realizaron inserciones de datos en los cuatro motores.

Posteriormente se ejecutaron consultas para comprobar:

* Existencia de registros.
* Relaciones.
* Cantidad de datos.
* Asociación entre entidades.
* Resultados de consultas.
* Funcionamiento de filtros.
* Agrupaciones.
* Operaciones de agregación.

---

## 12.5 Verificación de consultas avanzadas

Se ejecutaron 38 consultas en cada motor.

La verificación incluyó:

* Resultado de las consultas.
* Sintaxis específica de cada motor.
* Relaciones entre tablas.
* Funciones de agregación.
* Subconsultas.
* CTE.
* Funciones de ventana.
* Consultas de usuarios y roles.
* Consultas de seguimiento.
* Consultas de facturación.

Cada consulta cuenta con su respectiva evidencia.

---

## 12.6 Verificación de persistencia

Se comprobó que los datos permanecieran disponibles después de reiniciar los servicios correspondientes.

Las evidencias se encuentran en:

```text
evidencias/08-persistencia/
```

---

## 12.7 Verificación de respaldos

Se realizaron procesos de respaldo para comprobar la capacidad de conservar la información.

Las evidencias se encuentran en:

```text
evidencias/09-backups/
```

También existen evidencias específicas de respaldo para algunos motores.

---

# 13. Evidencias

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

## Consultas SQL avanzadas

```text
evidencias/11-consultas-avanzadas/
```

Esta carpeta contiene las evidencias de las 38 consultas realizadas en cada motor.

---

# 14. Uso de inteligencia artificial

La inteligencia artificial se utilizó como herramienta de apoyo durante diferentes etapas del proyecto.

Su utilización estuvo orientada principalmente a:

* Resolver dudas técnicas.
* Revisar comandos SQL.
* Analizar estructuras de bases de datos.
* Ayudar con la sintaxis de los diferentes motores.
* Revisar relaciones entre tablas.
* Identificar posibles errores.
* Orientar configuraciones de Docker.
* Ayudar a adaptar consultas entre motores.
* Ayudar a organizar la documentación.
* Revisar problemas encontrados durante la implementación.

La IA fue utilizada como apoyo y las respuestas obtenidas no se consideraron automáticamente correctas.

---

# 15. Verificación humana del uso de IA

Las propuestas obtenidas mediante IA fueron revisadas antes de incorporarlas al proyecto.

La verificación se realizó mediante:

* Ejecución de comandos.
* Ejecución de scripts SQL.
* Inserción de datos.
* Ejecución de consultas.
* Pruebas de conexión.
* Revisión de tablas.
* Revisión de relaciones.
* Consultas de prueba.
* Comprobación de contenedores.
* Revisión mediante DBeaver.
* Revisión mediante herramientas nativas.

Cuando una propuesta no funcionaba directamente, se revisó el error y se realizaron los ajustes necesarios.

La implementación final fue ejecutada y comprobada dentro del entorno del proyecto.

---

# 16. Estado actual del proyecto

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
* Datos insertados en los cuatro motores.
* Evidencias de administración.
* Evidencias de DBeaver.
* Evidencias de herramientas nativas.
* Evidencias de respaldos.
* Evidencias de verificación.
* 38 consultas SQL por motor.
* 152 ejecuciones documentadas de consultas.
* Evidencias de las consultas.
* Documentación de las consultas avanzadas.
* Metodología MIRIA.
* Bitácora general.
* Control de versiones mediante Git.

---

# 17. Bloqueos y problemas encontrados

Durante el desarrollo se presentaron problemas relacionados principalmente con:

* Diferencias de sintaxis entre motores.
* Diferencias entre tipos de datos.
* Funciones específicas de cada sistema.
* Conversión de fechas y valores.
* Manejo de valores nulos.
* Adaptación de consultas.
* Configuración del entorno.
* Conexiones entre herramientas y servicios.

Los problemas fueron tratados mediante:

1. Revisión del error.
2. Identificación de la causa.
3. Consulta de documentación o apoyo mediante IA.
4. Modificación de la configuración o consulta.
5. Nueva ejecución.
6. Verificación del resultado.
7. Registro de la evidencia correspondiente.

Este proceso permitió mantener la lógica principal del proyecto mientras se realizaban las adaptaciones necesarias para cada motor.

---

# 18. Control de cambios

El proyecto utiliza Git para controlar los cambios realizados.

Los cambios se organizan mediante commits relacionados con actividades concretas.

Entre los cambios registrados se encuentran:

* Configuración de servicios.
* Actualización del README.
* Incorporación de scripts DDL.
* Documentación de los motores.
* Incorporación de datos.
* Incorporación de evidencias.
* Documentación de la metodología MIRIA.
* Desarrollo de consultas SQL avanzadas.
* Incorporación de evidencias de consultas.
* Actualización de la documentación general.

Los commits permiten mantener un historial del desarrollo y facilitar la revisión del proyecto.

---

# 19. Documentación relacionada

La documentación del proyecto se encuentra organizada en:

## Contexto

```text
docs/contexto/
```

## Diagramas

```text
docs/diagramas/
```

## Informes

```text
docs/informes/
```

## Semanas MIRIA

```text
docs/semanas/
```

## Consultas SQL avanzadas

```text
docs/CONSULTAS-AVANZADAS.md
```

## Evidencias GUI

```text
evidencias/GUI.md
```

## Evidencias de consultas

```text
evidencias/11-consultas-avanzadas/
```

## Bitácora general

```text
docs/PROCESO.md
```

---

# 20. Estado de MIRIA

| Semana    | Tema                                     | Estado     |
| --------- | ---------------------------------------- | ---------- |
| Semana 01 | Problema de datos y entorno reproducible | Completada |
| Semana 02 | Del dominio al modelo lógico             | Completada |
| Semana 03 | Administración y operación               | Completada |

Las actividades correspondientes a estas tres etapas se encuentran documentadas en sus respectivos archivos.

Las actividades posteriores se continúan registrando en la documentación general del proyecto y en las evidencias correspondientes.

---

# 21. Avance técnico actual

El proyecto ha avanzado desde la creación de las estructuras hasta la ejecución de operaciones sobre datos reales de prueba.

El flujo de trabajo realizado hasta el momento puede resumirse de la siguiente manera:

```text
Definición del dominio
        ↓
Modelo lógico
        ↓
Scripts DDL
        ↓
Implementación en cuatro motores
        ↓
Configuración de Docker
        ↓
Conexión mediante DBeaver
        ↓
Verificación de estructuras
        ↓
Inserción de datos
        ↓
Verificación de datos
        ↓
Consultas SQL avanzadas
        ↓
Adaptación por motor
        ↓
Ejecución de 38 consultas
        ↓
Obtención de evidencias
        ↓
Documentación
```

Este proceso permitió comprobar el funcionamiento del modelo tanto a nivel estructural como a nivel de datos y consultas.

---

# 22. Próximas acciones

La siguiente etapa consiste en continuar con las actividades definidas por el proyecto y mantener actualizada la documentación.

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

Las nuevas actividades deberán continuar registrándose en:

* La bitácora.
* La documentación.
* Las evidencias.
* Los informes.
* El control de versiones.

---

# 23. Cierre de la bitácora actual

El proyecto EnlaceExpress cuenta actualmente con cuatro implementaciones funcionales de la base de datos: MySQL, PostgreSQL, SQL Server y Oracle XE.

Después de implementar las estructuras, se realizó la inserción de datos en los cuatro motores y posteriormente se desarrolló una etapa de consultas SQL avanzadas.

Se ejecutaron **38 consultas en cada motor**, para un total de **152 ejecuciones documentadas**, realizando las adaptaciones necesarias según las características de cada sistema.

Las consultas permitieron trabajar con filtros, agregaciones, relaciones entre tablas, subconsultas, CTE, funciones de ventana, consultas relacionadas con usuarios y roles, seguimiento, facturación y otras operaciones sobre los datos de EnlaceExpress.

Cada motor cuenta con sus respectivas evidencias y la documentación general de las consultas se encuentra en:

```text
docs/CONSULTAS-AVANZADAS.md
```

La bitácora continuará actualizándose a medida que el proyecto avance hacia la integración con el backend y las siguientes etapas definidas.
