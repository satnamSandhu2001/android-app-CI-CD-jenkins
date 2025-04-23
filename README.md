### Docker

```bash
# Build and start container in detached mode
docker compose up -d --build

# Get Jenkins initial admin password
docker exec jenkins_android_31 cat /var/jenkins_home/secrets/initialAdminPassword
```

### Jenkins

Pipeline script is located in `jenkinsfile` in the root directory. Remember to update the `git-ssh-token` and project URL before running.

### Requirements

1. System Requirements:
   - Minimum 8GB RAM for APK building
   - Docker and Docker Compose installed
