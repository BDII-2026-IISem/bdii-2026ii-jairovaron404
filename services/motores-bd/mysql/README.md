# MySQL 8.0 - Motor de Base de Datos

> **Acceso remoto habilitado.**
> Puerto publicado: `3306`.
> Contenedor: `mysql-server`.
> Base de datos principal: `tecnogua`.

---

## 1. Información general

| Parámetro | Valor |
|---|---|
| Motor | MySQL |
| Versión | 8.0 |
| Imagen Docker | `mysql:8.0` |
| Contenedor | `mysql-server` |
| Puerto | `3306` |
| Red Docker | `ia-lab-network` |
| Base inicial | `tecnogua` |
| Zona horaria | `America/Bogota` |

---

## 2. Acceso desde el contenedor

Para ingresar directamente al servidor MySQL:

```bash
sudo docker exec -it mysql-server mysql -u root -p
````

Contraseña configurada para `root`:

```text
MiNiCo57**
```

---

## 3. Base de datos principal

La base creada inicialmente por Docker es:

```text
tecnogua
```

Para listar las bases:

```sql
SHOW DATABASES;
```

Para seleccionar la base:

```sql
USE tecnogua;
```

Para listar las tablas:

```sql
SHOW TABLES;
```

---

## 4. Crear una base de datos

Ejemplo:

```sql
CREATE DATABASE nombre_bd
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

Ejemplo utilizado en prácticas:

```sql
CREATE DATABASE practica_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

---

## 5. Crear un usuario con acceso remoto

La configuración utilizada para las pruebas remotas es:

```text
Usuario: estudiante
Host: %
Base de datos: practica_db
```

El usuario fue creado con:

```sql
CREATE USER 'estudiante'@'%'
IDENTIFIED BY 'PasswordSegura2024!';

GRANT ALL PRIVILEGES
ON practica_db.*
TO 'estudiante'@'%';

FLUSH PRIVILEGES;
```

El símbolo `%` permite conexiones desde cualquier dirección que tenga acceso al servidor.

---

## 6. Verificar el usuario remoto

Conectarse como `root`:

```bash
sudo docker exec -i mysql-server \
mysql -u root -p'MiNiCo57**'
```

Consultar:

```sql
SELECT
    user,
    host
FROM mysql.user
WHERE user = 'estudiante';
```

Resultado esperado:

```text
estudiante    %
```

Consultar los permisos:

```sql
SHOW GRANTS FOR 'estudiante'@'%';
```

Resultado esperado:

```text
GRANT ALL PRIVILEGES ON `practica_db`.* TO `estudiante`@`%`
```

---

## 7. Acceso remoto

La IP de WSL utilizada durante las pruebas fue:

```text
172.20.138.10
```

Puerto:

```text
3306
```

Datos de conexión:

```text
Host: 172.20.138.10
Port: 3306
User: estudiante
Password: PasswordSegura2024!
Database: practica_db
```

La IP de WSL puede cambiar después de reiniciar Windows o WSL.

Consultar la IP actual:

```bash
hostname -I
```

---

## 8. Comprobar el puerto remoto

Desde WSL:

```bash
nc -zv 172.20.138.10 3306
```

Resultado esperado:

```text
Connection to 172.20.138.10 3306 port [tcp/mysql] succeeded!
```

---

## 9. Prueba de conexión remota

Desde un cliente que tenga MySQL instalado:

```bash
mysql \
-h 172.20.138.10 \
-P 3306 \
-u estudiante \
-p \
-D practica_db
```

También puede utilizarse DBeaver, MySQL Workbench u otro cliente compatible.

---

## 10. Prueba realizada en el laboratorio

Se comprobó la conexión utilizando:

```text
Usuario: estudiante
Base: practica_db
Host: 172.20.138.10
Puerto: 3306
```

Se verificó:

```sql
SELECT
    USER() AS USUARIO,
    CURRENT_USER() AS USUARIO_AUTENTICADO,
    DATABASE() AS BASE_DATOS,
    @@hostname AS SERVIDOR;
```

Resultado obtenido:

```text
USUARIO:
estudiante@172.18.0.1

USUARIO_AUTENTICADO:
estudiante@%

BASE_DATOS:
practica_db
```

La conexión remota fue exitosa.

---

## 11. Prueba real de permisos

Se comprobó que el usuario remoto puede crear, modificar, consultar y eliminar objetos dentro de `practica_db`.

Prueba realizada:

```sql
CREATE TABLE prueba_remota (
    id INT PRIMARY KEY,
    mensaje VARCHAR(200)
);

INSERT INTO prueba_remota
VALUES (1, 'MySQL - prueba de acceso remoto');

SELECT
    id,
    mensaje
FROM prueba_remota;

DROP TABLE prueba_remota;
```

Resultado:

```text
CREATE TABLE       OK
INSERT             OK
SELECT             OK
DROP TABLE         OK
```

Por lo tanto, el usuario `estudiante` tiene correctamente los permisos asignados sobre `practica_db`.

---

## 12. Crear una tabla manualmente

Ejemplo:

```sql
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL
);
```

Insertar información:

```sql
INSERT INTO usuarios (nombre, correo)
VALUES ('Estudiante', 'estudiante@ejemplo.com');
```

Consultar:

```sql
SELECT * FROM usuarios;
```

---

## 13. Eliminar una base de datos

```sql
DROP DATABASE nombre_bd;
```

> **Precaución:** esta operación elimina la base de datos y su contenido.

---

## 14. Salir del cliente MySQL

```sql
EXIT;
```

o:

```sql
QUIT;
```

---

## 15. Backup

Backup de `tecnogua`:

```bash
sudo docker exec mysql-server \
mysqldump -u root -p'MiNiCo57**' tecnogua \
> /mnt/d/academia/bd/backup_tecnogua_$(date +%Y%m%d).sql
```

Los backups se almacenan en:

```text
/mnt/d/academia/bd/
```

Dentro del contenedor, el directorio corresponde a:

```text
/backups
```

---

## 16. Variables del `.env`

Archivo:

```text
.env
```

Configuración actual:

```text
TZ=America/Bogota
MYSQL_ROOT_PASSWORD=MiNiCo57**
MYSQL_DATABASE=tecnogua
```

---

## 17. Configuración de red

MySQL utiliza la red Docker externa:

```text
ia-lab-network
```

Puerto publicado:

```text
3306:3306
```

La publicación del puerto permite acceder al servidor desde el host mediante:

```text
172.20.138.10:3306
```

---

## 18. Contenedor

Nombre:

```text
mysql-server
```

Imagen:

```text
mysql:8.0
```

Verificar el contenedor:

```bash
sudo docker ps | grep mysql-server
```

Ver los últimos registros:

```bash
sudo docker logs mysql-server --tail 20
```

---

## 19. Healthcheck

Consultar el estado:

```bash
sudo docker inspect \
--format='{{.State.Status}} | {{.State.Health.Status}}' \
mysql-server
```

Estado esperado:

```text
running | healthy
```

---

## 20. Datos persistentes

Directorio de datos:

```text
~/ia-lab/data/mysql
```

Directorio de backups:

```text
/mnt/d/academia/bd
```

Los datos deben conservarse al detener y volver a iniciar los servicios mediante los scripts generales del laboratorio.

---

## 21. Comandos rápidos del laboratorio

Iniciar todos los motores:

```bash
cd ~/ia-lab/services/motores-bd
./start-all.sh
```

Detener todos los motores:

```bash
cd ~/ia-lab/services/motores-bd
./stop-all.sh
```

Ver todos los motores:

```bash
sudo docker ps
```

---

## 22. Estado de verificación

MySQL fue verificado durante la auditoría final.

Estado:

```text
running | healthy
```

Puerto:

```text
3306
```

Red:

```text
ia-lab-network
```

Usuario de prueba:

```text
estudiante
```

Base de prueba:

```text
practica_db
```

Acceso remoto:

```text
VERIFICADO
```

Prueba de permisos:

```text
VERIFICADA
```

---

**Estado:** MySQL 8.0 operativo, con persistencia, acceso remoto y permisos de prueba verificados.
