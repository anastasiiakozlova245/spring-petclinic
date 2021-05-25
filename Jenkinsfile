pipeline{
    agent any
    environment {
    jarFile=''
    }
    stages {
        stage("build") {
            steps {
                echo 'building a jar file'
                script {
                jarFile = docker.image('maven:3.8.1-openjdk-8').inside() {
                    sh 'mvn clean package --no-transfer-progress'
                }
                }
            }
        }
        stage("push") {
            steps {
                echo 'pushing the image to nexus'
                script {
                    docker.withRegistry('http://nexus:8081', 'nexus-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
