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
            echo "=== SHELL PROCESS ==="
            echo "PID=$$"
            echo "PPID=$PPID"
            echo "USER=$(whoami)"
            echo "HOSTNAME=$(hostname)"
            echo "ROOT=$(readlink /proc/$$/root)"
            echo "EXE=$(readlink /proc/$$/exe)"
            echo

            echo "=== FILESYSTEM ==="
            ls -ld /
            ls -ld /usr
            ls -ld /usr/bin
            ls -l /usr/bin/terraform || true
            echo

            echo "=== MOUNTS ==="
            cat /proc/$$/mountinfo | head -20
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
                sh 'terraform init'
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