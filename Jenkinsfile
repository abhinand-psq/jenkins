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
                // Replace with your actual repository URL and credentials ID
                git branch: 'main',
                    url: 'https://github.com/abhinand-psq/jenkins.git'
            }
        }

        stage('check python exit') {
            steps {
                echo 'checking python exist'
                // Using sh for Linux/macOS. If using Windows agents, change 'sh' to 'bat'
                sh 'python3 --version'
            }
        }

        stage('Docker Build & Push') {
            steps {
                echo 'Building and pushing Docker image...'
                script {
                    // Replace with your Docker registry and image name
                    def dockerImageName = "abhinandp123/nodejs_jenkins:1.0"
                    // Build the image
                    sh "docker build -t ${dockerImageName} ."
                    
                    // Push the image (Ensure your agent is logged into the registry or use a credentials block)
                    sh "docker push ${dockerImageName}"
                }
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