pipeline{
    agent any
    environment {
        dockerImage = ''
        credentialsID = 'docker-credentials'
        registry = 'anastasiiakozlova/petclinic'
    }
    tools {
        maven 'maven3.8.1'
        jdk 'jdk8'
    }
    stages {
        stage("build a jar") {
            steps {
                echo 'building a jar file'
                script {
                    sh 'mvn clean package'
                }
            }
        }
        stage("build") {
            steps {
                echo 'building a docker image'
                script {
                    dockerImage = docker.build("anastasiiakozlova/petclinic:jenkins")
                }
            }
        }
        stage("push") {
            steps {
                script {
                    docker.withRegistry('', credentialsID) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage("run") {
            steps {
                script {
                    docker.image('anastasiiakozlova/petclinic:jenkins').run(['--network jenkins -p 8082:8080'])
                }
            }
        }
    }
}
