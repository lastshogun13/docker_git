FROM amazonlinux:2018.03

RUN yum -y update \
 && rm -rf /var/cache/yum/* \
 && yum clean all

### set locale
RUN yum reinstall -y glibc-common \
 && rm -rf /var/cache/yum/* \
 && yum clean all
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

RUN yum -y install git zip unzip vim less file wget \
 && rm -rf /var/cache/yum/* \
 && yum clean all

RUN yum -y install make gcc automake ncurses-devel \
 && rm -rf /var/cache/yum/* \
 && yum clean all


# git-flow
WORKDIR /usr/local/src/gitflow
RUN wget -q -O - --no-check-certificate https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh | bash \
 && rm -rf /usr/local/src/gitflow


# tig
WORKDIR /usr/local/src/tig
RUN wget https://github.com/jonas/tig/releases/download/tig-2.5.0/tig-2.5.0.tar.gz \
 && tar xzf tig-2.5.0.tar.gz \
 && cd tig-2.5.0 \
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


# git-completion.bash
WORKDIR /root
RUN wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash \
 && chmod a+x ~/.git-completion.bash \
 && echo "source ~/.git-completion.bash" >> ~/.bashrc \
 && source ~/.bashrc


# git-prompt.sh
WORKDIR /root
RUN wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh \
 && chmod a+x ~/.git-prompt.sh \
 && echo "source ~/.git-prompt.sh" >> ~/.bashrc \
 && source ~/.bashrc


# bashrc
# RUN echo 'export PS1="[\u@"$(hostname -i)" \w]$ "' >> ~/.bashrc
# RUN echo 'export PS1="[docker_git \w]$ "' >> ~/.bashrc
RUN echo 'export PS1="\[\033[1;34m\]docker_git \[\033[0;33m\]\w\[\033[36m\]\$(__git_ps1) \[\033[0;00m\]\\]\n$ "' >> ~/.bashrc


RUN echo 'alias ll="ls -al"' >> ~/.bashrc
RUN echo 'alias vi="vim"' >> ~/.bashrc
ENV EDITOR=vim


# git

RUN git secrets --register-aws --global


# finalize
WORKDIR /git

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
