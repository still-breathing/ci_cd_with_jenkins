This is for learning cicd with jenkins running locally

# Create a folder on your host to store Jenkins data
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\jenkins_home"

# Run Jenkins container with volume binding
docker run -d `
  --name jenkins `
  -p 8080:8080 `
  -p 50000:50000 `
  -v "$env:USERPROFILE\jenkins_home:/var/jenkins_home" `
  jenkins/jenkins:lts
