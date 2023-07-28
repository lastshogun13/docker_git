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
| password  | github token         |

### prepare docker-compose (Linux or Mac)

```
mkdir ~/git
cd ~/git
curl --output docker-compose.yml https://raw.githubusercontent.com/lastshogun13/docker_git/master/docker-compose2.yml
```

### prepare docker-compose (Windows Power Shell)

```
mkdir ~/git
cd ~/git
Invoke-WebRequest -Uri https://raw.githubusercontent.com/lastshogun13/docker_git/master/docker-compose2.yml -outfile docker-compose.yml
```

fix file `docker-compose.yml`.
`$HOME` -> `/c/Users/cmth`

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
docker build . -t lastshogun13/docker_git:0.0.25
docker build . -t lastshogun13/docker_git:latest
docker login
docker push lastshogun13/docker_git:0.0.25
docker push lastshogun13/docker_git:latest
```
