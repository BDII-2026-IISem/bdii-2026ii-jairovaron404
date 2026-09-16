# Oracle XE 21c - Motor de Base de Datos

> **Acceso remoto habilitado.**
> Puerto expuesto en `0.0.0.0:1521`.
> Contenedor: `oracle-server`.
> Imagen: `gvenzl/oracle-xe:21-slim`.
> Service Name: `tecnogua`.

---

## Información del servicio

| Parámetro | Valor |
|---|---|
| Motor | Oracle Database XE |
| Versión | 21c |
| Contenedor | `oracle-server` |
| Imagen | `gvenzl/oracle-xe:21-slim` |
| Puerto interno | `1521` |
| Puerto publicado | `1521` |
| Service Name | `tecnogua` |
| Usuario administrador | `SYSTEM` |
| Red Docker | `ia-lab-network` |
| Datos | `~/ia-lab/data/oracle` |
| Backups | `/mnt/d/academia/bd` |

---

## Conectar desde WSL

Conexión local utilizando `SYSTEM`:

```bash
sudo docker exec -it oracle-server \
sqlplus 'system/TU_PASSWORD@//127.0.0.1:1521/tecnogua'
````

> Reemplazar `TU_PASSWORD` por la contraseña definida en el archivo `.env`.

---

## Conectar como usuario propio

Se creó el usuario:

```text
Usuario: estudiante
```

Conexión local:

```bash
sudo docker exec -it oracle-server \
sqlplus 'estudiante/TU_PASSWORD@//127.0.0.1:1521/tecnogua'
```

Conexión utilizando la IP del servidor:

```bash
sudo docker exec -it oracle-server \
sqlplus 'estudiante/TU_PASSWORD@//IP_SERVIDOR:1521/tecnogua'
```

---

## Usuario remoto `estudiante`

El usuario propio utilizado para las pruebas es:

```text
estudiante
```

Se le otorgaron los siguientes privilegios:

```sql
GRANT CREATE SESSION TO estudiante;

GRANT CREATE TABLE TO estudiante;

GRANT CREATE VIEW TO estudiante;

GRANT CREATE SEQUENCE TO estudiante;

GRANT CREATE TRIGGER TO estudiante;
```

También dispone de cuota ilimitada en el tablespace `USERS`:

```sql
ALTER USER estudiante
QUOTA UNLIMITED ON USERS;
```

---

## Crear un usuario propio

Conectarse como un usuario con privilegios administrativos, por ejemplo `SYSTEM`:

```sql
CREATE USER nombre_usuario
IDENTIFIED BY "PasswordSegura";

GRANT CREATE SESSION TO nombre_usuario;

GRANT CREATE TABLE TO nombre_usuario;

GRANT CREATE VIEW TO nombre_usuario;

GRANT CREATE SEQUENCE TO nombre_usuario;

GRANT CREATE TRIGGER TO nombre_usuario;

ALTER USER nombre_usuario
QUOTA UNLIMITED ON USERS;
```

---

## Listar usuarios

Desde un usuario con permisos suficientes:

```sql
SELECT
    username
FROM all_users
ORDER BY username;
```

Para consultar privilegios:

```sql
SELECT
    grantee,
    privilege
FROM dba_sys_privs
WHERE grantee = 'ESTUDIANTE'
ORDER BY privilege;
```

---

## Crear una tabla

```sql
CREATE TABLE ejemplo (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100)
);
```

---

## Insertar datos

```sql
INSERT INTO ejemplo (
    id,
    nombre
)
VALUES (
    1,
    'Ejemplo Oracle'
);

COMMIT;
```

---

## Consultar datos

```sql
SELECT
    id,
    nombre
FROM ejemplo;
```

---

## Eliminar una tabla

```sql
DROP TABLE ejemplo PURGE;
```

---

## Conexión remota desde otro equipo

Oracle utiliza el puerto:

```text
1521
```

La conexión remota requiere:

```text
Host: IP_SERVIDOR
Port: 1521
Service Name: tecnogua
User: estudiante
Password: TU_PASSWORD
```

Ejemplo:

```text
Host: 172.20.138.10
Port: 1521
Service Name: tecnogua
User: estudiante
```

> La IP puede cambiar si WSL obtiene una nueva dirección. Verificar siempre con `hostname -I`.

---

## Conexión desde DBeaver

Configuración:

```text
Driver: Oracle
Host: IP_SERVIDOR
Port: 1521
Database / Service Name: tecnogua
Username: estudiante
Password: TU_PASSWORD
Role: Default
```

Para el servidor local se puede utilizar:

```text
Host: 127.0.0.1
Port: 1521
Service Name: tecnogua
```

---

## Prueba de puerto

Comprobar que el puerto Oracle está disponible:

```bash
nc -zv IP_SERVIDOR 1521
```

Ejemplo:

```bash
nc -zv 172.20.138.10 1521
```

Resultado esperado:

```text
Connection to 172.20.138.10 1521 port [tcp/*] succeeded!
```

---

## Prueba de conexión remota

```bash
sudo docker exec -i oracle-server \
sqlplus -s 'estudiante/TU_PASSWORD@//IP_SERVIDOR:1521/tecnogua' <<'SQL'

SET PAGESIZE 100
SET LINESIZE 200

SELECT
    USER AS USUARIO,
    SYS_CONTEXT('USERENV','SERVICE_NAME') AS SERVICIO,
    SYS_CONTEXT('USERENV','DB_NAME') AS BASE_DATOS,
    SYS_CONTEXT('USERENV','SERVER_HOST') AS SERVIDOR
FROM DUAL;

EXIT;
SQL
```

---

## Prueba real de permisos

La siguiente prueba verifica que el usuario remoto puede crear, modificar, consultar y eliminar objetos:

```bash
sudo docker exec -i oracle-server \
sqlplus -s 'estudiante/TU_PASSWORD@//IP_SERVIDOR:1521/tecnogua' <<'SQL'

CREATE TABLE prueba_remota (
    id NUMBER PRIMARY KEY,
    mensaje VARCHAR2(200)
);

INSERT INTO prueba_remota (
    id,
    mensaje
)
VALUES (
    1,
    'Oracle - prueba de acceso remoto'
);

COMMIT;

SELECT
    id,
    mensaje
FROM prueba_remota;

DROP TABLE prueba_remota PURGE;

EXIT;
SQL
```

Resultado esperado:

```text
Table created.

1 row created.

Commit complete.

Table dropped.
```

---

## Backup

Oracle utiliza Data Pump para realizar exportaciones.

Ejemplo:

```bash
sudo docker exec oracle-server \
expdp system/TU_PASSWORD@tecnogua \
directory=DATA_PUMP_DIR \
dumpfile=backup_tecnogua.dmp \
logfile=backup_tecnogua.log
```

> Verificar previamente que `DATA_PUMP_DIR` esté configurado y que el directorio del contenedor tenga el almacenamiento correspondiente.

---

## Verificar contenedor

```bash
sudo docker ps --filter name=oracle-server
```

Debe aparecer:

```text
Up ... (healthy)
```

También se puede comprobar directamente:

```bash
sudo docker inspect \
--format='Status={{.State.Status}} | Health={{.State.Health.Status}}' \
oracle-server
```

Resultado esperado:

```text
Status=running | Health=healthy
```

---

## Verificar puerto

```bash
sudo ss -lntp | grep ':1521'
```

Resultado esperado:

```text
0.0.0.0:1521
```

---

## Verificar usuarios

```bash
sudo docker exec -i oracle-server \
sqlplus -s 'system/TU_PASSWORD@//127.0.0.1:1521/tecnogua' <<'SQL'

SET PAGESIZE 100

SELECT
    username
FROM all_users
WHERE username IN ('ALMACENDB_ADMIN', 'ESTUDIANTE')
ORDER BY username;

EXIT;
SQL
```

---

## Red Docker

El contenedor utiliza la red externa:

```text
ia-lab-network
```

Verificar:

```bash
sudo docker network inspect ia-lab-network
```

La dirección interna actual del contenedor Oracle pertenece a la red Docker `172.18.0.0/16`.

---

## Estructura

```text
~/ia-lab/services/motores-bd/oracle/
├── .env
├── README.md
└── docker-compose.yml
```

Datos:

```text
~/ia-lab/data/oracle
```

Backups:

```text
/mnt/d/academia/bd
```

---

## Estado verificado

* Oracle XE 21c: **ACTIVO**
* Imagen `gvenzl/oracle-xe:21-slim`: **VERIFICADA**
* Contenedor `oracle-server`: **HEALTHY**
* Puerto 1521: **ACTIVO**
* Service Name `tecnogua`: **DISPONIBLE**
* Usuario `SYSTEM`: **DISPONIBLE**
* Usuario `estudiante`: **CREADO**
* Acceso remoto: **VERIFICADO**
* Creación de tabla: **VERIFICADA**
* Inserción de datos: **VERIFICADA**
* Consulta de datos: **VERIFICADA**
* Eliminación de tabla: **VERIFICADA**
* Red Docker `ia-lab-network`: **CONFIGURADA**

---

## Comprobación general

Desde:

```bash
cd ~/ia-lab/services/motores-bd
```

Ejecutar:

```bash
sudo docker ps \
--format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" \
| grep -E "mysql|postgres|sqlserver|oracle"
```

Los cuatro motores deben encontrarse activos:

```text
mysql-server
postgres-server
sqlserver-container
oracle-server
```

---

## Nota de seguridad

No almacenar contraseñas reales dentro de este README cuando el proyecto vaya a ser compartido o publicado.

Las contraseñas deben mantenerse preferiblemente en:

```text
.env
```

y no deben subirse a repositorios públicos.

