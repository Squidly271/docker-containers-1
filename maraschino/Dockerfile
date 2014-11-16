FROM phusion/baseimage:0.9.11
MAINTAINER smdion <smdion@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"
RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy python unrar wget

# Install Maraschino
RUN mkdir /opt/maraschino
RUN wget -P /tmp/ https://github.com/mrkipling/maraschino/archive/v0.3.0.tar.gz
RUN tar -C /opt/maraschino -xvf /tmp/v0.3.0.tar.gz --strip-components 1

#set config directory
VOLUME /config

#expose ports
EXPOSE 7000

# Add plex.sh to execute during container startup
RUN mkdir -p /etc/my_init.d
ADD plex.sh /etc/my_init.d/plex.sh
RUN chmod +x /etc/my_init.d/plex.sh

# Add nzbdrone.sh to execute during container startup
RUN mkdir -p /etc/my_init.d
ADD nzbdrone.sh /etc/my_init.d/nzbdrone.sh
RUN chmod +x /etc/my_init.d/nzbdrone.sh

# Add maraschino to runit
RUN mkdir /etc/service/maraschino
ADD maraschino.sh /etc/service/maraschino/run
RUN chmod +x /etc/service/maraschino/run