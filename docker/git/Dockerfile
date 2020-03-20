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
RUN wget -q -O - --no-check-certificate https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh | bash
RUN rm -rf /usr/local/src/gitflow


# tig
WORKDIR /usr/local/src/tig
RUN wget https://github.com/jonas/tig/releases/download/tig-2.5.0/tig-2.5.0.tar.gz \
 && tar xzf tig-2.5.0.tar.gz

WORKDIR /usr/local/src/tig/tig-2.5.0
RUN ./autogen.sh \
 && ./configure --without-ncurses \
 && make prefix=/usr/local \
 && make install prefix=/usr/local

RUN rm -rf /usr/local/src/tig


# git secret
WORKDIR /usr/local/src/git-secret
RUN git clone https://github.com/awslabs/git-secrets.git

WORKDIR /usr/local/src/git-secret/git-secrets
RUN make install prefix=/usr/local

RUN rm -rf /usr/local/src/git-secret


# bashrc
RUN echo 'export PS1="[\u@"$(hostname -i)" \w]$ "' >> ~/.bashrc
RUN echo 'export PS1="[docker_git \w]$ "' >> ~/.bashrc
RUN echo 'alias ll="ls -al"' >> ~/.bashrc
RUN echo 'alias vi="vim"' >> ~/.bashrc
ENV EDITOR=vim


# git

RUN git secrets --register-aws --global

#RUN git config --global user.name "`echo $GIT_USER_NAME`"
#RUN git config --global user.email "\$GIT_USER_EMAIL"
#RUN git flow init -d -f

# finalize
WORKDIR /git

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
