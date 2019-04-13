:start
REM Install Kali without an account. At username prompt simply press enter. This make your default account the root account.
bash -c "apt-get update && apt-get dist-upgrade -y"
bash -c "wget https://kali.sh/xfce4.sh"
bash -c "cat xfce4.sh"
bash -c "sh xfce4.sh -y"
bash -c "/etc/init.d/xrdp start"
bash -c "adduser --disabled-password --gecos '' toor"
bash -c "apt-get install kali-linux-all -y"
TIMEOUT /T 777 /NOBREAK
GOTO start