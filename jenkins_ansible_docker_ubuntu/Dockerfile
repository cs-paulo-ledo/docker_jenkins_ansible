FROM ubuntu:14.04
MAINTAINER  paulofledo@gmail.com

ENV REFRESHED_AT 2015-05-09
ENV ANSIBLE_WORKDIR /opt

RUN apt-get update -qq
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get update -qq
RUN apt-get install -y ansible

# Copiar o diretorio com o playbook para dentro do container

WORKDIR $ANSIBLE_WORKDIR
ADD playbook_ansible $ANSIBLE_WORKDIR/

# Executar o playbook
#WORKDIR $ANSIBLE_WORKDIR
#RUN ansible-playbook -i hosts.yml site.yml -c local

EXPOSE 8080
