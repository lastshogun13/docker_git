# docker_git

How to use

### host os (Windows only)
```
echo 'machine github.com
login ******
password ******
' > ~/.netrc
```

login: github account name

password: github password

### How to launch
```
cd ~/git/docker_git
docker-compose build
docker-compose run git "YourName" "YourEmail"
```
