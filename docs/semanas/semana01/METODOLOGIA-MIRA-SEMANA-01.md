# MIRIA – Semana 01

## Problema de datos y entorno reproducible

**Proyecto:** EnlaceExpress
**Semana:** 01
**Metodología:** MIRIA – Integración Responsable de IA para el Aprendizaje

---

## 1. Información de la semana

### Objetivo

Aplicar el concepto de problema de datos y entorno reproducible sobre el proyecto EnlaceExpress, identificando actores, procesos, reglas, entidades, atributos y relaciones, además de establecer el entorno de trabajo y el control de cambios.

---

# 2. Antes de clase

## Tema central

Problema de datos y entorno reproducible.

## Preparación

Se revisó el contexto del proyecto EnlaceExpress y se identificaron los principales elementos relacionados con la gestión de envíos corporativos.

Entre los elementos identificados se encuentran:

* Empresas.
* Contactos.
* Direcciones.
* Mensajeros.
* Rutas.
* Tarifas.
* Envíos.
* Paquetes.
* Eventos de seguimiento.
* Pruebas de entrega.
* Facturas.
* Usuarios.
* Roles.

También se estableció la necesidad de trabajar con un entorno reproducible para los motores de bases de datos.

---

# 3. Durante la clase

## 3.1 Actores, procesos y reglas

Se identificaron los principales actores relacionados con EnlaceExpress:

* Administrador.
* Empresa cliente.
* Personal de despacho.
* Mensajero.
* Operador.
* Personal de facturación.

Entre los procesos principales se identificaron:

* Registro de empresas.
* Gestión de contactos.
* Gestión de direcciones.
* Creación de envíos.
* Asignación de mensajeros.
* Gestión de rutas.
* Seguimiento de envíos.
* Confirmación de entrega.
* Facturación.

## 3.2 Entidades, atributos y relaciones

Se identificaron las entidades necesarias para representar el funcionamiento del sistema.

Las principales entidades del dominio incluyen:

* empresas
* contactos
* direcciones
* mensajeros
* rutas
* tarifas
* envios
* paquetes
* eventos_tracking
* pruebas_entrega
* facturas

También se identificaron entidades relacionadas con autenticación y control de acceso:

* users
* roles
* role_users
* resources
* resource_roles
* refresh_tokens
* auditoria

## 3.3 Arquitectura del sistema gestor

Se estableció un entorno de trabajo basado en:

* Windows.
* WSL.
* Ubuntu.
* Docker.
* Docker Compose.
* DBeaver.
* Git.
* GitHub.

Se definió el uso de cuatro motores:

* MySQL.
* PostgreSQL.
* SQL Server.
* Oracle.

## 3.4 Entorno y control de cambios

El proyecto fue organizado mediante Git y GitHub para mantener el historial de cambios y facilitar el seguimiento del desarrollo.

Las configuraciones de los motores se organizaron dentro de `services/motores-bd/`.

---

# 4. Después de clase

Se consolidaron los elementos relacionados con el problema de datos y el entorno reproducible.

Se organizaron:

* Documentación del contexto.
* Diagramas entidad-relación.
* Configuración de los motores.
* Servicios Docker.
* Evidencias del entorno.
* Control de cambios mediante Git.

## Resultado

Se estableció una base organizada para continuar con el diseño lógico y la implementación de las bases de datos de EnlaceExpress.

---

# 5. Requisitos y criterios de aceptación

| Requisito  | Criterio de aceptación                                |
| ---------- | ----------------------------------------------------- |
| REQ-S01-01 | Evidencia de actores, procesos y reglas               |
| REQ-S01-02 | Evidencia de entidades, atributos y relaciones        |
| REQ-S01-03 | Evidencia de arquitectura del sistema gestor          |
| REQ-S01-04 | Evidencia del entorno, control de cambios y evidencia |

---

# 6. Trazabilidad

| OBJ     | REQ        | AC        | EVI        |
| ------- | ---------- | --------- | ---------- |
| OBJ-S01 | REQ-S01-01 | AC-S01-01 | EVI-S01-01 |
| OBJ-S01 | REQ-S01-02 | AC-S01-02 | EVI-S01-02 |
| OBJ-S01 | REQ-S01-03 | AC-S01-03 | EVI-S01-03 |
| OBJ-S01 | REQ-S01-04 | AC-S01-04 | EVI-S01-04 |

---

# 7. Evidencias

## EVI-S01-01 – Actores, procesos y reglas

Evidencia principal:

`docs/contexto/CONTEXTO_DEL_PROYECTO_ENLEEXPRESS.md`

## EVI-S01-02 – Entidades, atributos y relaciones

Evidencias:

`docs/diagramas/`

## EVI-S01-03 – Arquitectura del sistema gestor

Evidencias:

`services/motores-bd/`

## EVI-S01-04 – Entorno, control de cambios y evidencia

Evidencias:

`evidencias/01-proyecto/`

`evidencias/06-entorno-general/`

---

# 8. Issues

| Issue      | Descripción                                      | Requisito  |
| ---------- | ------------------------------------------------ | ---------- |
| ISS-S01-01 | Trabajar actores, procesos y reglas              | REQ-S01-01 |
| ISS-S01-02 | Trabajar entidades, atributos y relaciones       | REQ-S01-02 |
| ISS-S01-03 | Trabajar arquitectura del sistema gestor         | REQ-S01-03 |
| ISS-S01-04 | Trabajar entorno, control de cambios y evidencia | REQ-S01-04 |
| ISS-S01-05 | Consolidar evidencia y trazabilidad              | REQ-S01-05 |
| ISS-S01-06 | Actualizar bitácora y registro IA                | REQ-S01-06 |

---

# 9. Gate semanal – GATE-S01

| Criterio                         | Estado |
| -------------------------------- | ------ |
| AC-S01-01 cumplido con evidencia | Sí     |
| AC-S01-02 cumplido con evidencia | Sí     |
| AC-S01-03 cumplido con evidencia | Sí     |
| AC-S01-04 cumplido con evidencia | Sí     |
| Issues y evidencias documentados | Sí     |
| Bitácora y registro de IA        | Sí     |

---

# 10. Gate Learning

## ¿Qué aprendí?

Aprendí a separar el problema del proyecto en actores, procesos, reglas y entidades para poder llevarlo posteriormente a una estructura de base de datos.

## ¿Qué error cometí?

Uno de los principales aspectos a mejorar fue no organizar desde el inicio toda la documentación y evidencia siguiendo una estructura semanal.

## ¿Qué cambiaría?

Mantendría desde el comienzo una bitácora y una estructura de evidencias asociada a cada semana.

---

# 11. Retrospectiva

## ¿Qué fue lo más difícil?

Lo más difícil fue pasar de una idea general del sistema EnlaceExpress a elementos concretos que pudieran ser representados en una base de datos.

## ¿Qué decisiones tuvieron apoyo de IA?

La IA se utilizó como apoyo para organizar ideas, revisar conceptos y resolver dudas técnicas.

Las propuestas fueron revisadas antes de incorporarlas al proyecto.

## ¿Qué ajustaré?

Registrar las decisiones y evidencias de manera continua durante cada semana.

---

# 12. Uso de IA – MIRIA

La IA fue utilizada como herramienta de apoyo al aprendizaje y al desarrollo.

Se utilizó principalmente para:

* Comprender conceptos de bases de datos.
* Organizar el dominio del proyecto.
* Revisar estructuras.
* Resolver dudas técnicas.
* Organizar documentación.

La información proporcionada por IA fue revisada y verificada mediante la documentación del proyecto y las pruebas realizadas.

---

# 13. Estado final

La Semana 01 queda consolidada mediante la documentación del problema de datos, el contexto del proyecto, los diagramas y la organización del entorno reproducible.

**Estado:** Consolidado.
