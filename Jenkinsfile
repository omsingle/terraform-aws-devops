pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-ssh',
                    url: 'git@github.com:omsingle/terraform-aws-devops.git'
            }
        }

        stage('Debug Environment') {
    steps {
        sh '''
            echo "=== PIPELINE CONTAINER ==="
            hostname
            echo "PID=$$"
            echo "PPID=$PPID"

            echo "Sleeping for 120 seconds..."
            sleep 120
        '''
    }
}

        stage('Terraform Format') {
            steps {
                sh 'terraform fmt -check -recursive'
            }
        }

        stage('Terraform Init') {
    steps {
        withCredentials([
            usernamePassword(
                credentialsId: 'aws-terraform',
                usernameVariable: 'AWS_ACCESS_KEY_ID',
                passwordVariable: 'AWS_SECRET_ACCESS_KEY'
            )
        ]) {
            sh 'terraform init'
        }
    }
}

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'aws-terraform',
                        usernameVariable: 'AWS_ACCESS_KEY_ID',
                        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    )
                ]) {
                    sh 'terraform plan'
                }
            }
        }
    }
}