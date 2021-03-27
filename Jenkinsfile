pipeline {

  environment {
    registry = "codesarukiller/devops_class"
    registryCredential = 'jenkins_dockerhub'
    dockerImage = 'hw1'
    containerAppName = "${dockerImage}_app"
  }
  agent any
  stages {
    stage('Cloning repo') {
      steps {
          checkout scm
      }
    }
    stage('Cleaning up environment') {
      steps {
        sh 'echo "Stopping $containerAppName"......' 
        sh "docker ps -f name=$containerAppName -q | xargs --no-run-if-empty docker container stop"
        sh 'echo "Removing container $containerAppName"......'
        sh "docker container ls -a -fname=$containerAppName -q | xargs -r docker container rm"
        sh 'echo "Removing image $dockerImage"......'
        sh 'docker images -f "reference=$dockerImage" -q | xargs -r docker rmi'
      }
    }
    stage('Build Docker image') {
      steps {
        script {
          dockerImage = docker.build(registry+dockerImage)
        }
      }
    }
  }
}

