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

## Métricas y Reportes

Métricas obtenidas a partir de **GitHub Insights** (Pulse, Contributors, Code Frequency) y del **Burn-up chart** del Project Board (`MotorCars Board → Insights`). Periodo medido: **11 abr 2026 — 23 abr 2026**.

### Resumen ejecutivo

| Métrica | Valor | Fuente |
|---------|-------|--------|
| **Velocity promedio** | 36.6 puntos / sprint | Suma de puntos por sprint |
| **Velocity por sprint** | 33 / 33 / 44 | Tablas de sprints |
| **Throughput** | 6 historias / sprint | 18 historias / 3 sprints |
| **Historias completadas** | 18 / 18 (100%) | GitHub Issues cerrados |
| **Total de puntos entregados** | 110 puntos | Suma de los 3 sprints |
| **Pull Requests fusionados** | 6 (0 abiertos) | Insights → Pulse |
| **Contribuidores activos** | 3 autores | Insights → Contributors |
| **Commits a `main`** | 12 (17 en todas las ramas) | Insights → Pulse |
| **Cambio de código** | +2150 / −1 líneas (33 archivos) | Insights → Code frequency |
| **Bugs en producción** | 0 | QA manual + Swagger |

### 1. Velocity (puntos completados por sprint)

| Sprint | Puntos planificados | Puntos completados | % cumplimiento |
|--------|---------------------|--------------------|----------------|
| Sprint 1 — Base de Datos | 33 | 33 | 100% |
| Sprint 2 — Backend API | 33 | 33 | 100% |
| Sprint 3 — Frontend, Despliegue y QA | 44 | 44 | 100% |
| **Promedio** | **36.6** | **36.6** | **100%** |

> Observación: la velocity creció en el Sprint 3 (+33%) porque el equipo ya estaba alineado con la herramienta de despliegue y la API estaba estable.

### 2. Burn-up Chart (trabajo completado vs total)

Tomado del Project `MotorCars Board → Insights → Burn up` (rango: 2 semanas, `is:issue`).

| Fecha | Issues completados | Issues totales |
|-------|---------------------|----------------|
| 16 abr | 4 | 18 |
| 18 abr | 6 | 18 |
| 21 abr | 14 | 18 |
| 23 abr | **18** | 18 |

Línea verde (completed) alcanza la línea morada (open) el 23 de abril → **scope cerrado al 100%**.

> Equivalente al burndown: el trabajo restante pasó de 18 → 0 en el periodo.

### 3. Lead Time y Cycle Time

Calculados sobre los 6 PRs fusionados visibles en `Insights → Pulse`.

| Métrica | Definición | Valor promedio |
|---------|------------|----------------|
| **Lead Time** | Desde creación del issue hasta cierre del PR asociado | ~2.5 días |
| **Cycle Time** | Desde primer commit del PR hasta merge a `main` | ~1 día |

PRs de referencia:
- `#31 Production (despliegue)` — merge el 22 abr
- `#30 Merge con sprint 3 para despliegue` — merge el 21 abr
- `#29 Merge con sprint 2` — merge el 21 abr
- `#22 Revert "Add files via upload"` — merge el 21 abr

### 4. Throughput (historias completadas por periodo)

| Sprint | Historias entregadas |
|--------|----------------------|
| Sprint 1 | 6 |
| Sprint 2 | 6 |
| Sprint 3 | 6 |
| **Total** | **18** |

Throughput estable de **6 historias por sprint** durante todo el proyecto.

### 5. Distribución de contribuciones

Datos de `Insights → Contributors` (rango: All).

| Contribuidor | Commits | Adiciones | Eliminaciones |
|--------------|---------|-----------|---------------|
| @Zorn15 (Oscar Morales) | 11 | 2,040 | 256 |
| @OscarLaiton2105 | 2 | 366 | 0 |
| Otros | — | — | — |

### Dashboard de Métricas (GitHub Insights)

Las gráficas en vivo se consultan desde el repositorio:

| Vista | Ruta | Métrica que muestra |
|-------|------|---------------------|
| Pulse | `Insights → Pulse` | PRs, issues, commits y autores del periodo |
| Contributors | `Insights → Contributors` | Commits por persona en el tiempo |
| Code frequency | `Insights → Code frequency` | Adiciones/eliminaciones por semana |
| Burn up chart | `Projects → MotorCars Board → Insights → Burn up` | Progreso de issues vs total |
| Status chart | `Projects → MotorCars Board → Insights → Status chart` | Issues por estado (Todo/In progress/Done) |

Las capturas de evidencia se almacenan en [`docs/metrics/`](docs/metrics/).

### Lecciones Aprendidas

- **Eager loading es crítico:** sin `joinedload()` en SQLAlchemy las consultas generaban el problema N+1, afectando gravemente el rendimiento del listado de vehículos.
- **TEXT vs VARCHAR para imágenes:** usar `TEXT` en lugar de `VARCHAR(500)` fue necesario para soportar imágenes codificadas en base64.
- **Separación de responsabilidades:** dividir el trabajo por roles (DB, Backend, Frontend/QA) permitió trabajar en paralelo sin bloqueos entre sprints.
- **CORS desde el inicio:** configurar CORS correctamente desde el Sprint 1 evitó problemas de integración entre frontend y backend en etapas avanzadas.
- **El burn-up reveló acumulación al final:** la mayor parte del cierre de issues ocurrió entre el 20 y 23 de abril. Para futuros proyectos, distribuir el merge de PRs a lo largo del sprint en vez de concentrarlo al cierre.
- **Workload Identity Federation > claves JSON:** evitar subir credenciales al repo simplificó la configuración de GitHub Actions y eliminó el riesgo de filtración de secrets.

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

## Despliegue en Google Cloud Run

Guía de despliegue manual en GCP (Cloud Run + Cloud SQL PostgreSQL) desde Cloud Shell.

### 1. Crear la instancia de Cloud SQL
```bash
gcloud sql instances create motorscars-db \
  --database-version=POSTGRES_15 \
  --tier=db-f1-micro \
  --region=us-central1

gcloud sql databases create motorscars_db --instance=motorscars-db

gcloud sql users create motorscars_user \
  --instance=motorscars-db \
  --password='TU_PASSWORD_SEGURO'
```

### 2. Variables y APIs
```bash
PROJECT_ID=$(gcloud config get-value project)
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
CONNECTION_NAME=$(gcloud sql instances describe motorscars-db --format='value(connectionName)')
REGION="us-central1"

gcloud services enable \
  run.googleapis.com \
  sqladmin.googleapis.com \
  cloudbuild.googleapis.com \
  artifactregistry.googleapis.com \
  storage.googleapis.com
```

### 3. Artifact Registry y permisos
```bash
gcloud artifacts repositories create motorscars \
  --repository-format=docker \
  --location=$REGION

COMPUTE_SA="${PROJECT_NUMBER}-compute@developer.gserviceaccount.com"

for ROLE in \
  roles/cloudbuild.builds.builder \
  roles/storage.admin \
  roles/artifactregistry.writer \
  roles/logging.logWriter \
  roles/cloudsql.client; do
  gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:${COMPUTE_SA}" \
    --role="$ROLE"
done
```

### 4. Construir la imagen con Cloud Build
```bash
cd ~/motorcars2
gcloud builds submit --tag ${REGION}-docker.pkg.dev/${PROJECT_ID}/motorscars/motorscars
```

### 5. Desplegar en Cloud Run
```bash
gcloud run deploy motorscars \
  --image ${REGION}-docker.pkg.dev/${PROJECT_ID}/motorscars/motorscars:latest \
  --region ${REGION} \
  --allow-unauthenticated \
  --memory 512Mi \
  --add-cloudsql-instances=${CONNECTION_NAME} \
  --set-env-vars="DATABASE_URL=postgresql://motorscars_user:TU_PASSWORD@/motorscars_db?host=/cloudsql/${CONNECTION_NAME}"
```

### 6. Cargar schema, seed y vistas
```bash
cd ~/motorcars2/database
gcloud sql connect motorscars-db --user=motorscars_user --database=motorscars_db
```
Dentro del prompt `psql`:
```sql
\i schema.sql
\i seed.sql
\i views.sql
\q
```

### 7. Obtener la URL pública
```bash
gcloud run services describe motorscars --region us-central1 --format='value(status.url)'
```

---

## CI/CD con GitHub Actions

Automatización del despliegue: cada `git push` a `main` construye la imagen y actualiza Cloud Run.

### 1. Crear Service Account para GitHub Actions
```bash
PROJECT_ID=$(gcloud config get-value project)
SA_NAME="github-actions-deployer"
SA_EMAIL="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"

gcloud iam service-accounts create $SA_NAME \
  --display-name="GitHub Actions Deployer"

for ROLE in \
  roles/run.admin \
  roles/cloudbuild.builds.editor \
  roles/artifactregistry.writer \
  roles/storage.admin \
  roles/cloudsql.client \
  roles/iam.serviceAccountUser; do
  gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:${SA_EMAIL}" \
    --role="$ROLE"
done
```

### 2. Configurar Workload Identity Federation
```bash
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
POOL_ID="github-pool"
PROVIDER_ID="github-provider"
GITHUB_REPO="USUARIO/motorcars2"
GITHUB_OWNER="USUARIO"

gcloud services enable iamcredentials.googleapis.com sts.googleapis.com

gcloud iam workload-identity-pools create $POOL_ID \
  --location="global" \
  --display-name="GitHub Actions Pool"

gcloud iam workload-identity-pools providers create-oidc $PROVIDER_ID \
  --location="global" \
  --workload-identity-pool=$POOL_ID \
  --display-name="GitHub Provider" \
  --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.repository=assertion.repository,attribute.repository_owner=assertion.repository_owner" \
  --attribute-condition="assertion.repository_owner == '${GITHUB_OWNER}'" \
  --issuer-uri="https://token.actions.githubusercontent.com"

gcloud iam service-accounts add-iam-policy-binding $SA_EMAIL \
  --role="roles/iam.workloadIdentityUser" \
  --member="principalSet://iam.googleapis.com/projects/${PROJECT_NUMBER}/locations/global/workloadIdentityPools/${POOL_ID}/attribute.repository/${GITHUB_REPO}"
```

### 3. Secrets en GitHub (Settings → Secrets and variables → Actions)

| Nombre | Valor |
|---|---|
| `GCP_PROJECT_ID` | ID del proyecto de GCP |
| `GCP_WIF_PROVIDER` | `projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/github-pool/providers/github-provider` |
| `GCP_SA_EMAIL` | `github-actions-deployer@PROJECT_ID.iam.gserviceaccount.com` |
| `DATABASE_URL` | URL completa de conexión a Cloud SQL vía socket |
| `CLOUDSQL_CONNECTION_NAME` | `PROJECT_ID:REGION:motorscars-db` |

### 4. Workflow `.github/workflows/deploy.yml`

El workflow ejecuta automáticamente en cada push a `main`:
1. Checkout del código
2. Autenticación a GCP vía WIF
3. Build de la imagen Docker
4. Push a Artifact Registry
5. Deploy a Cloud Run con la conexión a Cloud SQL

### 5. Flujo de trabajo diario
```bash
git add .
git commit -m "descripción del cambio"
git push origin main
```
GitHub Actions detecta el push, construye, sube y despliega automáticamente (~3–5 min).
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

## Problemas Encontrados y Soluciones

| Problema | Solución |
|----------|----------|
| `python` / `pip` no reconocidos en Windows | Usar `py` y `py -m pip` en su lugar |
| Error CORS al abrir HTML como archivo local | El frontend se sirve desde FastAPI en `http://localhost:8000` |
| Error 500 al subir imagen grande | Se cambió `image_url` de `VARCHAR(500)` a `TEXT` para soporte base64 |
| N+1 queries en listado de vehículos | Se implementó `joinedload()` en SQLAlchemy para eager loading |
