# docker_git

How to use

### host os
```
echo 'machine github.com
login ******
password ******
' > ~/.netrc
```

login: github account name

password: github password

### prepare user.email user.name
```
cp docker/git/.env.example docker/git/.env
sed -i -e 's/^GIT_USER_NAME=$/GIT_USER_NAME=********/' docker/git/.env
sed -i -e 's/^GIT_USER_EMAIL=$/GIT_USER_EMAIL=********/' docker/git/.env
```
GIT_USER_NAME: your name

GIT_USER_EMAIL: your email

### How to launch
```
cd ~/git/docker_git
docker-compose build
docker-compose run git "YourName" "YourEmail"
```
