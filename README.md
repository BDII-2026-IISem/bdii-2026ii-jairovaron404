<!-- ==================== HEADER ==================== -->

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&height=220&section=header&text=EnlaceExpress&fontSize=55&fontColor=FFFFFF&fontAlignY=38&desc=Multimotor%20Database%20%7C%20Base%20de%20Datos%20II&descAlignY=60&theme=tokyonight" width="100%"/>

<br>

<img src="https://img.shields.io/badge/Proyecto-Académico-7C3AED?style=for-the-badge" alt="Proyecto académico"/>
<img src="https://img.shields.io/badge/Base%20de%20Datos-II-2563EB?style=for-the-badge" alt="Base de Datos II"/>
<img src="https://img.shields.io/badge/Estado-Completado-16A34A?style=for-the-badge" alt="Estado"/>

<br><br>

<strong>Sistema de gestión de envíos, seguimiento y facturación</strong>

<br>

<em>Un mismo modelo lógico implementado en cuatro motores de bases de datos.</em>

</div>

---

## Sobre el proyecto

**EnlaceExpress** es un proyecto académico desarrollado para la asignatura **Base de Datos II**.

El sistema representa una plataforma para empresas de mensajería y distribución, permitiendo administrar:

* Empresas y contactos.
* Direcciones.
* Envíos y paquetes.
* Rutas y mensajeros.
* Seguimiento de envíos.
* Pruebas de entrega.
* Tarifas y facturación.
* Usuarios, roles y permisos.
* Sesiones y autenticación.
* Auditoría.

El modelo fue implementado en:

<div align="center">

<img src="https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat-square&logo=mysql&logoColor=white"/>
<img src="https://img.shields.io/badge/PostgreSQL-17-4169E1?style=flat-square&logo=postgresql&logoColor=white"/>
<img src="https://img.shields.io/badge/SQL%20Server-2022-CC2927?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
<img src="https://img.shields.io/badge/Oracle-XE%2021c-F80000?style=flat-square&logo=oracle&logoColor=white"/>

</div>

---

## Características principales

<table align="center">
<tr>
<td align="center" width="25%">

### **Envíos**

Registro y gestión de envíos, paquetes y estados.

</td>

<td align="center" width="25%">

### **Tracking**

Seguimiento mediante eventos, ubicación y estados.

</td>

<td align="center" width="25%">

### **Facturación**

Tarifas, facturas y estados de facturación.

</td>

<td align="center" width="25%">

### **RBAC**

Usuarios, roles, recursos y permisos.

</td>
</tr>
</table>

---

## Arquitectura del proyecto

```text
                         ┌───────────────────────┐
                         │     ENLACEEXPRESS      │
                         │   Sistema de envíos   │
                         └───────────┬───────────┘
                                     │
                  ┌──────────────────┼─────────────────┐
                  │                  │                 │
                  ▼                  ▼                 ▼
              OPERACIÓN          SEGURIDAD        FACTURACIÓN
                  │                  │                 │
        ┌─────────┼─────────┐        │         ┌───────┴───────┐
        │         │         │        │         │               │
      Envíos   Paquetes  Tracking   RBAC     Tarifas       Facturas
        │         │         │        │
        └─────────┼─────────┘        │
                  │                  │
                  ▼                  ▼
             PostgreSQL           Usuarios
             MySQL                Roles
             SQL Server           Recursos
             Oracle               Sesiones
```

---

## Cuatro motores, un mismo modelo

<div align="center">

|     | Motor          | Versión | Esquema          |
| :-: | -------------- | :-----: | ---------------- |
|  🐬 | **MySQL**      |   8.0   | `enlace_express` |
|  🐘 | **PostgreSQL** |    17   | `enlace_express` |
|  🪟 | **SQL Server** |   2022  | `dbo`            |
|  🔴 | **Oracle**     |  XE 21c | `ENLACE_EXPRESS` |

</div>

### Adaptación por motor

```text
                    MODELO LÓGICO
                          │
            ┌─────────────┼─────────────┐
            │             │             │
            ▼             ▼             ▼
         MySQL       PostgreSQL    SQL Server
            │             │             │
            │             └──────┬──────┘
            │                    │
            └────────────┬───────┘
                         ▼
                       Oracle

       Misma lógica + adaptación del dialecto SQL
```

---

## Modelo de datos

El sistema está compuesto por **18 tablas**.

<div align="center">

<img src="https://img.shields.io/badge/18-Tablas-6366F1?style=for-the-badge"/>
<img src="https://img.shields.io/badge/4-Motores-0891B2?style=for-the-badge"/>
<img src="https://img.shields.io/badge/6-Roles-F59E0B?style=for-the-badge"/>
<img src="https://img.shields.io/badge/16-Casos%20de%20uso-10B981?style=for-the-badge"/>

</div>

```text
auditoria
contactos
direcciones
empresas
envios
eventos_tracking
facturas
mensajeros
paquetes
pruebas_entrega
refresh_tokens
resource_roles
resources
role_users
roles
rutas
tarifas
users
```

### Relaciones principales

```text
EMPRESAS
 ├── CONTACTOS
 ├── DIRECCIONES
 ├── ENVIOS
 └── FACTURAS

ENVIOS
 ├── PAQUETES
 ├── EVENTOS_TRACKING
 ├── PRUEBAS_ENTREGA
 ├── RUTAS
 ├── MENSAJEROS
 └── TARIFAS

USERS
 ├── ROLE_USERS ─── ROLES
 │                    │
 │                    └── RESOURCE_ROLES ─── RESOURCES
 │
 └── REFRESH_TOKENS

AUDITORIA
```

**Modelo completo:** [`docs/DOMINIO.md`](docs/DOMINIO.md)

**Diagramas ER:** `evidencias/13-diagramas/`

> Los diagramas se mantienen como evidencia independiente para cada motor y no se cargan directamente en este README.

---

## Control de acceso RBAC

EnlaceExpress utiliza un modelo de **Role-Based Access Control**.

<div align="center">

<img src="https://img.shields.io/badge/ADMIN-7C3AED?style=for-the-badge"/>
<img src="https://img.shields.io/badge/CLIENTE_EMPRESA-2563EB?style=for-the-badge"/>
<img src="https://img.shields.io/badge/DESPACHO-0891B2?style=for-the-badge"/>
<img src="https://img.shields.io/badge/MENSAJERO-059669?style=for-the-badge"/>
<img src="https://img.shields.io/badge/FACTURACION-D97706?style=for-the-badge"/>
<img src="https://img.shields.io/badge/OPERADOR-DC2626?style=for-the-badge"/>

</div>

```text
                    ┌──────────────┐
                    │    USERS     │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │  ROLE_USERS   │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │    ROLES     │
                    └──────┬───────┘
                           │
                           ▼
                 ┌───────────────────┐
                 │  RESOURCE_ROLES   │
                 └─────────┬─────────┘
                           │
                           ▼
                    ┌──────────────┐
                    │   RESOURCES  │
                    └──────────────┘
```

---

## Flujo principal del sistema

```text
┌───────────────┐
│    EMPRESA    │
└───────┬───────┘
        │
        │ Solicita envío
        ▼
┌───────────────┐
│     ENVÍO     │
└───────┬───────┘
        │
        ▼
┌───────────────┐
│   ASIGNACIÓN  │
│    DE RUTA    │
└───────┬───────┘
        │
        ▼
┌───────────────┐
│   MENSAJERO   │
└───────┬───────┘
        │
        ▼
┌───────────────┐
│   TRACKING    │
└───────┬───────┘
        │
        ▼
┌───────────────┐
│    PAQUETE    │
└───────┬───────┘
        │
        ▼
┌───────────────┐
│    ENTREGA    │
└───────┬───────┘
        │
        ▼
┌───────────────┐
│    FACTURA    │
└───────────────┘
```

---

## Estados del sistema

### Envíos

<div align="center">

`CREADO` → `ASIGNADO` → `EN_RECOGIDA` → `EN_TRANSITO` → `EN_ENTREGA` → `ENTREGADO`

</div>

Estados adicionales:

`CANCELADO` · `CON_NOVEDAD`

### Paquetes

`REGISTRADO` · `EN_TRANSITO` · `ENTREGADO` · `DEVUELTO` · `CON_NOVEDAD`

### Facturas

`PENDIENTE` · `EMITIDA` · `PAGADA` · `ANULADA` · `VENCIDA`

### Prioridades

<div align="center">

<img src="https://img.shields.io/badge/BAJA-94A3B8?style=flat-square"/>
<img src="https://img.shields.io/badge/NORMAL-3B82F6?style=flat-square"/>
<img src="https://img.shields.io/badge/ALTA-F59E0B?style=flat-square"/>
<img src="https://img.shields.io/badge/URGENTE-EF4444?style=flat-square"/>

</div>

---

## Tecnologías y herramientas

### Bases de datos

<div align="center">

<img src="https://skillicons.dev/icons?i=mysql,postgres,oracle" height="55"/>

</div>

<div align="center">

<img src="https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white"/>
<img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white"/>
<img src="https://img.shields.io/badge/DBeaver-382923?style=for-the-badge&logo=dbeaver&logoColor=white"/>
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white"/>

</div>

### Herramientas gráficas

```text
DBeaver
├── MySQL
├── PostgreSQL
├── SQL Server
└── Oracle

Herramientas nativas
├── MySQL Workbench
├── pgAdmin 4
├── SQL Server Management Studio
└── Oracle SQL Developer
```

---

## Infraestructura Docker

Los motores están separados en servicios independientes:

```text
services/
└── motores-bd/
    ├── mysql/
    │   └── docker-compose.yml
    │
    ├── postgres/
    │   └── docker-compose.yml
    │
    ├── mssql/
    │   └── docker-compose.yml
    │
    ├── oracle/
    │   └── docker-compose.yml
    │
    ├── start-all.sh
    └── stop-all.sh
```

### Flujo de infraestructura

```text
               Docker
                 │
      ┌──────────┼──────────┐
      │          │          │
      ▼          ▼          ▼
    MySQL    PostgreSQL   SQL Server
      │          │          │
      └──────────┼──────────┘
                 │
                 ▼
               Oracle
```

---

## Consultas avanzadas

Se implementaron consultas para comprobar el funcionamiento del modelo en los cuatro motores.

<div align="center">

<img src="https://img.shields.io/badge/38-Consultas-7C3AED?style=for-the-badge"/>
<img src="https://img.shields.io/badge/4-Motores-0891B2?style=for-the-badge"/>
<img src="https://img.shields.io/badge/SQL-Avanzado-059669?style=for-the-badge"/>

</div>

Incluyen:

```text
SELECT / WHERE / IN / BETWEEN / LIKE
ORDER BY
COUNT / SUM / AVG
GROUP BY / HAVING
JOIN
Subconsultas
EXISTS
CASE
COALESCE
CTE
RANK
ROW_NUMBER
RBAC
UNION
```

**Documento:** [`docs/CONSULTAS-AVANZADAS.md`](docs/CONSULTAS-AVANZADAS.md)

**Evidencias:** `evidencias/11-consultas-avanzadas/`

---

## Casos de uso

El proyecto cuenta con **16 casos de uso**.

```text
Usuarios y roles
├── Gestionar usuarios
├── Gestionar roles
└── Gestionar recursos

Envíos
├── Registrar envío
├── Consultar envío
├── Asignar mensajero
└── Gestionar rutas

Seguimiento
├── Registrar evento de tracking
└── Consultar seguimiento

Entregas
├── Gestionar paquetes
└── Registrar prueba de entrega

Facturación
├── Gestionar tarifas
├── Generar factura
└── Consultar factura

Administración
├── Consultar auditoría
└── Gestionar sesión y autenticación
```

**Documento:** [`docs/CASOS-DE-USO.md`](docs/CASOS-DE-USO.md)

**Evidencias:** `evidencias/14-casos-de-uso/`

---

## Estructura del repositorio

```text
EnlaceExpress/
│
├── 📁 database/
│   ├── mysql/
│   ├── postgresql/
│   ├── sql-server/
│   └── oracle/
│
├── 📁 services/
│   └── motores-bd/
│
├── 📁 docs/
│   ├── 📄 DOMINIO.md
│   ├── 📄 CASOS-DE-USO.md
│   ├── 📄 CONSULTAS-AVANZADAS.md
│   ├── 📄 REPOSITORIOS.md
│   ├── 📄 GUI.md
│   ├── 📄 PROCESO.md
│   ├── 📁 contexto/
│   ├── 📁 informes/
│   └── 📁 semanas/
│
├── 📁 evidencias/
│   ├── 01-proyecto/
│   ├── 02-mysql/
│   ├── 03-postgresql/
│   ├── 04-sql-server/
│   ├── 05-oracle/
│   ├── 06-entorno-general/
│   ├── 07-dbeaver/
│   ├── 08-persistencia/
│   ├── 09-backups/
│   ├── 10-verificacion-final/
│   ├── 11-consultas-avanzadas/
│   ├── 12-GUI/
│   ├── 13-diagramas/
│   ├── 14-casos-de-uso/
│   └── 15-repositorios/
│
├── 📄 .gitignore
└── 📄 README.md
```

---

## Documentación

<div align="center">

|                       Documento                       | Contenido                   |
| :---------------------------------------------------: | --------------------------- |
|                [Dominio](docs/DOMINIO.md)             | Modelo y reglas del sistema |
|           [Casos de uso](docs/CASOS-DE-USO.md)        | Funcionalidades principales |
|    [Consultas avanzadas](docs/CONSULTAS-AVANZADAS.md) | Consultas SQL               |
|           [Repositorios](docs/REPOSITORIOS.md)        | Organización del proyecto   |
|                     [GUI](docs/GUI.md)                | Herramientas gráficas       |
|                [Proceso](docs/PROCESO.md)             | Bitácora del proyecto       |
|                [Informes](docs/informes/)             | Informes académicos         |
|                 [Semanas](docs/semanas/)              | Trabajo por semanas         |

</div>

---

## Evidencias

Toda la evidencia se encuentra organizada dentro de:

```text
evidencias/
```

### Principales grupos

```text
01 → Proyecto
02 → MySQL
03 → PostgreSQL
04 → SQL Server
05 → Oracle
06 → Entorno general
07 → DBeaver
08 → Persistencia
09 → Backups
10 → Verificación final
11 → Consultas avanzadas
12 → Herramientas GUI
13 → Diagramas
14 → Casos de uso
15 → Repositorios
```

**Diagramas ER:** `evidencias/13-diagramas/`

**Evidencias GUI:** `evidencias/12-GUI/`

**Consultas:** `evidencias/11-consultas-avanzadas/`

---

## Estado del proyecto

<div align="center">

| Componente          | Estado |
| :------------------ | :----: |
| Modelo lógico       |    ✅   |
| MySQL               |    ✅   |
| PostgreSQL          |    ✅   |
| SQL Server          |    ✅   |
| Oracle              |    ✅   |
| Datos de prueba     |    ✅   |
| Consultas avanzadas |    ✅   |
| RBAC                |    ✅   |
| Diagramas ER        |    ✅   |
| Casos de uso        |    ✅   |
| Evidencias          |    ✅   |
| Documentación       |    ✅   |
| Docker              |    ✅   |

</div>

---

## Metodología

El desarrollo utiliza **MIRIA — Integración Responsable de IA para el Aprendizaje** como apoyo para organizar y documentar el proceso.

La documentación registra:

```text
Objetivos
   ↓
Requisitos
   ↓
Implementación
   ↓
Pruebas
   ↓
Evidencias
   ↓
Verificación humana
   ↓
Documentación
```

📄 [`docs/PROCESO.md`](docs/PROCESO.md)

---

## Resumen del proyecto

<div align="center">

<img src="https://img.shields.io/badge/18-Tablas-6366F1?style=for-the-badge"/>
<img src="https://img.shields.io/badge/4-Motores-0891B2?style=for-the-badge"/>
<img src="https://img.shields.io/badge/38-Consultas-7C3AED?style=for-the-badge"/>
<img src="https://img.shields.io/badge/16-Casos%20de%20uso-10B981?style=for-the-badge"/>
<img src="https://img.shields.io/badge/6-Roles-F59E0B?style=for-the-badge"/>
<img src="https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white"/>

</div>

```text
                ENLACEEXPRESS
                     │
        ┌────────────┼────────────┐
        │            │            │
        ▼            ▼            ▼
     MODELO        DATOS       EVIDENCIAS
        │            │            │
        └────────────┼────────────┘
                     │
                     ▼
             4 MOTORES SQL
                     │
        ┌────────────┼────────────┐
        ▼            ▼            ▼
      MySQL     PostgreSQL    SQL Server
                     │
                     ▼
                   Oracle
```

---

## Autor

<div align="center">

### Jairo Varón

**Ingeniería de Sistemas**
Universidad de La Guajira

Base de Datos II

</div>

<!-- ==================== FOOTER ==================== -->

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&height=120&section=footer&theme=tokyonight" width="100%"/>

</div>
