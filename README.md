# MotorsCars - Gestión Colaborativa

Marketplace de vehículos desarrollado de forma colaborativa con metodología ágil Scrum, dividido en 3 sprints con roles definidos por integrante.

---

## Equipo de Desarrollo

| Rol | Nombre |
|-----|--------|
| **Product Owner / Frontend & QA** | Oscar Alejandro Morales Calderon |
| **Backend Developer** | David Layton |
| **Database Engineer** | Sebastian Blanco |

---

## Descripción del Proyecto

**MotorsCars** es una aplicación web de marketplace de vehículos que permite a compradores explorar y filtrar vehículos disponibles, y a vendedores publicar sus listados con fotos, especificaciones y contacto directo por WhatsApp.

La plataforma gestiona marcas (Brand), vehículos (Car) e imágenes (CarImage), con una API REST completa y un frontend responsivo con soporte para modo oscuro.

---

## Arquitectura

- **Frontend:** HTML5 + Tailwind CSS + JavaScript Vanilla
- **Backend:** Python 3.12 + FastAPI + SQLAlchemy + Pydantic
- **Base de datos:** PostgreSQL 14+
- **Infraestructura:** GCP (Cloud Run + Cloud SQL)
- **CI/CD:** GitHub Actions
- **Containerización:** Docker (python:3.12-slim)


## Sprints Completados

### Sprint 1: Base de Datos — Esquema y Scripts

| Historia de Usuario | Responsable | Puntos | Evidencia |
|---------------------|-------------|--------|-----------|
| Diseño del esquema relacional de la base de datos | @SebastianBlanco | 8 | 
| Script de datos semilla para desarrollo y pruebas | @SebastianBlanco | 5 | 
| Configuración de conexión a PostgreSQL desde FastAPI | @DavidLayton | 5 |
| Modelos ORM de SQLAlchemy para todas las entidades | @DavidLayton | 5 | 
| Diagrama entidad-relación y documentación del modelo | @OscarMoreles | 5 |
| Pruebas de integridad y validación de datos en DB | @OscarMoreles | 5  |

**Total Sprint 1: 33 puntos**

---

### Sprint 2: Backend — API REST CRUD

| Historia de Usuario | Responsable | Puntos | Evidencia |
|---------------------|-------------|--------|-----------|
| Optimización de consultas con índices y eager loading | @SebastianBlanco | 5 | 
| Vistas SQL y consultas auxiliares para el marketplace | @SebastianBlanco | 5 | 
| API CRUD de marcas de vehículos | @DavidLayton | 5 | 
| API CRUD de vehículos con gestión de imágenes | @DavidLayton | 8 | 
| Testing manual de la API con Postman/Swagger | @OscarMoreles | 5 | Colección Postman exportada |
| Documentación Swagger y validación de contratos | @OscarMoreles | 5 | 

**Total Sprint 2: 33 puntos**

---

### Sprint 3: Frontend, Despliegue y QA

| Historia de Usuario | Responsable | Puntos | Evidencia |
|---------------------|-------------|--------|-----------|
| Carga de datos de producción y poblado inicial | @SebastianBlanco | 5 | 
| Documentación técnica de la base de datos | @SebastianBlanco | 5 | 
| Containerización y despliegue en la nube | @DavidLayton | 8 | 
| Configuración de CORS y servicio de frontend estático | @DavidLayton | 5 | 
| Página principal con listado, grid y filtro por marca | @OscarMoreles | 8 | 
| Página de detalle, formulario de publicación y QA integral | @OscarMoreles | 13 |

**Total Sprint 3: 44 puntos**

---

## Métricas del Proyecto

| Métrica | Valor |
|---------|-------|
| **Velocity promedio** | 37 puntos por sprint |
| **Historias completadas** | 18 / 18 |
| **Total de puntos** | 110 puntos |
| **Bugs encontrados** | - |
| **Tiempo promedio de resolución** | - |

---

## Instalación y Uso

### Requisitos previos
- Python 3.12+
- PostgreSQL 14+
- Docker (opcional, para despliegue)

### 1. Clonar el repositorio
```bash
git clone https://github.com/[usuario]/MotorsCars.git
cd MotorsCars
```

### 2. Configurar la base de datos
```bash
# Crear la base de datos
psql -U postgres -c "CREATE DATABASE motorscars_db;"

# Ejecutar esquema y datos semilla
psql -U postgres -d motorscars_db -f database/schema.sql
psql -U postgres -d motorscars_db -f database/seed.sql

# (Opcional) Crear vistas auxiliares
psql -U postgres -d motorscars_db -f database/views.sql
```

### 3. Configurar variables de entorno
```bash
cd backend
copy .env.example .env
```
Editar `.env`:
```
DATABASE_URL=postgresql://postgres:TU_PASSWORD@localhost:5432/motorscars_db
```

### 4. Instalar dependencias y ejecutar
```bash
pip install -r requirements.txt
uvicorn app.main:app --reload
```
> Si `pip` no se reconoce: `py -m pip install -r requirements.txt`
> Si `uvicorn` no se reconoce: `py -m uvicorn app.main:app --reload`

### 5. Acceder a la aplicación
| URL | Descripción |
|-----|-------------|
| http://localhost:8000 | Página principal |
| http://localhost:8000/car-form.html | Publicar vehículo |
| http://localhost:8000/brands.html | Gestionar marcas |
| http://localhost:8000/docs | Swagger UI (API) |

### 6. Ejecutar con Docker
```bash
docker build -t motorscars .
docker run -p 8080:8080 -e DATABASE_URL=postgresql://... motorscars
```

---

## Endpoints de la API

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/api/brands` | Listar marcas ordenadas alfabéticamente |
| POST | `/api/brands` | Crear nueva marca |
| DELETE | `/api/brands/{id}` | Eliminar marca (cascada a vehículos) |
| GET | `/api/brands/{id}/cars` | Vehículos de una marca |
| GET | `/api/cars` | Listar vehículos (más recientes primero) |
| GET | `/api/cars/{id}` | Detalle de un vehículo |
| POST | `/api/cars` | Crear vehículo (hasta 10 imágenes) |
| PUT | `/api/cars/{id}` | Actualizar vehículo (parcial) |
| DELETE | `/api/cars/{id}` | Eliminar vehículo |

---

## Lecciones Aprendidas

- **Eager loading es crítico:** Sin `joinedload()` en SQLAlchemy las consultas generaban el problema N+1, afectando gravemente el rendimiento del listado de vehículos.
- **TEXT vs VARCHAR para imágenes:** Usar `TEXT` en lugar de `VARCHAR(500)` fue necesario para soportar imágenes codificadas en base64.
- **Separación de responsabilidades:** Dividir el trabajo por roles (DB, Backend, Frontend/QA) permitió trabajar en paralelo sin bloqueos entre sprints.
- **CORS desde el inicio:** Configurar CORS correctamente desde el Sprint 1 evitó problemas de integración entre frontend y backend en etapas avanzadas.

---

## Problemas Encontrados y Soluciones

| Problema | Solución |
|----------|----------|
| `python` / `pip` no reconocidos en Windows | Usar `py` y `py -m pip` en su lugar |
| Error CORS al abrir HTML como archivo local | El frontend se sirve desde FastAPI en `http://localhost:8000` |
| Error 500 al subir imagen grande | Se cambió `image_url` de `VARCHAR(500)` a `TEXT` para soporte base64 |
| N+1 queries en listado de vehículos | Se implementó `joinedload()` en SQLAlchemy para eager loading |
