FROM jenkins/jenkins:lts
USER root
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY Pipeline.xml /usr/share/jenkins/ref/jobs/Pipeline/config.xml
COPY MultiBranchPipeline.xml /usr/share/jenkins/ref/jobs/MultiBranchPipeline/config.xml
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false