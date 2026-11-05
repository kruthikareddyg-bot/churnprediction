FROM python:3.13-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements-api.txt .

RUN pip install --no-cache-dir -r requirements-api.txt

COPY api/ ./api/
COPY models/churn_model.pkl ./models/churn_model.pkl
COPY models/preprocessor.pkl ./models/preprocessor.pkl
COPY config.yaml ./config.yaml

RUN mkdir -p logs/inference

EXPOSE 8000

CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8000"]
