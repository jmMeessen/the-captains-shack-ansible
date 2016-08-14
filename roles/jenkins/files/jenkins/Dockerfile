FROM jenkins:alpine

# Will make a netowkr request. If file did not change, should not download it, but to be confirmed with officiel Docker documentation
ADD https://raw.githubusercontent.com/netrounds-fredrik/docker/master/install-plugins.sh /usr/local/bin/install-plugins.sh

# Enforce rights
USER root
RUN chmod 0755 /usr/local/bin/install-plugins.sh
USER jenkins

RUN /usr/local/bin/install-plugins.sh github-oauth workflow-aggregator

#RUN /usr/local/bin/install-plugins.sh \
#github-api:1.76 \
#structs:1.3 \
#workflow-step-api:2.3 \
#workflow-scm-step:2.2 \
#credentials:2.1.4 \
#junit:1.18 \
#script-security:1.21 \
#matrix-project:1.7.1 \
#windows-slaves:1.1 \
#ssh-credentials:1.12 \
#icon-shim:2.0.3 \
#matrix-auth:1.4 \
#antisamy-markup-formatter:1.5 \
#git-client:1.19.7 \
#scm-api:1.2 \
#mailer:1.17 \
#git:2.5.3 \
#github-oauth:0.24

COPY enableGitHubOAuth.groovy /usr/share/jenkins/ref/init.groovy.d/enableGitHubOAuth.groovy.override