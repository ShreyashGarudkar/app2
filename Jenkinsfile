pipeline {
    agent any
    // environment {}

    stages {
        stage('scm') {
            steps {
                echo 'already taken care by Jenkins'
            }
        }

        stage('prepare env'){
            steps{
                sh 'pip3 install -r requirement.txt '
            }
        }

        stage('test the application') {
            steps{
                sh 'pytest test_app.py'
            }
            
        }

        // stage('prepare the image') {}
    }
}