# [Main Menu](index.html)

# Installing Ubuntu Server Operating System

## 1) Assigning a fixed IP-Address

    sudo cd /etc/netplan
    sudo vi  01-network-manager-all.yaml

Type the following in the file

    # Let NetworkManager manage all devices on this system. Use Tab Space to maintain parent and child.

    network:
        version: 2
        renderer: NetworkManager
        ethernets:
            eno1:
                dhcp4: false
                addresses:
                    - 163.143.87.200/24
                routes:
                    - to: default
                    via: 163.143.87.1
                nameservers:
                    addresses: [163.143.1.100]

Save the file and exit. Next, type the following command on the terminal:
    
    sudo netplan apply

## 2) Installation of Remote Desktop

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
    sudo ufw allow ssh
    sudo ufw enable
    sudo systemctl status ufw.service
    sudo ufw allow 3389/tcp
    sudo ufw reload

## 3) Prevent Network Idle Sleep

[Click here for the detailed instructions](https://ubuntu-mate.community/t/stop-network-disconnecting-in-ubuntu/829)

    sudo vi /etc/avahi/avahi-daemon.conf
    # Update  domain-name=local  to domain-name=.alocal
    # Save the file and exit

    sudo vi /etc/default/avahi-daemon
    # Update AVAHI_DAEMON_DETECT_LOCAL=1 to AVAHI_DAEMON_DETECT_LOCAL=0
    # Save the file and exit

    sudo systemctl disable systemd-networkd-wait-online.service
    sudo systemctl mask systemd-networkd-wait-online.service
    sudo reboot  #NOT NECESSARY IF YOU ARE DOING THE NEXT STEP IMMEDIATELY

## 4) Prevent remote network disconnection during idle

    sudo apt install wget openssh-server -y
    wget https://udayrage.github.io/scripts/networkSleepPrevent.sh
    sh networkSleepPrevent.sh

If the above command does not work, then execute the below:

    sudo vi /etc/ssh/sshd_config

Add the below lines

    ClientAliveInterval 600
    TCPKeepAlive yes
    ClientAliveCountMax 10

Save the file and restart the server to take effect

    sudo /etc/init.d/ssh restart

## 5) Installation of GUI, Anti-virus, OpenSSH, Tex, CURL and Other Python Libraries

    wget https://udayrage.github.io/scripts/antiVirusOpenSSLTex.sh
    sh antiVirusOpenSSLTex.sh


The below steps can be avoided if you execute the above code.

### i. Installation of GUI

   [Click here for the detailed instructions](https://phoenixnap.com/kb/how-to-install-a-gui-on-ubuntu) 

    sudo  apt-get  update && sudo  apt-get  upgrade 
    sudo  apt-get  install -y  tasksel 
    sudo  apt-get  install  -y lightdm 
    sudo  tasksel # Choose Ubuntu Desktop in the options and press OK
    sudo  reboot 

### ii. Installation of Anti-virus

  [Click here for the detailed instructions](https://linuxhint.com/install_clamav_ubuntu/#:~:text=Installing%20ClamAV.%20In%20order%20to%20install%20ClamAV%20on,install%20ClamAV.%20ubuntu%40ubuntu%3A~%24%20sudo%20apt-get%20install%20clamav%20clamav-daemon.)

    sudo apt-get install -y clamav clamav-daemon mailutils
    sudo systemctl stop clamav-freshclam
    sudo freshclam
    # Choose noConfiguration option when asked.
    sudo apt-get install -y  clamtk
    sudo systemctl start clamav-freshclam
    sudo systemctl enable clamav-freshclam
    sudo systemctl status clamav-freshclam

### iii. Installation of openSSL and openSSH Server
[Click here for the detailed instructions](https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/)

    sudo apt install -y openssl libssl-dev build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev openssh-server 
    sudo systemctl status ssh
    sudo systemctl enable ssh
    sudo systemctl start ssh
    sudo ufw allow ssh
    sudo ufw enable
    sudo ufw reload
 



    
### iv. Installation of Tex, CURL, and Other Python Libraries.
[Click here for the detailed instructions](https://www.cyberciti.biz/faq/how-to-install-curl-command-on-a-ubuntu-linux/)

    sudo apt -y install texlive-xetex texlive-full texstudio texmaker texlive-latex-extra pandoc curl  libcurl4-openssl-dev  libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev python3-pip
    #python-dev 
    sudo pip install click
    sudo pip install mitmproxy

    
