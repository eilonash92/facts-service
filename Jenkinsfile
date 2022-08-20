pipeline {
    agent any
    environment {
        DOCKER_HUB_REPO = "eilonash92/facts-service"
        USER_NAME="eilonash92"
        CONTAINER_NAME = "facts-service"
    }
    stages {
        stage('Build') {
            steps {
                def newImage = docker.build "${DOCKER_HUB_REPO}:${env.BUILD_TAG}"
                newImage.push()
                //  Building new image
                //sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
                //sh 'docker image tag $DOCKER_HUB_REPO:latest $DOCKER_HUB_REPO:$BUILD_NUMBER'

                //  Pushing Image to Repository
                //sh 'docker push eilonash92/facts-service:$BUILD_NUMBER'
                //sh 'docker push eilonash92/facts-service:latest'
                    
                echo "Image built and pushed to repository"
                }
            }
        
        stage('Deploy') {
            steps {
                script{
                    echo "Lastest code has been deployed to the web application"
                }
            }
        }
        stage('Test Application') {
            steps {
                script{
                    sh "Testing application..."
                }
            }
        }
    }
}