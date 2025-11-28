pipeline {
    agent any
    
    tools {
        maven 'maven'   
    }

    stages {
        
        stage('Checkout Code') {
            steps {
                echo "📥 Pulling latest code..."
                checkout scm
            }
        }

        stage('Build Spring Boot JAR') {
            steps {
                echo "🔨 Building JAR..."
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "📦 Building Docker image..."
                sh """
                    docker build -t springboot-redis-app .
                """
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                echo "🚀 Deploying using Docker Compose..."
                sh """
                    docker-compose down || true
                    docker-compose up --build -d
                """
            }
        }

        stage('Verify Deployment') {
            steps {
                echo "🔍 Checking running containers..."
                sh "docker ps"
            }
        }
    }

    post {
        success {
            echo "🎉 Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed!"
        }
    }
}

