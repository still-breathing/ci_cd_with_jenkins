pipeline {
    agent any
    stages {
        stage('Setup Python') {
            steps {
                sh 'python3 --version'
                sh 'python3 -m pip install -r requirements.txt || echo "No requirements.txt found"'

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
