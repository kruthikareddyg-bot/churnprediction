# Lab 11: Containerization and Deployment of ML Systems

## 1. Objective
To containerize the Churn Prediction Machine Learning application using Docker and deploy it using Kubernetes.

## 2. Project Overview
The project uses a trained Machine Learning model to predict customer churn.
A FastAPI application provides REST API endpoints for making predictions.

## 3. Docker Containerization

### Technologies Used
- Docker
- Python 3.13
- FastAPI
- Uvicorn
- Scikit-learn

### Files Created
- Dockerfile
- .dockerignore
- requirements-api.txt

### Build Docker Image
docker build -t churn-prediction-api:lab11 .

### Run Docker Container
docker run -d --name churn-api -p 8000:8000 churn-prediction-api:lab11

### Verify Container
docker ps

## 4. API Testing

The following endpoints were tested:

- GET /
- GET /health
- GET /metadata
- POST /predict
- POST /predict/batch

API documentation:
http://localhost:8000/docs

Health check:
http://localhost:8000/health

Health check result: healthy

Model loaded: True
Preprocessor loaded: True

## 5. Kubernetes Deployment

Kubernetes was enabled through Docker Desktop.

### Kubernetes Configuration
- k8s/deployment.yaml
- k8s/service.yaml

### Check Kubernetes Nodes
kubectl get nodes

### Deploy Application
kubectl apply -f k8s/

### Check Pods
kubectl get pods

### Check Services
kubectl get services

### Port Forwarding
kubectl port-forward service/churn-api-service 8001:8000

### Kubernetes Health Check
http://localhost:8001/health

Result: healthy

## 6. Deployment Architecture

User
  |
  v
FastAPI Application
  |
  v
Machine Learning Model
  |
  v
Docker Container
  |
  v
Kubernetes Deployment
  |
  v
Kubernetes Service
  |
  v
Prediction Response

## 7. Results

- Successfully created a Docker image.
- Successfully executed the FastAPI application inside a Docker container.
- Successfully loaded the trained model and preprocessor.
- Verified API health and metadata endpoints.
- Successfully deployed the application using Kubernetes.
- Verified Kubernetes pod status as Running.
- Successfully exposed the application through a Kubernetes service.
- Verified application health through Kubernetes port forwarding.

## 8. Conclusion

The Churn Prediction Machine Learning application was successfully containerized using Docker and deployed using Kubernetes. The deployment demonstrates how Machine Learning applications can be packaged, executed and managed in a containerized environment.
