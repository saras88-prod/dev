pipeline {
    agent any

    environment {
        DOCKER_DEV_REPO = 'saras88/dev'
        DOCKER_PROD_REPO = 'saras88/prod'
        DOCKER_CREDENTIALS_ID = 'dockerhub-creds'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("your-app:${env.BRANCH_NAME}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        if (env.BRANCH_NAME == 'dev') {
                            dockerImage.push("dev")
                        } else if (env.BRANCH_NAME == 'master') {
                            dockerImage.push("prod")
                        }
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
