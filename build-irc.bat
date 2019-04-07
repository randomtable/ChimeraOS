:start
DEL /F /Q /A "%~dp0image.txt"
DEL /F /Q /A "%~dp0container.txt"
docker system prune -a -f
docker build https://raw.githubusercontent.com/randomtable/ChimeraOS/master/DockerFile-IRC-Server --iidfile "%~dp0image.txt"
SET /P iid=<"%~dp0image.txt"
SET iid=%iid:sha256:=%
docker create %iid%
docker ps -l -q >> container.txt
SET /P ciid=<"%~dp0container.txt"
docker commit %ciid% alessandrofiori/torworld-irc:latest
docker login
docker push alessandrofiori/torworld-irc:latest
TIMEOUT /T 777 /NOBREAK
GOTO start
