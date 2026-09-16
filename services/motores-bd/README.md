# IA Lab - Motores de Bases de Datos

## 11. Anexos

### A. Tabla resumen de puertos

| Motor | Puerto | Usuario por defecto | Password por defecto |
|---|---:|---|---|
| MySQL | 3306 | root | MiNiCo57** |
| PostgreSQL | 5432 | postgres | MiNiCo57** |
| SQL Server | 1433 | SA | MiNiCo57**Fuerte |
| Oracle XE | 1521 | SYSTEM | MiNiCo57** |

### B. Comandos útiles

```bash
# Ver todos los contenedores corriendo
sudo docker ps

# Ver logs de un contenedor
sudo docker logs mysql-server --tail 50 -f
sudo docker logs postgres-server --tail 50 -f
sudo docker logs sqlserver-container --tail 50 -f
sudo docker logs oracle-server --tail 50 -f

# Detener un motor individual
cd ~/ia-lab/services/motores-bd/mysql
sudo docker compose down

# Detener todos los motores
cd ~/ia-lab/services/motores-bd
./stop-all.sh

# Eliminar volúmenes (BORRA TODOS LOS DATOS)
sudo docker compose down -v
````

### C. Clientes gráficos recomendados

| Motor      | Cliente gráfico                     | Sitio oficial                                                                                  |
| ---------- | ----------------------------------- | ---------------------------------------------------------------------------------------------- |
| MySQL      | MySQL Workbench                     | [https://dev.mysql.com/downloads/workbench/](https://dev.mysql.com/downloads/workbench/)       |
| MySQL      | DBeaver                             | [https://dbeaver.io/download/](https://dbeaver.io/download/)                                   |
| PostgreSQL | pgAdmin                             | [https://www.pgadmin.org/download/](https://www.pgadmin.org/download/)                         |
| PostgreSQL | DBeaver                             | [https://dbeaver.io/download/](https://dbeaver.io/download/)                                   |
| SQL Server | SQL Server Management Studio (SSMS) | [https://aka.ms/ssmsfullsetup](https://aka.ms/ssmsfullsetup)                                   |
| Oracle     | Oracle SQL Developer                | [https://www.oracle.com/database/sqldeveloper/](https://www.oracle.com/database/sqldeveloper/) |
| Oracle     | DBeaver                             | [https://dbeaver.io/download/](https://dbeaver.io/download/)                                   |

### D. Diagrama de la arquitectura completa

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                            WINDOWS HOST                                     │
│                                                                             │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐                │
│  │ MySQL Workbench │  │    DBeaver      │  │   pgAdmin    │                │
│  └────────┬────────┘  └────────┬────────┘  └──────┬───────┘                │
│           │                    │                  │                         │
└───────────┼────────────────────┼──────────────────┼─────────────────────────┘
            │                    │                  │
            │  IP_WSL:3306       │ IP_WSL:5432     │ IP_WSL:1521
            ▼                    ▼                  ▼

┌─────────────────────────────────────────────────────────────────────────────┐
│                           WSL / DOCKER                                      │
│                                                                             │
│  ┌─────────────┐  ┌────────────────┐  ┌──────────────┐  ┌─────────────┐    │
│  │mysql-server │  │postgres-server │  │sqlserver-   │  │oracle-server│    │
│  │    :3306    │  │     :5432      │  │  container   │  │    :1521    │    │
│  │             │  │                │  │    :1433     │  │             │    │
│  └──────┬──────┘  └───────┬────────┘  └──────┬───────┘  └──────┬──────┘    │
│         │                  │                  │                 │           │
│         └──────────────────┴──────────────────┴─────────────────┘           │
│                                  │                                          │
│                         ia-lab-network                                      │
│                                  │                                          │
│                  ┌───────────────┴───────────────┐                          │
│                  │                               │                          │
│                  │       Otros servicios         │                          │
│                  │       del IA Lab              │                          │
│                  │                               │                          │
│                  └───────────────────────────────┘                          │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

> **Nota:** Las contraseñas mostradas en este documento corresponden al entorno local del laboratorio. No deben incluirse en repositorios públicos ni compartirse fuera del entorno académico.

