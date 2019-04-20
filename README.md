# jenkinsdocker

## Install docker in host machine

```sh
curl -fsSL https://get.docker.com -o get-docker.sh 
sudo sh get-docker.sh
```

## Add user to docker group
```sh
sudo usermod -aG docker $(whoami)
```
Is required logout and login again to take effect.

## Clone this repo
```sh
git clone https://github.com/murilopontes/jenkinsdocker.git
cd jenkinsdocker
```

## build and tag
```sh
docker build -t murilopontes/jenkinsdocker .
```
## run 

```sh
docker rm -f jenkinsci
docker run -d -p 8080:8080 -p 50000:50000  --name jenkinsci --restart always -v /var/run/docker.sock:/var/run/docker.sock  -v jenkins_home:/var/jenkins_home  murilopontes/jenkinsdocker
```

## make sure the docker in docker is working

```sh
docker exec jenkinsci docker info
```
## read token to setup Jenkins admin

```sh
docker exec jenkinsci cat /var/jenkins_home/secrets/initialAdminPassword
```
## complete setup

After run go to:

[http://localhost:8080](http://localhost:8080)

## manual push to docker hub

```sh
docker login --username=murilopontes
docker push  murilopontes/jenkinsdocker
```
