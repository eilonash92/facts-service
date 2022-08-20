pipeline {
    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
  containers:
  - name: docker
    image: docker:latest
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
  volumes:
    - name: docker-sock
      hostPath:
        path: /var/run/docker.sock
"""
        }
    }
    environment {
        DOCKER_HUB_REPO = "eilonash92/facts-service"
        USER_NAME="eilonash92"
        CONTAINER_NAME = "facts-service"
    }
    stages {
        stage('Build') {
            steps {
                //  Building image
                sh """docker build -t $DOCKER_HUB_REPO:$BUILD_NUMBER ."""
                //  Pushing Image to Dockerhub repository
                withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
                    sh """docker push $DOCKER_HUB_REPO:$BUILD_NUMBER"""
                }
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