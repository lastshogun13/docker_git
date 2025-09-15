FROM amazonlinux:2023.8.20250818.0

# basic tool & nodejs & python 3
RUN yum -y install git zip unzip tar gzip vim less file wget procps glibc-langpack-ja glibc-langpack-en \
                   make gcc automake ncurses-devel cronie rsync bind-utils \
                   nodejs22 \
                   python3 python3-pip python3-setuptools \
 && rm -rf /var/cache/yum/* \
 && yum clean all


# gh (github cli)
WORKDIR /usr/local/src/gh
RUN type -p yum-config-manager >/dev/null || yum -y install yum-utils \
 && yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo \
 && yum -y install gh \
 && rm -rf /usr/local/src/gh


# # git-flow
# #WORKDIR /usr/local/src/gitflow
# #RUN curl -OL https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh \
# && chmod +x gitflow-installer.sh \
# && ./gitflow-installer.sh
# && rm -rf /usr/local/src/gitflow


# tig
WORKDIR /usr/local/src/tig
RUN wget https://github.com/jonas/tig/releases/download/tig-2.5.12/tig-2.5.12.tar.gz \
 && tar xzf tig-2.5.12.tar.gz \
 && cd tig-2.5.12 \
 && ./autogen.sh \
 && ./configure --without-ncurses \
 && make prefix=/usr/local \
 && make install prefix=/usr/local \
 && rm -rf /usr/local/src/tig


# git secret
WORKDIR /usr/local/src/git-secret
RUN git clone https://github.com/awslabs/git-secrets.git \
 && cd git-secrets \
 && make install prefix=/usr/local \
 && rm -rf /usr/local/src/git-secret


# git-prompt.sh
WORKDIR /root
RUN wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh \
 && chmod a+x ~/.git-prompt.sh \
 && echo "source ~/.git-prompt.sh" >> ~/.bashrc


# git-completion.bash
WORKDIR /root
RUN wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash \
 && chmod a+x ~/.git-completion.bash \
 && echo "source ~/.git-completion.bash" >> ~/.bashrc


# bashrc
RUN echo 'export PS1="\[\033[1;36m\]docker_git \[\033[1;32m\]\w\[\033[1;35m\]\$(__git_ps1) \[\033[00m\]\n$ "' >> ~/.bashrc
RUN echo 'export LANG=en_US.UTF-8' >> ~/.bashrc
RUN echo 'export LC_CTYPE=ja_JP.UTF-8' >> ~/.bashrc
RUN echo 'export LC_MESSAGES=en_US.UTF-8' >> ~/.bashrc
RUN echo 'export LC_TIME=en_US.UTF-8' >> ~/.bashrc
RUN echo 'export LC_MONETARY=en_US.UTF-8' >> ~/.bashrc
RUN echo 'export LC_NUMERIC=en_US.UTF-8' >> ~/.bashrc
RUN echo 'alias ll="ls -al"' >> ~/.bashrc
RUN echo 'alias vi="vim"' >> ~/.bashrc
ENV EDITOR=vim
ENV TZ='Asia/Bangkok'


# git
RUN git secrets --register-aws --global
RUN git config --global core.autocrlf input


# finalize
WORKDIR /git

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
