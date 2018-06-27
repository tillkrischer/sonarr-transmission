FROM ubuntu

RUN apt-get update
RUN apt-get install -y sudo

RUN apt-get install -y gnupg
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
RUN echo "deb http://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list

RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN apt-get update
RUN apt-get install -y nzbdrone
RUN apt-get install -y transmission-daemon

COPY settings.json /settings.json
COPY launch.sh /launch.sh

EXPOSE 8989
EXPOSE 9091
EXPOSE 52258
VOLUME /transmission
VOLUME /data
VOLUME /config

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
CMD bash launch.sh 
