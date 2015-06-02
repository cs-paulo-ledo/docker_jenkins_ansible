FROM ubuntu:14.04
MAINTAINER  paulofledo@gmail.com

ENV REFRESHED_AT 2015-06-01
ENV ANSIBLE_WORKDIR /opt
ENV JENKINS_HOME /var/lib/jenkins
ENV JENKINS_PLUGINS $JENKINS_HOME/plugins

RUN apt-get update -qq
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:ansible/ansible 
RUN apt-get update -qq
RUN apt-get install -y ansible

# Copiar o diretorio com o playbook para dentro do container

WORKDIR $ANSIBLE_WORKDIR
ADD playbook_ansible $ANSIBLE_WORKDIR/

# Executar o playbook
WORKDIR $ANSIBLE_WORKDIR
RUN ansible-playbook -i hosts.yml site.yml -c local -vvv -t install_jenkins
RUN mkdir $JENKINS_PLUGINS
RUN ansible-playbook -i hosts.yml site.yml -c local -vvv -t install_plugins
RUN chown -R jenkins.jenkins $JENKINS_HOME 
EXPOSE 8080
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

