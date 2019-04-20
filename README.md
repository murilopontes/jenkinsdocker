# jenkinsdocker
After run go to:

[http://localhost:8080](http://localhost:8080)

# run jenkinsdocker

```sh
docker rm -f jenkinsci
docker run -d -p 8080:8080 -p 50000:50000  --name jenkinsci --restart always -v /var/run/docker.sock:/var/run/docker.sock  -v jenkins_home:/var/jenkins_home  murilopontes/jenkinsdocker
```

# checking if docker in docker is working

```sh
docker exec jenkinsci docker info
```
# read token to setup jenkins admin

```sh
docker exec jenkinsci cat /var/jenkins_home/secrets/initialAdminPassword
```

# manual push to docker hub

```sh
docker login --username=murilopontes
docker build -t murilopontes/jenkinsdocker .
docker push  murilopontes/jenkinsdocker
```
