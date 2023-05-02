@Library('jhc') _
pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: "${params.branchName}", credentialsId: 'github-tokens', url: 'https://github.com/Vikas4577/hr-api'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Tomcat Deploy - Dev') {
            steps {
                tomcatDeploy()
            }
        }
    }
    post {
  always {
   cleanWs()
  }
}
}
