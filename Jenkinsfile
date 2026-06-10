pipeline {
    agent {
        label 'hello_Dear' // Tells Jenkins to run this entire pipeline on your new agent
    }
    
    stages {
        /** stage('git clone') {
            steps {
                git branch: 'main', url: 'https://github.com/abhinand-psq/jenkins.git'
            }
        } **/
        
        stage('check whp') {
            steps {
                sh 'ls'
            }
        }
        
       /**stage('docker run') {
            steps {
                // Building the docker image on the 'hello' agent machine
                sh 'docker build -t from_jenkins:1.0 .'
            }
        }**/
    }
}