pipeline {
    agent any
    environment {
        // docker image name
        DOCKER_IMAGE_NAME="bakingbrain/python-test-app"

        // docker user name
        DOCKER_USER_NAME="bakingbrain"

        // docker user auth token
        DOCKER_AUTH_TOKEN=credentials('DOCKER_AUTH_TOKEN')
    }


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
                sh 'python3 -m pytest tests/test_app.py'
            }
            
        }
        stage('prepare docker image') {
            steps {
                sh 'docker image build -t ${DOCKER_IMAGE_NAME} .'
            }
        }

        stage('docker login') {
            steps {
                sh 'echo ${DOCKER_AUTH_TOKEN} | docker login -u ${DOCKER_USER_NAME} --password-stdin'
            }
        }
        stage('push docker image') {
            steps {
                sh 'docker image push ${DOCKER_IMAGE_NAME}'
            }
        }   
        stage('restart service') {
            steps {
                sh 'docker service update --force --image ${DOCKER_IMAGE_NAME} myservice' 
            }
        }
    }
}