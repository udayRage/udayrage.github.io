# [Main Menu](index.html)

# Installing Ubuntu Server Operating System

## 1) Assigning a fixed IP-Address

    sudo cd /etc/netplan
    sudo nano  01-network-manager-all.yaml

Type the following in the file

    # Let NetworkManager manage all devices on this system. 
    #Use Tab Space to maintain parent and child.

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

Save the file and exit (press Control + X, and Y). Next, type the following command on the terminal:
    
    sudo netplan apply

## 2) Setting up SSH so that we can do configurations easily

    sudo apt install -y openssh-server

    
    sudo systemctl enable ssh
    sudo systemctl start ssh
    sudo systemctl status ssh

    sudo ufw enable
    sudo ufw allow ssh    
    sudo ufw reload

    
Now, login remotely into the server using ssh, and perform any of the below steps.

## 3) Installation of Remote Desktop


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

## 4) Prevent Network Idle Sleep

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

## 5) Prevent remote network disconnection during idle

    sudo apt install wget openssh-server -y 
 
    sudo echo "ClientAliveInterval 600" >> /etc/ssh/sshd_config
    sudo echo "TCPKeepAlive yes" >> /etc/ssh/sshd_config
    sudo echo "ClientAliveCountMax 10" >> /etc/ssh/sshd_config
    
    sudo /etc/init.d/ssh restart
 

## 6) Installation of GUI, Anti-virus, OpenSSH, Tex, CURL and Other Python Libraries

    sudo  apt-get  update && sudo  apt-get  upgrade

    #Installing Tex, CURL, GUI, Anti-virus and OpenSSH libraries:
    sudo  apt-get  install -y  texlive-xetex texlive-full texstudio texmaker texlive-latex-extra pandoc curl  libcurl4-openssl-dev  libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev python3-pip openssl libssl-dev build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev tasksel lightdm clamav clamav-daemon mailutils gnupg2  vim bash-completion

    #Setting up Python Libraries
    sudo pip install click
    sudo pip install mitmproxy
    
    #Setting up anti-virus.
    sudo systemctl stop clamav-freshclam
    
    #Choose 'No Configuration' option. Press any key to continue... 
    sudo freshclam -d -c 2  #freshclam
    sudo systemctl start clamav-freshclam
    sudo systemctl enable clamav-freshclam
    sudo systemctl status clamav-freshclam
    
    #Setting up the tasksel GUI. Choose 'Ubuntu Desktop'. Press any key to continue... 
    sudo  tasksel
    
    #Basic libraries have been installed. Rebooting the server
    sudo reboot

## 7) Allowing a program to utilize more memory 

    echo 1 | sudo tee /proc/sys/vm/overcommit_memory

## 8) Recording the history of each user's commands with a timestamp

    vi /etc/profile
    export HISTTIMEFORMAT="%F %T " 
    #save and exit