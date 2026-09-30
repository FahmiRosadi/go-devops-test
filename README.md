# Simple Journey DevOps Test

## Overview

This project is a simple Go web application containerized using Docker and prepared for CI/CD using Jenkins.

The application returns a simple message containing the application version.

Example:

```text
Hello, DevOps! version=1.0.1
```

## Project Structure

```text
go-devops-test/
├── Dockerfile
├── Jenkinsfile
├── README.md
├── go.mod
├── *.go
└── .gitignore
```

## Requirements

The following tools are required to run this project:

* Go
* Docker Desktop
* Git
* Jenkins

## Build Application

Initialize the Go dependencies:

```bash
go mod tidy
```

Run the application locally:

```bash
go run .
```

The application runs on port `8080` by default.

Open:

```text
http://localhost:8080
```

## Build Docker Image

Build the Docker image with:

```bash
docker build -t go-devops-test:1.0.1 .
```

Check the created image:

```bash
docker images
```

## Run Docker Container

Run the application:

```bash
docker run -d --name devops-go -p 8080:8080 go-devops-test:1.0.1
```

Check the running container:

```bash
docker ps
```

Test the application:

```bash
curl http://localhost:8080/
```

Expected response:

```text
Hello, DevOps! version=1.0.1
```

To stop the container:

```bash
docker stop devops-go
```

To remove the container:

```bash
docker rm devops-go
```

## Jenkins CI/CD

The `Jenkinsfile` defines the CI/CD pipeline for this project.

The pipeline consists of the following stages:

1. Checkout source code
2. Run Go tests
3. Build Docker image
4. Run Docker container
5. Perform application health check

The pipeline is designed to automate the process from source-code checkout through Docker image creation and application verification.

## Docker

The application is packaged into a Docker image so that the runtime environment is consistent and the application can be deployed independently from the host environment.

The Docker image is tagged using:

```text
go-devops-test:1.0.1
```

## Versioning

The application version is embedded during the Go build process.

Example:

```text
Hello, DevOps! version=1.0.1
```

Changing the version allows the resulting application and Docker image to be identified clearly.

## Testing

The application can be tested using:

```bash
go test ./...
```

The running container can also be verified through:

```bash
curl http://localhost:8080/
```

A successful response confirms that the application is running and accessible.

## Deployment Flow

The intended deployment flow is:

```text
Developer
   ↓
Git Repository
   ↓
Jenkins
   ↓
Go Test
   ↓
Docker Build
   ↓
Docker Container
   ↓
Health Check
```

## Submission Notes

This repository contains the source code, Dockerfile, Jenkinsfile, scripts, and documentation required for the DevOps test submission.

Screenshots of the build, Docker container, and pipeline execution can be added to this README when the corresponding steps have been completed.
