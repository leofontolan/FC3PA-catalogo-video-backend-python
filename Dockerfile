FROM python:3.10.2-slim

# cria usuário python (criando a pasta home/python)
RUN useradd -ms /bin/bash python

USER python

WORKDIR /home/python/app

# segura  a imagem para não morrer
CMD ["tail", "-f", "/dev/null"]