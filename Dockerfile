FROM registry.access.redhat.com/ubi8/ubi

RUN dnf -y install --disableplugin=subscription-manager python3-pip git

RUN git config --global url."https://github.com/".insteadOf git@github.com: \ 
 && git config --global url."https://".insteadOf git:// \
 && git clone --recurse-submodules https://github.com/fireeye/capa.git /opt/capa

RUN pip3 install six --upgrade \
 && pip3 install -e /opt/capa 

ENTRYPOINT ["capa"]
