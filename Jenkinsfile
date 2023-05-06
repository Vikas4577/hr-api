@Library('jhc') _

pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            when{
                expression{
                params.branchName == "develop"
                }
            }
            steps {
                git branch: "${params.branchName}", credentialsId: 'github-token', url: 'https://github.com/Vikas4577/hr-api'
            }
        }

        stage('Maven Build') {
            when{
                expression{
                params.branchName == "develop"
                }
            }
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Tomcat Deploy - Dev') {
            steps {
                tomcatDeploy("ec2-user""172.31.17.183")
            }
        }
    }
    post {
   always {
   cleanWs()
  }
}
}
