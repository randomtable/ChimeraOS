FROM ubuntu:rolling
RUN apt-get update && apt-get upgrade -y
RUN apt-get install sudo -y
RUN sudo apt-get install tor -y
RUN sed -i 's/#ORPort 9001/ORPort 9005/' /etc/tor/torrc
RUN sed -i 's/#Nickname ididnteditheconfig/Nickname torrelay/' /etc/tor/torrc
RUN sed -i 's/#ExitRelay 0/ExitRelay 0/' /etc/tor/torrc
EXPOSE 9005
ENTRYPOINT tor