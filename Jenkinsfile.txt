pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github-pat', url: 'https://api.github.com/users/still-breathing/ci_cd_with_jenkins.git'
            }
        }

        stage('Setup Python') {
            steps {
                sh 'python --version'
                sh 'pip install -r requirements.txt || echo "No requirements.txt found"'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest tests/ --maxfail=1 --disable-warnings -q'
            }
        }
    }

    post {
        success {
            echo '✅ All tests passed successfully!'
        }
        failure {
            echo '❌ Tests failed. Please check the logs.'
        }
    }
}
