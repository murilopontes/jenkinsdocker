FROM jenkins/jenkins:lts

#
COPY plugins.txt /
RUN /usr/local/bin/install-plugins.sh < /plugins.txt

#
USER root
RUN curl -fsSL https://get.docker.com -o get-docker.sh &&  sh get-docker.sh
RUN curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose
