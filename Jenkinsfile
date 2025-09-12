pipeline {
    agent any

    tools {
        maven 'Maven3'   // Make sure Maven3 is configured in Jenkins (Global Tool Config)
    }

    environment {
        DOCKER_IMAGE = "myrestaurant/restaurant-site:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/vijay254452/hotel.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Copy WAR into Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Stop old container if running
                    sh 'docker rm -f myrestaurant || true'
                    
                    // Run new container on port 8080
                    sh 'docker run -d --name myrestaurant -p 3247:8080 $DOCKER_IMAGE'
                }
            }
        }
    }
}

