pipeline {
    agent {
        label 'docker-agent-alpine'
    }
    options {
        timeout(time: 20, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '3'))
    }
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build("my_app:latest")
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    docker.image("my_app:latest").inside {
                        sh 'ls /var'
                    }
                }
            }
        }
        stage('Push docker') {
            when {
                expression {
                    currentBuild.results == 'SUCCESS'
                }
                branch 'master'
            }
            steps {
                sh 'docker tag my_app:latest my_app:24.8'
                sh 'docker images'
            }
        }
        stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                echo "deploying something to somewhere"
            }
        }
    }
    post {
        always {
            sh 'docker system prune -f'
        }
    }
}
