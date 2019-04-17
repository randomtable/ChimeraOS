apt-get update && apt-get dist-upgrade -y
wget https://kali.sh/xfce4.sh
cat xfce4.sh
sh xfce4.sh -y
/etc/init.d/xrdp start
adduser user
apt-get install armitage zaproxy tor -y && tor
