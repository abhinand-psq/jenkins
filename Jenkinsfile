pipeline {
    agent {
        label 'hello_dear'
    }

    stages {

        stage('Clone Repository') {
            steps {
                sh '''
                git clone https://github.com/abhinand-psq/jenkins.git
                cd jenkins

                kubectl apply -f deployment.yaml
                kubectl apply -f service.yaml

                echo "===== Nodes ====="
                kubectl get nodes

                echo "===== Pods ====="
                kubectl get pods -o wide

                echo "===== Services ===== ffgfgf"
                kubectl get svc
                '''
            }
        }

    }

    post {
        success {
            echo 'Deployment Successful!'
        }

        failure {
            echo 'Deployment Failed!'
        }
    }
}