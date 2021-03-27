pipeline {

  environment {
    registry = "codesarukiller/devops_class"
    registryCredential = 'jenkins_dockerhub'
    dockerImage = 'hw1'
    containerAppName = dockerImage + "_app"
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
        sh "docker stop $conatinerAppName"
        sh 'echo "Removing container $containerAppName"......'
        sh "docker rm -f $containerAppName"
        sh 'echo "Removing image $dockerImage"......'
        sh "docker rmi -f $dockerImage"
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

