FROM python:3.10.2-slim

# instalar o JRE - Java Runtime
RUN apt update && apt install -y --no-install-recommends \
                    default-jre \
                    git

# cria usuário python (criando a pasta home/python)
RUN useradd -ms /bin/bash python

USER python

WORKDIR /home/python/app

# adicionar o projeto no Path do Python
ENV PYTHONPATH=${PYTHONPATH}/home/python/app/src

# configurar a variavel de ambiente do Java
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# segura  a imagem para não morrer!
CMD ["tail", "-f", "/dev/null"]