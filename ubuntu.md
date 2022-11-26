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

## 5) Installation of GUI, Anti-virus, OpenSSH, Tex, CURL and Other Python Libraries

    wget https://udayrage.github.io/scripts/antiVirusOpenSSLTex.sh
    sh antiVirusOpenSSLTex.sh

## 6) Allowing a program to utilize more memory 

    echo 1 | sudo tee /proc/sys/vm/overcommit_memory

