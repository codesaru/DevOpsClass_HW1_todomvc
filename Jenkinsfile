pipeline {

  environment {
    dockerHubUser = "codesarukiller"
    dockerRepo = "devops_hw1"
    registry = "${dockerHubUser}/${dockerRepo}"
    registryCredential = 'jenkins_dockerhub'
    dockerImage = ''
    containerAppName = "${dockerRepo}_app"
  }
  agent any
  stages {
/*    stage('Cloning repo') {
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
        sh 'echo "Removing image $registry"......'
        sh 'docker images -f "reference=$registry" -q | xargs -r docker rmi -f'
      }
    }
    stage('Build Docker image') {
      steps {
        script {
          dockerImage = docker.build(registry)
        }
      }
    }
    stage('Push to DockerHub') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
             dockerImage.push('latest')
             dockerImage.push("$BUILD_NUMBER")
          }
        }
      }
    }
    stage('Remove image') {
      steps {
        sh 'echo "Removing image $registry"......'
        sh 'docker images -f "reference=$registry" -q | xargs -r docker rmi -f'
      }
    }
*/
    stage('Pull from DockerHub and run locally') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            image = docker.image(registry)
            image.pull()
            image.run("-itd -p 3000:3000 --name $containerAppName")
          }
        }
      }
    }
  }
}

