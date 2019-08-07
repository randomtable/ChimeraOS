FROM ubuntu:rolling
RUN apt-get update && apt-get upgrade -y
RUN apt-get install sudo -y
RUN echo "deb https://deb.torproject.org/torproject.org bionic main" >> /etc/apt/sources.list
RUN echo "deb-src https://deb.torproject.org/torproject.org bionic main" >> /etc/apt/sources.list
RUN sudo apt-get install curl -y
RUN sudo apt-get install gnupg -y
RUN curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
RUN apt update
RUN apt install -y tor deb.torproject.org-keyring
RUN echo "HiddenServiceDir /var/lib/tor/hidden_service/" >> /etc/tor/torrc
RUN echo "HiddenServicePort 9000 127.0.0.1:9000" >> /etc/tor/torrc
RUN echo "HiddenServiceVersion 3" >> /etc/tor/torrc
RUN sudo apt-get install software-properties-common -y
RUN sudo apt-get install inspircd -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN sudo apt-get install nodejs -y
RUN sudo apt-get install git -y
RUN sudo apt-get install yarn -y
RUN npm install --global --unsafe-perm thelounge
RUN tor --runasdaemon 1
RUN cat /var/lib/tor/hidden_service/hostname
ENTRYPOINT cat /var/lib/tor/hidden_service/hostname & thelounge start & inspircd start --nolog --runasroot & tor
