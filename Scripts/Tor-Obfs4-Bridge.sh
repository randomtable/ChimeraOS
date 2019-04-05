#!/bin/bash
echo "deb https://deb.torproject.org/torproject.org bionic main" >> /etc/apt/sources.list
echo "deb-src https://deb.torproject.org/torproject.org bionic main" >> /etc/apt/sources.list
echo "deb http://deb.torproject.org/torproject.org obfs4proxy main" >> /etc/apt/sources.list
sudo apt-get install gnupg -y
curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
apt update
apt install -y tor deb.torproject.org-keyring
sudo apt-get install obfs4proxy -y
echo "RunAsDaemon 1" >> /etc/tor/torrc
echo "ORPort 9002" >> /etc/tor/torrc
echo "BridgeRelay 1" >> /etc/tor/torrc
echo "ServerTransportPlugin obfs4 exec /usr/bin/obfs4proxy" >> /etc/tor/torrc
echo "ServerTransportListenAddr obfs4 0.0.0.0:9003" >> /etc/tor/torrc
echo "ExtORPort auto" >> /etc/tor/torrc
echo "ContactInfo torworld" >> /etc/tor/torrc
echo "Nickname torworld" >> /etc/tor/torrc
systemctl stop tor
