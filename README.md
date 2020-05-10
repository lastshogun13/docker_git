# docker_git

How to use

### prepare for host os (Windows only)
```
echo 'machine github.com
login ******
password ******
' > ~/.netrc
```

| key       | value                |
| --------- | -------------------- |
| login     | github account name  |
| password  | github password      |

### prepare docker-compose

```
mkdir ~/git
cd ~/git
curl --output docker-compose.yml https://raw.githubusercontent.com/lastshogun13/docker_git/master/docker-compose2.yml
```

### How to use (recommend)
```
cd ~/git
docker-compose run git "YourName" "YourEmail"
```

### Docker-compose build and run
```
cd ~/git/docker_git
docker-compose build
docker-compose run git "YourName" "YourEmail"
```

### Build command (Developer's memo)
```
cd ~/git/docker_git/docker/git
docker build . -t lastshogun13/docker_git:0.0.4
docker build . -t lastshogun13/docker_git:latest
docker login
docker push lastshogun13/docker_git:0.0.4
docker push lastshogun13/docker_git:latest
```
