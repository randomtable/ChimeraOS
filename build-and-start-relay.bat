:start
DEL /F /Q /A "%~dp0image.txt"
DEL /F /Q /A "%~dp0container.txt"
docker system prune -a -f
docker build https://raw.githubusercontent.com/randomtable/ChimeraOS/master/DockerFile-Non-Exit-Relay --iidfile "%~dp0image.txt"
SET /P iid=<"%~dp0image.txt"
SET iid=%iid:sha256:=%
docker create %iid%
docker ps -l -q >> container.txt
SET /P ciid=<"%~dp0container.txt"
docker commit %ciid% alessandrofiori/tor-non-exit-relay:latest
docker login
docker push alessandrofiori/tor-non-exit-relay:latest
docker pull alessandrofiori/tor-non-exit-relay
docker create alessandrofiori/tor-non-exit-relay:latest
docker run -p 9002:9002 alessandrofiori/tor-non-exit-relay:latest
