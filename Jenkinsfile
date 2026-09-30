pipeline {
    agent any

    environment {
        IMAGE_NAME = 'go-devops-test'
        IMAGE_TAG = '1.0.1'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                echo 'Running Go tests...'
                bat 'go test ./...'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t %IMAGE_NAME%:%IMAGE_TAG% .'
            }
        }

        stage('Run Container') {
            steps {
                echo 'Starting Docker container...'
                bat 'docker rm -f devops-go || exit 0'
                bat 'docker run -d --name devops-go -p 8080:8080 %IMAGE_NAME%:%IMAGE_TAG%'
            }
        }

        stage('Health Check') {
            steps {
                echo 'Checking application...'
                bat 'timeout /t 5'
                bat 'curl.exe http://localhost:8080/'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}