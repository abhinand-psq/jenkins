pipeline {
    agent {
        label 'hello_dear'
    }

    // This block tells Jenkins to activate whenever GitHub pokes it
    triggers {
        githubPush()
    }

    stages {
        stage('Deploy to Kubernetes') {
            steps {
                // No manual git clone needed! Jenkins already downloaded your repo.
                sh '''
                echo "Deploying manifests..."
                kubectl apply -f deployment.yaml
                kubectl apply -f service.yaml

                echo "===== Nodes ====="
                kubectl get nodes

                echo "===== Pods ====="
                kubectl get pods -o wide

                echo "===== Services ====="
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