node ('master') {
    def app
    stage('cloning git') {
        checkout scm
    }
    stage('Build-and-Tag') {
        sh 'echo build and tag'
        app = docker.build("venmaum/expblock")
    }
    stage('Post-to-dockerhub') {
        docker.withRegistry('https://registry.hub.docker.com','Docker_credentials'){
            app.push("latest")
        }
    }
    stage('Pull-image-server') {
        sh "/usr/bin/docker-compose down"
        sh "/usr/bin/docker-compose up -d"
    }
}
