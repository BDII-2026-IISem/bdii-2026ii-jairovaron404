# PostgreSQL 17 - Motor de Base de Datos

> **Acceso remoto habilitado y verificado.**
> Puerto PostgreSQL expuesto en `0.0.0.0:5432`.
> Contenedor: `postgres-server`.
> Red Docker: `ia-lab-network`.

---

## Información del servicio

| Parámetro | Valor |
|---|---|
| Motor | PostgreSQL |
| Versión | 17 |
| Contenedor | `postgres-server` |
| Imagen | `postgres:17` |
| Puerto interno | `5432` |
| Puerto publicado | `5432` |
| Base principal | `tecnogua` |
| Base de prácticas | `practica_db` |
| Usuario principal | `postgres` |
| Usuario remoto | `estudiante` |
| Red Docker | `ia-lab-network` |
| Datos | `~/ia-lab/data/postgres` |
| Backups | `/mnt/d/academia/bd` |

---

## Bases de datos actuales

El clúster contiene actualmente:

```text
ialab
postgres
practica_db
tecnogua
template0
template1
````

La base principal utilizada por el proyecto es:

```text
tecnogua
```

La base utilizada para las pruebas de acceso remoto es:

```text
practica_db
```

---

## Usuarios y roles

Los principales roles configurados son:

```text
ialab
postgres
estudiante
```

El usuario administrador principal es:

```text
postgres
```

El usuario para pruebas de acceso remoto es:

```text
estudiante
```

El usuario `estudiante` tiene:

```text
LOGIN:        habilitado
SUPERUSER:    no
```

Además, la base:

```text
practica_db
```

tiene como propietario al usuario:

```text
estudiante
```

---

## Conectar desde WSL

Para conectarse directamente al servidor PostgreSQL:

```bash
sudo docker exec -it postgres-server \
psql -U postgres -d tecnogua
```

También:

```bash
sudo docker exec -e PGPASSWORD='MiNiCo57**' postgres-server \
psql -h 127.0.0.1 \
-U postgres \
-d tecnogua
```

---

## Conectar remotamente

La conexión remota se realiza mediante:

```text
Host: IP_DEL_SERVIDOR
Port: 5432
Database: practica_db
Username: estudiante
Password: PasswordSegura2024!
```

La IP WSL utilizada durante las pruebas fue:

```text
172.20.138.10
```

Por lo tanto, una conexión de prueba puede utilizar:

```text
Host: 172.20.138.10
Port: 5432
Database: practica_db
Username: estudiante
Password: PasswordSegura2024!
```

PostgreSQL está configurado para aceptar conexiones remotas.

La autenticación remota utiliza:

```text
scram-sha-256
```

---

## Prueba de puerto remoto

Comprobar que el puerto está accesible:

```bash
nc -zv 172.20.138.10 5432
```

Resultado esperado:

```text
Connection to 172.20.138.10 5432 port [tcp/postgresql] succeeded!
```

---

## Prueba de conexión remota

Desde un cliente PostgreSQL:

```bash
PGPASSWORD='PasswordSegura2024!' \
psql \
-h 172.20.138.10 \
-p 5432 \
-U estudiante \
-d practica_db
```

También se puede ejecutar una consulta directamente:

```bash
PGPASSWORD='PasswordSegura2024!' \
psql \
-h 172.20.138.10 \
-p 5432 \
-U estudiante \
-d practica_db \
-c "SELECT current_user, current_database(), inet_server_addr(), inet_server_port();"
```

---

## Verificación de acceso remoto

La conexión remota fue probada correctamente con:

```text
Usuario: estudiante
Base: practica_db
Servidor: 172.18.0.3
Puerto: 5432
```

Resultado:

```text
usuario    | base_datos  | servidor   | puerto
-----------+-------------+------------+-------
estudiante | practica_db | 172.18.0.3 | 5432
```

---

## Prueba real de permisos

El usuario `estudiante` fue probado creando, insertando, consultando y eliminando una tabla.

Prueba utilizada:

```sql
CREATE TABLE prueba_remota (
    id INTEGER PRIMARY KEY,
    mensaje VARCHAR(200)
);

INSERT INTO prueba_remota
VALUES (1, 'PostgreSQL - prueba de acceso remoto');

SELECT
    id,
    mensaje
FROM prueba_remota;

DROP TABLE prueba_remota;
```

Resultado:

```text
CREATE TABLE
INSERT 0 1

id |               mensaje
---+--------------------------------------
1  | PostgreSQL - prueba de acceso remoto

DROP TABLE
```

Esto confirma que el usuario remoto puede conectarse y ejecutar operaciones sobre `practica_db`.

---

## Conectar desde DBeaver

Configuración para la base principal:

```text
Host: 127.0.0.1
Port: 5432
Database: tecnogua
Username: postgres
Password: MiNiCo57**
```

Para conexión remota:

```text
Host: 172.20.138.10
Port: 5432
Database: practica_db
Username: estudiante
Password: PasswordSegura2024!
```

---

## Crear una base de datos

Conectado como administrador:

```sql
CREATE DATABASE nombre_bd;
```

Ejemplo:

```sql
CREATE DATABASE bd_clase1;
```

---

## Listar bases de datos

Desde `psql`:

```sql
\l
```

También:

```sql
SELECT datname
FROM pg_database
ORDER BY datname;
```

---

## Conectarse a una base de datos

Desde `psql`:

```text
\c nombre_bd
```

Ejemplo:

```text
\c practica_db
```

---

## Listar tablas

```text
\dt
```

---

## Salir de PostgreSQL

```text
\q
```

---

## Backup completo

Para generar un backup completo del clúster:

```bash
sudo docker exec postgres-server \
pg_dumpall -U postgres \
| sudo tee /mnt/d/academia/bd/backup_postgres_$(date +%Y%m%d).sql > /dev/null
```

El backup se almacena en:

```text
/mnt/d/academia/bd/
```

Ejemplo:

```text
backup_postgres_20260823.sql
```

---

## Verificar backup

```bash
sudo ls -lh /mnt/d/academia/bd/backup_postgres_*.sql
```

Ver las primeras líneas:

```bash
sudo head -n 20 \
/mnt/d/academia/bd/backup_postgres_$(date +%Y%m%d).sql
```

---

## Restaurar un backup

Para restaurar un backup completo:

```bash
sudo docker exec -i postgres-server \
psql -U postgres -d postgres \
< /mnt/d/academia/bd/backup_postgres_FECHA.sql
```

Reemplazar `FECHA` por la fecha correspondiente.

---

## Comprobar estado del contenedor

```bash
sudo docker ps --filter name=postgres-server
```

Debe aparecer:

```text
Up ... (healthy)
```

---

## Comprobar PostgreSQL

```bash
sudo docker exec \
-e PGPASSWORD='MiNiCo57**' \
postgres-server \
psql \
-h 127.0.0.1 \
-U postgres \
-d tecnogua \
-c "SELECT version(), current_user, current_database();"
```

---

## Comprobar puerto

```bash
sudo ss -lntp | grep ':5432'
```

Debe aparecer:

```text
0.0.0.0:5432
```

---

## Docker Compose

El servicio utiliza la red externa:

```text
ia-lab-network
```

Archivo de configuración:

```text
~/ia-lab/services/motores-bd/postgres/docker-compose.yml
```

---

## Contenedor

Nombre:

```text
postgres-server
```

Imagen:

```text
postgres:17
```

Verificar:

```bash
sudo docker ps | grep postgres-server
```

Ver registros:

```bash
sudo docker logs postgres-server --tail 20
```

---

## Datos persistentes

Los datos de PostgreSQL se almacenan en:

```text
~/ia-lab/data/postgres
```

Los backups se almacenan en:

```text
/mnt/d/academia/bd
```

---

## Variables del `.env`

Archivo:

```text
~/ia-lab/services/motores-bd/postgres/.env
```

Variables configuradas:

```text
TZ=America/Bogota
POSTGRES_USER=postgres
POSTGRES_PASSWORD=MiNiCo57**
POSTGRES_DB=tecnogua
```

---

## Estado actual

* PostgreSQL 17: **ACTIVO**
* Contenedor `postgres-server`: **RUNNING**
* Healthcheck: **HEALTHY**
* Puerto `5432`: **ACTIVO**
* Base `tecnogua`: **DISPONIBLE**
* Base `practica_db`: **DISPONIBLE**
* Usuario `postgres`: **DISPONIBLE**
* Usuario remoto `estudiante`: **DISPONIBLE**
* Acceso remoto: **VERIFICADO**
* Creación de tabla remota: **VERIFICADA**
* Inserción de datos: **VERIFICADA**
* Consulta de datos: **VERIFICADA**
* Eliminación de tabla: **VERIFICADA**
* Red Docker `ia-lab-network`: **CONFIGURADA**
* Persistencia de datos: **CONFIGURADA**
* Backup: **CONFIGURADO**
