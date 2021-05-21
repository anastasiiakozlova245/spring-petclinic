pipeline{
    agent any
    stages {
        stage("build") {
            steps {
                echo 'building a maven image'
                def dockerImage = docker.build("petclinic-snapshot:$env.BUILD_NUMBER")
            }
        }
        stage("push") {
            steps {
                echo 'pushing the image to nexus'
                docker.withRegistry('http://nexus:8081', 'nexus-credentials') {
                    dockerImage.push()
                }
            }
        }
    }
}
