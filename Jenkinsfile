pipeline {
  agent {
    kubernetes {
      defaultContainer 'jnlp'
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
  - name: docker
    image: lachlanevenson/k8s-helm:v3.1.1
    command:
    - cat
    tty: true
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
        container('docker') {
          //  Building Image
          sh """docker build -t $DOCKER_HUB_REPO:$BUILD_NUMBER -t $DOCKER_HUB_REPO:latest ."""
          //  Pushing Image to Dockerhub Repository
          echo "Image built and pushed to repository"
          withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
                sh """docker push $DOCKER_HUB_REPO:$BUILD_NUMBER"""
          }
          withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
                sh """docker push $DOCKER_HUB_REPO:latest"""
          }
        }
      }
    }
    stage('Deploy') {
        steps {
            sh """helm upgrade --install facts-service ./helm"""
            echo "Deployed $CONTAINER_NAME succesfully to kubernetes"
        }
    }
  }
}