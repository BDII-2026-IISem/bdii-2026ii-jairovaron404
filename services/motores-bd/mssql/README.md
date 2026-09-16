# Microsoft SQL Server 2022 - Motor de Base de Datos

> **Acceso remoto habilitado.**
> Puerto SQL Server expuesto en `0.0.0.0:1433`.
> Contenedor: `sqlserver-container`.
> Imagen: `mcr.microsoft.com/mssql/server:2022-latest`.

---

## Información del servicio

| Parámetro | Valor |
|---|---|
| Motor | Microsoft SQL Server |
| Versión | 2022 |
| Edición | Developer |
| Contenedor | `sqlserver-container` |
| Imagen | `mcr.microsoft.com/mssql/server:2022-latest` |
| Puerto interno | `1433` |
| Puerto publicado | `1433` |
| Base principal | `practica_db` |
| Usuario administrador | `sa` |
| Usuario remoto de pruebas | `estudiante` |
| Red Docker | `ia-lab-network` |
| Datos | `~/ia-lab/data/mssql` |
| Backups | `~/ia-lab/data/mssql` |

---

## Conectar desde WSL

Para conectarse como administrador `sa`:

```bash
sudo docker exec -it sqlserver-container \
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U SA \
-P 'TU_PASSWORD' \
-C
````

La contraseña corresponde a la variable:

```text
MSSQL_SA_PASSWORD
```

del archivo `.env`.

---

## Conectar como usuario estudiante

La cuenta utilizada para las pruebas de acceso remoto es:

```text
Usuario: estudiante
Base de datos: practica_db
```

Conexión desde WSL:

```bash
sudo docker exec -i sqlserver-container \
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U estudiante \
-P 'TU_PASSWORD' \
-d practica_db \
-C
```

---

## Crear una base de datos

Conectarse como `sa`:

```bash
sudo docker exec -it sqlserver-container \
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U SA \
-P 'TU_PASSWORD' \
-C
```

Luego:

```sql
CREATE DATABASE nombre_bd;
GO
```

---

## Crear un usuario propio con acceso remoto

Conectarse como `sa` y ejecutar:

```sql
CREATE LOGIN mi_usuario
WITH PASSWORD = 'MiNuevaPasswordFuerte123!';
GO

USE nombre_bd;
GO

CREATE USER mi_usuario
FOR LOGIN mi_usuario;
GO

ALTER ROLE db_owner
ADD MEMBER mi_usuario;
GO
```

El login se crea a nivel del servidor y el usuario se crea dentro de la base de datos correspondiente.

---

## Usuario utilizado en las pruebas

Durante la configuración del laboratorio se creó:

```text
Login: estudiante
Base de datos: practica_db
```

El usuario fue probado mediante conexión remota al puerto:

```text
1433
```

La conexión validada fue:

```text
Host: IP_DEL_SERVIDOR
Port: 1433
User: estudiante
Database: practica_db
```

---

## Prueba de conexión remota

Desde un equipo que tenga acceso a la IP del servidor:

```bash
sqlcmd \
-S IP_SERVIDOR,1433 \
-U estudiante \
-P 'TU_PASSWORD' \
-d practica_db \
-C \
-Q "SELECT
    SUSER_SNAME() AS LOGIN_ACTUAL,
    USER_NAME() AS USUARIO_ACTUAL,
    DB_NAME() AS BASE_DATOS,
    @@SERVERNAME AS SERVIDOR;"
```

La prueba debe devolver:

```text
LOGIN_ACTUAL    estudiante
USUARIO_ACTUAL  estudiante
BASE_DATOS      practica_db
```

---

## Prueba real de permisos

El usuario `estudiante` fue validado realizando operaciones reales:

```sql
CREATE TABLE prueba_remota (
    id INT PRIMARY KEY,
    mensaje VARCHAR(200)
);
GO

INSERT INTO prueba_remota
VALUES (1, 'SQL Server - prueba de acceso remoto');
GO

SELECT
    id,
    mensaje
FROM prueba_remota;
GO

DROP TABLE prueba_remota;
GO
```

Resultado esperado:

```text
1
SQL Server - prueba de acceso remoto
```

Esto confirma que el usuario puede crear, insertar, consultar y eliminar objetos dentro de `practica_db`.

---

## Bases de datos actuales

Actualmente el servidor contiene:

```text
master
model
msdb
practica_db
tempdb
```

La base utilizada para las pruebas de acceso remoto es:

```text
practica_db
```

---

## Verificar SQL Server

Consultar la versión:

```bash
sudo docker exec sqlserver-container \
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U SA \
-P 'TU_PASSWORD' \
-C \
-Q "SELECT @@VERSION;"
```

Consultar el servidor:

```bash
sudo docker exec sqlserver-container \
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U SA \
-P 'TU_PASSWORD' \
-C \
-Q "SELECT @@SERVERNAME AS SERVIDOR, GETDATE() AS FECHA;"
```

Consultar las bases de datos:

```bash
sudo docker exec sqlserver-container \
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U SA \
-P 'TU_PASSWORD' \
-C \
-Q "SELECT name FROM sys.databases ORDER BY name;"
```

---

## Healthcheck

El contenedor utiliza un `healthcheck` basado en `sqlcmd`:

```text
/opt/mssql-tools18/bin/sqlcmd
```

La comprobación ejecuta:

```sql
SELECT 1;
```

Configuración:

```text
Intervalo: 10 segundos
Timeout: 5 segundos
Reintentos: 10
Inicio: 40 segundos
```

Consultar el estado:

```bash
sudo docker inspect sqlserver-container \
--format='Status={{.State.Status}} | Health={{if .State.Health}}{{.State.Health.Status}}{{else}}NO_HEALTHCHECK{{end}}'
```

Estado esperado:

```text
Status=running | Health=healthy
```

---

## Comprobar contenedor

```bash
sudo docker ps --filter name=sqlserver-container
```

Debe aparecer:

```text
Up ...
```

También se pueden consultar los registros:

```bash
sudo docker logs sqlserver-container --tail 20
```

---

## Comprobar puerto

```bash
sudo ss -lntp | grep ':1433'
```

Debe aparecer:

```text
0.0.0.0:1433
```

También se puede comprobar la conectividad:

```bash
nc -zv IP_SERVIDOR 1433
```

Resultado esperado:

```text
Connection to IP_SERVIDOR 1433 port [tcp/ms-sql-s] succeeded!
```

---

## Conexión desde DBeaver

Configuración:

```text
Host: IP_SERVIDOR
Port: 1433
Database: practica_db
User: estudiante
Password: TU_PASSWORD
```

Para una conexión administrativa:

```text
Host: IP_SERVIDOR
Port: 1433
Database: master
User: sa
Password: TU_PASSWORD
```

---

## Backup

SQL Server almacena sus datos dentro de:

```text
/var/opt/mssql
```

El volumen persistente del laboratorio está montado en:

```text
~/ia-lab/data/mssql
```

Para realizar un backup mediante SQL Server:

```bash
sudo docker exec sqlserver-container \
/opt/mssql-tools18/bin/sqlcmd \
-S localhost \
-U SA \
-P 'TU_PASSWORD' \
-C \
-Q "BACKUP DATABASE practica_db TO DISK = '/var/opt/mssql/backup_practica_db.bak'"
```

El archivo se almacena dentro del volumen persistente:

```text
~/ia-lab/data/mssql/backup_practica_db.bak
```

---

## Variables clave del .env

| Variable            | Descripción                             |
| ------------------- | --------------------------------------- |
| `ACCEPT_EULA`       | Aceptación de la licencia de SQL Server |
| `MSSQL_SA_PASSWORD` | Contraseña del usuario `sa`             |
| `MSSQL_PID`         | Edición de SQL Server                   |

Valores actuales:

```text
ACCEPT_EULA=Y
MSSQL_PID=Developer
```

La contraseña se mantiene únicamente en `.env`.

---

## Configuración Docker Compose

Archivo:

```text
~/ia-lab/services/motores-bd/mssql/docker-compose.yml
```

El servicio utiliza:

```text
ia-lab-network
```

Puerto publicado:

```text
1433:1433
```

Volumen:

```text
~/ia-lab/data/mssql:/var/opt/mssql
```

---

## Validar Docker Compose

```bash
cd ~/ia-lab/services/motores-bd/mssql

sudo docker compose config
```

El comando debe finalizar sin errores.

Levantar el servicio:

```bash
sudo docker compose up -d
```

---

## Estado actual

* SQL Server 2022: **ACTIVO**
* SQL Server 2022 Developer: **VERIFICADO**
* Contenedor `sqlserver-container`: **RUNNING**
* Healthcheck: **HEALTHY**
* Puerto 1433: **ACTIVO**
* Base `practica_db`: **DISPONIBLE**
* Usuario `estudiante`: **DISPONIBLE**
* Acceso remoto: **VERIFICADO**
* Permisos de `estudiante`: **VERIFICADOS**
* Persistencia: **CONFIGURADA**
* Red Docker `ia-lab-network`: **CONFIGURADA**
* Docker Compose: **VALIDADO**

