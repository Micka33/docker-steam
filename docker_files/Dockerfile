FROM      phusion/baseimage
ENV       HOME /root
RUN       /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD       ["/sbin/my_init"]

# SteamCMD is a 32-bit binary, 32-bit libraries are required -- Seriously?
RUN       dpkg --add-architecture i386
RUN       apt-get -y update
RUN       apt-get -y install lib32gcc1 wget

WORKDIR   /etc/service/steamcmd

# Gets SteamCMD
RUN       (wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz) && \
          (tar -xzf steamcmd_linux.tar.gz) && (rm steamcmd_linux.tar.gz)

# Add configuration file
ADD        ./steamcmd.cmd /etc/service/steamcmd/steamcmd.cmd

# Install the server on startup
RUN       (echo "#!/bin/sh\ncd /etc/service/steamcmd\n./steamcmd.sh +runscript steamcmd.cmd\n" > /etc/rc.local)

# Creates server as a service
ADD        ./run_server.sh /etc/service/steamcmd/run
RUN       chmod +x ./run

# Cleans up APT when done.
RUN        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
