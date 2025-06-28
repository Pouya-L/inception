# Inception

## 📝 **Project Summary**

This project sets up a **WordPress website with MariaDB and Nginx** using Docker and Docker Compose, following 42 Inception subject requirements.

---

## ⚙️ **Stack Components**

### ✅ **MariaDB**

- Runs as a container named `mariadb`
- Creates:
  - `wordpress` database
  - Sets `root` password for security
- Data persists in bind-mounted volume: `/home/plashkar/data/mariadb` if using the linux version of the docker-compose.yml

---

### ✅ **WordPress**

- Runs as container `wordpress`
- Uses **WP-CLI** for automated setup:
  - Generates `wp-config.php`
  - Installs WordPress
  - Creates an admin and a second user
  - Activates the chosen theme
- Data persists in bind-mounted volume: `/home/plashkar/data/wordpress`

---

### ✅ **Nginx**

- Runs as container `nginx`
- Uses a **self-signed SSL/TLS certificate**
- Serves WordPress over **HTTPS (TLS 1.3)**
- Configured as reverse proxy to PHP-FPM in WordPress container

---

## 📂 **Project Structure**
```
├── Makefile
└── srcs/
   ├── docker-compose.yml
   ├── requirements/
   │  ├── mariadb/
   │     ├── Dockerfile
   │  │     └── tools/
   │  │        └── entrypoint.sh
   │  ├── wordpress/
   │  │  ├── Dockerfile
   │  │  └── tools/
   │  │     └── setup.sh
   │  └── nginx/
   │     ├── Dockerfile
   │     └── conf/
   │        └── default.conf
   └── data/
      ├── mariadb/
      └── wordpress/
```

---
## 🚀 **Usage**

`make up` # Build and start containers
`make logs` # View logs
`make stop` # Stop containers
`make start` # Start stopped containers
`make clean` # Remove containers and images (keeps data)
`make ResetAll` # Full cleanup including volumes
`make migrate_data` # Migrate pre-saved SQL and Wordpress files

