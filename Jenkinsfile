pipeline {
    agent any

    stages {
        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Tomcat Deploy - Dev') {
            steps {
                sshagent(['tomcat-dev']) {
                 sh "scp -o StrictHostKeyChecking=no target/hr-api.war ec2-user@172.31.17.183:/opt/tomcat9/webapps/"
                 sh "ssh ec2-user@172.31.17.183 /opt/tomcat9/bin/shutdown.sh"
                 sh "ssh ec2-user@172.31.17.183 /opt/tomcat9/bin/startup.sh"
                 }
            }
        }
    }
}