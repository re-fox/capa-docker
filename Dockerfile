FROM ubuntu:bionic

RUN apt-get update \
 && apt-get install -y python-pip \
                       git 

RUN git config --global url."https://github.com/".insteadOf git@github.com: \ 
 && git config --global url."https://".insteadOf git://

RUN git clone --recurse-submodules https://github.com/fireeye/capa.git /opt/capa

RUN pip install six --upgrade

RUN pip install -e /opt/capa

ENTRYPOINT ["capa"]
