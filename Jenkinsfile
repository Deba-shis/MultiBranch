pipeline{
    agent any
    environment{
        PATH = "$PATH:/opt/apache-maven-3.9.6/bin"
    }
    stages{
        stage('Get Code'){
            steps{
                git branch: 'main', url: 'https://github.com/Deba-shis/MultiBranch.git'
            }
        }
        stage('build the code'){
            steps{
                sh 'mvn clean package'
            }
        }
    }
}
