pipeline{
    agent any
    environment {
    dockerImage=''
    }
    stages {
        stage("build") {
            steps {
                echo 'building a maven image'
                script {
                dockerImage = docker.build("petclinic-snapshot:$env.BUILD_NUMBER")
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
