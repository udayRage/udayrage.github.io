# [Main Menu](index.html)

#Setting up Ubuntu Server Operating System

## Prevent Network Idle Sleep

[Click here for the detailed instructions](https://ubuntu-mate.community/t/stop-network-disconnecting-in-ubuntu/829)

    sudo vi /etc/avahi/avahi-daemon.conf
    # Update  word=local  to word=.alocal
    # Save the file and exit

    sudo vi /etc/default/avahi-daemon
    # Update AVAHI_DAEMON_DETECT_LOCAL=1 to AVAHI_DAEMON_DETECT_LOCAL=0
    # Save the file and exit

    sudo systemctl disable systemd-networkd-wait-online.service
    sudo systemctl mask systemd-networkd-wait-online.service
    sudo reboot  #NOT NECESSARY IF YOU ARE DOING THE NEXT STEP IMMEDIATELY

## Installation of GUI

   [Click here for the detailed instructions](https://phoenixnap.com/kb/how-to-install-a-gui-on-ubuntu) 

    sudo  apt-get  update && sudo  apt-get  upgrade 
    sudo  apt-get  install -y  tasksel 
    sudo  apt-get  install  -y lightdm 
    sudo  tasksel 
    sudo  reboot 

## Installation of Anti-virus

  [Click here for the detailed instructions](https://linuxhint.com/install_clamav_ubuntu/#:~:text=Installing%20ClamAV.%20In%20order%20to%20install%20ClamAV%20on,install%20ClamAV.%20ubuntu%40ubuntu%3A~%24%20sudo%20apt-get%20install%20clamav%20clamav-daemon.)

    sudo apt-get install clamav clamav-daemon mailutils -y
    sudo systemctl stop clamav-freshclam
    sudo freshclam
    sudo apt-get install clamtk
    sudo systemctl start clamav-freshclam
    sudo systemctl enable clamav-freshclam
    sudo systemctl status clamav-freshclam

## Installation of Remote Desktop

[Click here for the detailed instructions](https://tecadmin.net/how-to-install-xrdp-on-ubuntu-20-04/)

    sudo apt install xrdp -y 
    sudo systemctl status xrdp
    sudo usermod -a -G ssl-cert xrdp

    sudo vi /etc/xrdp/startwm.sh
    # Add below statements above the line test -x (line 32 around)    
        Unset DBUS_SESSION_ADDRESS
	    Unset XDG_RUNTIME_DIR
    # Save the file and exit

    sudo systemctl restart xrdp 
    sudo systemctl status xrdp
    sudo ufw status
    sudo ufw default allow outgoing
    sudo ufw default deny incoming
    cat /etc/default/ufw
    sudo ufw allow ssh
    sudo ufw enable
    sudo systemctl status ufw.service
    sudo ufw allow 3389/tcp
    sudo ufw reload

## Installation of Tex Live.

    sudo apt-get install texlive-xetex texlive-full texstudio texmaker texlive-latex-extra pandoc

## Installation of OpenSSL

    sudo apt-get install -y libssl-dev
    sudo apt-get install -y openssl
    sudo apt install build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev

## Installation of CURL and Python related libraries

[Click here for the detailed instructions](https://www.cyberciti.biz/faq/how-to-install-curl-command-on-a-ubuntu-linux/)

    sudo apt install -y curl
    sudo apt install -y libcurl4-openssl-dev
    sudo apt-get install -y python-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev
    sudo apt install -y python3-pip
    sudo apt-get install -y cdo nco      #necessary for geoAnalytics package.

    sudo pip install click
    sudo pip install mitmproxy

## Installation of NPM 14 and NodeJS

[Click here for the detailed instructions](https://www.freecodecamp.org/news/how-to-install-node-js-on-ubuntu-and-update-npm-to-the-latest-version/#:~:text=npm%20install%20-g%20npm%40latest.%20If%20you%20run%20into,of%20NodeJS%20and%20NPM%20on%20your%20Ubuntu%20machine.)

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    # Close the bash terminal and open the new terminal

    nvm install 14.4.0
    sudo apt update && sudo apt upgrade

    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs

## Installation of Anacoda

    sudo apt update && sudo apt upgrade
    apt-get install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
    
    wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh   # TRY TO DOWNMLOAD LATEST VERSION
    sh Anaconda3-2021.05-Linux-x86_64.sh 
    source .bashrc 
    conda config --set auto_activate_base false  # This command prevents the start-up of (base) environment by default

    