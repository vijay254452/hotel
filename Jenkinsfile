pipeline {
    agent any

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
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker rm -f myrestaurant || true'
                sh 'docker run -d --name myrestaurant -p 3247:8080 $DOCKER_IMAGE'
            }
        }
    }
}

