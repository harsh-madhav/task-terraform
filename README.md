# Task Management Application

A containerized Flask application deployed on Kubernetes with CI/CD using Jenkins.

## Project Structure

```
.
├── flask-project/         # Flask application source code
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
├── jenkins/              # Jenkins pipeline configurations
│   ├── Jenkinsfile       # Docker build pipeline
│   └── K8s_JenkinsFile   # Kubernetes deployment pipeline
├── kubernetes/           # Kubernetes manifests
│   ├── deployment.yaml
│   ├── env.yaml
│   ├── ingress.yaml
│   ├── kustomization.yaml
│   ├── service.yaml
│   └── serviceaccount.yaml
├── terraform-dg
    ├── main.tf
    ├── outputs.tf
    ├── providers.tf
    ├── variables.tf
    └── versions.tf
    ├── modules
    │   ├── kubernetes
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   ├── variables.tf
    │   │   └── versions.tf
    │   └── registry
    │       ├── main.tf
    │       ├── outputs.tf
    │       ├── variables.tf
    │       └── versions.tf
└── docker-compose.yml    # Local development setup
```

## Prerequisites

- Docker
- Kubernetes cluster (or Minikube for local development)
- kubectl
- kustomize
- Jenkins (for CI/CD)
- DigitalOcean Container Registry (or your preferred container registry)

## Getting Started

### Local Development

1. **Build and run the application locally:**
   ```bash
   cd flask-project
   docker-compose up --build
   ```
   The application will be available at `http://localhost:5000`

### Kubernetes Deployment

1. **Set up kubeconfig**
   Ensure your kubeconfig is properly configured to point to your Kubernetes cluster.

2. **Deploy using kustomize:**
   ```bash
   cd kubernetes
   kustomize build . | kubectl apply -f -
   ```

3. **Verify deployment:**
   ```bash
   kubectl -n task get all
   ```

## CI/CD Pipeline

The project includes two Jenkins pipelines:

1. **Docker Build Pipeline** (`Jenkinsfile`):
   - Builds Docker image
   - Pushes to container registry

2. **Kubernetes Deployment Pipeline** (`K8s_JenkinsFile`):
   - Deploys application to Kubernetes
   - Uses kustomize for environment-specific configurations

### Pipeline Setup

1. **Jenkins Credentials:**
   - `git-credentials`: For GitHub repository access
   - `docker-credentials`: For container registry access
   - Kubernetes kubeconfig (configured in Jenkins)

2. **Environment Variables:**
   - `REGISTRY`: Container registry URL
   - `IMAGE_NAME`: Name of the Docker image
   - `KUBE_NAMESPACE`: Target Kubernetes namespace

## Kubernetes Resources

- **Namespace:** `task`
- **Service:** `flask-task-task`
- **Deployment:** `flask-task-task`
- **Ingress:** `flask-task-task-default` (configured for `flask-task-task.test.com`)

## Resource Requirements

- **CPU:** 100m (request) / 100m (limit)
- **Memory:** 200Mi (request) / 200Mi (limit)

## Configuration

Environment variables are managed through the `env.yaml` ConfigMap in the Kubernetes manifests.

## Monitoring

To check the application logs:
```bash
kubectl -n task logs -l app=flask-task-task
```

## Cleanup

To remove all resources:
```bash
kubectl -n task delete -k kubernetes/
```
