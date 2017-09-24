FROM jenkins/jenkins:lts

RUN /usr/local/bin/install-plugins.sh github-oauth workflow-aggregator ssh-slaves build-timeout pipeline-utility-steps blueocean

COPY enableGitHubOAuth.groovy /usr/share/jenkins/ref/init.groovy.d/enableGitHubOAuth.groovy.override
COPY load-slavery-key.groovy /usr/share/jenkins/ref/init.groovy.d/load-slavery-key.groovy.override
COPY system.groovy /usr/share/jenkins/ref/init.groovy.d/system.groovy.override
