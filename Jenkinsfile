pipeline{
    agent any
    environment {
        dockerImage=''
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "nexus:8081"
        NEXUS_REPOSITORY = "maven-snapshots"
        NEXUS_CREDENTIAL_ID = "nexus-credentials"
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
                    def dockerImage = docker.build("anastasiiakozlova/petclinic:${env.BUILD_NUMBER}")
                }
            }
        }
        stage("run") {
            steps {
                docker.image("anastasiiakozlova/petclinic:${env.BUILD_NUMBER}").run(["--network jenkins -p 8082:8080",
                    'java -jar *.jar'
                ])
            }
        }
        stage("push") {
            steps {
                echo 'pushing the docker image file to DockerHub'
                script {
                    dockerImage.push()
                }
            }
        }
    }
}
