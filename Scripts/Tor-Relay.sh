#!/bin/bash
echo "deb https://deb.torproject.org/torproject.org bionic main" >> /etc/apt/sources.list
echo "deb-src https://deb.torproject.org/torproject.org bionic main" >> /etc/apt/sources.list
sudo apt-get install gnupg -y
curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
apt update
apt install -y tor deb.torproject.org-keyring
sed -i 's/#ORPort 9001/ORPort 9001/' /etc/tor/torrc
sed -i 's/#Nickname ididnteditheconfig/Nickname torrelay/' /etc/tor/torrc
systemctl restart tor
