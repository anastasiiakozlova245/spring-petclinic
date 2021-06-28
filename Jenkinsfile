pipeline{
    agent any
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
                withCredentials([
                    file(credentialsId: 'docker-credentials')
                ]) {
                    script {
                        def dockerImage = docker.build("anastasiiakozlova/petclinic:jenkins")
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
