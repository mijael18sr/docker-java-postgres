# Sistema CRUD de Empleados con Spring Boot y PostgreSQL

## Descripción
Aplicación web para gestión de empleados con CRUD completo, utilizando Spring Boot, Thymeleaf y PostgreSQL, totalmente dockerizada.

## Tecnologías
- Java 21
- Spring Boot 3.5.6
- Spring Data JPA
- Thymeleaf
- PostgreSQL
- Docker & Docker Compose
- Bootstrap 5
- Lombok

## Estructura del Proyecto
```
src/
├── main/
│   ├── java/
│   │   └── org/softprimesolutions/empleadopostgre/
│   │       ├── model/
│   │       │   └── Empleado.java
│   │       ├── repository/
│   │       │   └── EmpleadoRepository.java
│   │       ├── service/
│   │       │   └── EmpleadoService.java
│   │       └── controller/
│   │           ├── EmpleadoController.java
│   │           └── HomeController.java
│   └── resources/
│       ├── templates/
│       │   └── empleados/
│       │       ├── lista.html
│       │       └── formulario.html
│       └── application.properties
```

## Características
- ✅ CRUD completo de empleados
- ✅ Interfaz web con Thymeleaf y Bootstrap 5
- ✅ Base de datos PostgreSQL
- ✅ Dockerización completa
- ✅ Docker Compose para orquestación

## Instalación y Ejecución

### Con Docker Compose (Recomendado)
```bash
# Construir y levantar los contenedores
docker-compose up --build

# O en segundo plano
docker-compose up -d --build

# Ver logs
docker-compose logs -f

# Detener los contenedores
docker-compose down

# Detener y eliminar volúmenes
docker-compose down -v
```

### Desarrollo Local
```bash
# Primero levantar solo PostgreSQL
docker-compose up postgres -d

# Compilar y ejecutar la aplicación
mvnw spring-boot:run
```

## Acceso a la Aplicación
- **Aplicación Web**: http://localhost:8080
- **Lista de Empleados**: http://localhost:8080/empleados

## Endpoints

### Web (Thymeleaf)
- `GET /` - Redirige a la lista de empleados
- `GET /empleados` - Lista todos los empleados
- `GET /empleados/nuevo` - Formulario para nuevo empleado
- `GET /empleados/editar/{id}` - Formulario para editar empleado
- `POST /empleados/guardar` - Guarda o actualiza un empleado
- `GET /empleados/eliminar/{id}` - Elimina un empleado

## Configuración de Base de Datos
```properties
Database: mydatabase
Usuario: myuser
Contraseña: secret
Puerto: 5432
```

## Modelo de Datos - Empleado
- **id**: Long (auto-incrementable)
- **nombre**: String (obligatorio)
- **apellido**: String (obligatorio)
- **email**: String (obligatorio, único)
- **telefono**: String (opcional)
- **cargo**: String (opcional)
- **salario**: Double (opcional)

## Docker
El proyecto incluye:
- **Dockerfile**: Build multi-stage para optimizar la imagen
- **compose.yaml**: Orquestación de PostgreSQL y la aplicación
- **Healthcheck**: Verificación de estado de PostgreSQL

## Comandos Útiles

### Maven
```bash
# Limpiar y compilar
mvnw clean package

# Ejecutar tests
mvnw test

# Ejecutar aplicación
mvnw spring-boot:run
```

### Docker
```bash
# Construir imagen manualmente
docker build -t empleado-app .

# Ver contenedores en ejecución
docker ps

# Ver logs de un contenedor específico
docker logs empleado-app

# Conectarse a PostgreSQL
docker exec -it postgres-empleado psql -U myuser -d mydatabase
```

## Notas
- La aplicación espera a que PostgreSQL esté completamente iniciado antes de conectarse (healthcheck)
- Los datos de PostgreSQL persisten en un volumen Docker
- La aplicación crea/actualiza automáticamente las tablas en la base de datos

