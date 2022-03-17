FROM python:3.10.2-slim

# instalar o JRE - Java Runtime
# mais as ferramentas para Git - SSH e Zsh
RUN apt update && apt install -y --no-install-recommends \
                    default-jre \
                    git \
                    ssh-client \
                    zsh \
                    curl \
                    wget \
                    fonts-powerline


# cria usuário python (criando a pasta home/python)
RUN useradd -ms /bin/bash python

USER python

WORKDIR /home/python/app

# adicionar o projeto no Path do Python
ENV PYTHONPATH=${PYTHONPATH}/home/python/app/src

# configurar a variavel de ambiente do Java
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Default powerline10k theme, no plugins installed 
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" --\ 
                        -t https://github.com/romkatv/powerlevel10k.git \
                        -p git \
                        -p git-flow \
                        -p gitfast \
                        -p https://github.com/zdharma-continuum/fast-syntax-highlighting \
                        -p https://github.com/zsh-users/zsh-autosuggestions \
                        -a 'export TERM=xterm-256color'

# Colocar a Wizard de configuração do Powerleve10K do .zshrc
RUN echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc && \
    echo 'HISTFILE=/home/python/zsh/.zsh_history' >>  ~/.zshrc


# Mantem o container ativo
CMD ["tail", "-f", "/dev/null"]