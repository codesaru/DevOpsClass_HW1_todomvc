pipeline {

  environment {
    registry = "codesarukiller/devops_class"
    registryCredential = 'jenkins_dockerhub'
    dockerImage = 'hw1'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
  //      git 'https://github.com/codesaru/DevOpsClass_HW1_todomvc'
          checkout scm
      }
    }
  }
}

