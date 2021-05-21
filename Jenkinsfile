pipeline{
    agent any
    stages {
        stage("build") {
            steps {
                echo 'building a maven image'
            }
        }
        stage("push") {
            steps {
                echo 'pushing the image to nexus'
            }
        }
    }
}
