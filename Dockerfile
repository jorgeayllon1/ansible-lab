FROM almalinux:9.2

RUN dnf -y install iproute

RUN dnf -y update
RUN dnf -y install epel-release
RUN dnf -y install ansible 

RUN dnf clean all

COPY . /ansible/

WORKDIR /ansible