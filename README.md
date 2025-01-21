### Docker
 
 `docker compose up -t --build`

 Copy Jenkins first time password:`docker exec jenkins_android_31 cat /var/jenkins_home/secrets/initialAdminPassword`




### Jenkins

 Pipeline script is in `jenkinsfile` in same folder `update "git-ssh-token"`
 
 
 
### Notes

 1. Minimum 8GB ram is required for apk build
