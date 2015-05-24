Jenkins, Ansible e Docker
==========================


Descrição
------------------
A ideia he utilizar o Ansible para centralizar a configuracao dos containers, deixando o Dockerfile apenas para instalar as dependências do Ansible e qualquer outro tarefa que seja mais interessante esse arquivo realizar.

E para isso dividi a tarefa em etapas facilitando assim o desenvolvimento da solução, segue abaixo


**1. Subir um container com o Jenkins instalado pelo Ansible**
 a. Construir uma imagem com o Ansible instalado 
     - Adicionando o playbook no Dockerfile
     - Adicionando o playbook como um volume no container  
 
 b. Instalar o Jenkins de dentro do container através do Ansible
     - Após validar a instalação e operação do Jenkins de dentro do container, iremos fazer esse processo no momento da build

 c. Inserir a execução do playbook na build, dessa forma o container deve subir com o Ansible instalado e Jenkins já rodando com sua configuracao default


**OBS>>>** Terminando essa etapa teremos uma imagem que prover um container rodando o jenkins .Sendo  o mesmo resultado que hoje temos utilizando apenas o playbook, faltando apenas a instalação dos plugins.
Agora


**2. Configurando o jenkins: instalando os plugins**
 a. Entrar no container fazer dar certo a tasks de instalação de plugins
    - Instalar os plugins com o curl
    - Instalar os plugins com o jenkins-cli

 b. Build e contruir uma imagem completa, que suba o ansible e jenkins com plugins

**3. Aqui iremos preparar a lista de plugins sem suas dependencias para usarmos o jenkns cli**

