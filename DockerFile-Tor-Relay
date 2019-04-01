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
RUN sed -i 's/#ORPort 9001/ORPort 9001/' /etc/tor/torrc
RUN sed -i 's/#Nickname ididnteditheconfig/Nickname torrelay/' /etc/tor/torrc
EXPOSE 9001
ENTRYPOINT tor
