FROM jenkins/jenkins:lts

USER root

RUN apt update && apt-get upgrade -y
RUN apt install python3 python3-pip -y

RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -c stable -P inspec
RUN wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip; unzip terraform_0.13.5_linux_amd64.zip -d /bin; rm terraform_0.13.5_linux_amd64.zip

USER jenkins
