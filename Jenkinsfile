pipeline {
    agent {
        node {
            label 'hello_Dear'
        }
    }

    stages {
        stage('Git Clone') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/abhinand-psq/jenkins.git'
            }
        }

        stage('check python exit') {
            steps {
                echo 'checking python exist'
                sh 'python3 --version'
            }
        }

        stage('Docker Build & Push') {
            steps {
                echo 'Building and pushing Docker image...'
                script { // ---> Opened script block
                    def dockerImageName = "abhinandp123/nodejs_jenkins:1.0"
                    
                    // Build the image
                    sh "docker build -t ${dockerImageName} ."
                    
                    // Authenticate and push
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials-id', 
                                                      usernameVariable: 'DOCKER_USER', 
                                                      passwordVariable: 'DOCKER_PASS')]) {
                        
                        // Using single quotes avoids shell escaping headaches with $DOCKER_PASS
                        sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                        
                        sh "docker push ${dockerImageName}"
                        
                        sh "docker logout"
                    }
                } // ---> Added missing closing brace for script block
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed. Check the logs.'
        }
    }
}