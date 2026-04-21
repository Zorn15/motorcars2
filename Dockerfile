
FROM python:3.12-slim
 

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
 
# Directorio de trabajo dentro del contenedor
WORKDIR /app
 
# Copiar e instalar dependencias 
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
 
# Copiar el código fuente completo
COPY backend/ ./backend/
COPY frontend/ ./frontend/
 

ENV PORT=8080


EXPOSE 8080
 
CMD uvicorn app.main:app --host 0.0.0.0 --port ${PORT} --workers 1 --app-dir backend