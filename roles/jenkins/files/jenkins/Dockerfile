#FROM jenkins:latest
FROM jenkinsci/jenkins:latest

RUN /usr/local/bin/install-plugins.sh github-oauth workflow-aggregator ssh-slaves

COPY enableGitHubOAuth.groovy /usr/share/jenkins/ref/init.groovy.d/enableGitHubOAuth.groovy.override
COPY load-slavery-key.groovy /usr/share/jenkins/ref/init.groovy.d/load-slavery-key.groovy.override