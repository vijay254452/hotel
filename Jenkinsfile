pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-id' // Replace with your Jenkins DockerHub credentials ID
        IMAGE_NAME = 'vijay3247/restaurant-site'
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
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                        docker push ${IMAGE_NAME}:latest
                        docker logout
                    '''
                }
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                    docker stop restaurant || true
                    docker rm restaurant || true
                    docker run -d -p 3247:8080 --name restaurant ${IMAGE_NAME}:latest
                '''
            }
        }
    }
}

