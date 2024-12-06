# [Main Menu](index.html)

# Installing Ubuntu Server Operating System

## 1) Assigning a fixed IP-Address

```bash
sudo cd /etc/netplan
sudo nano  01-network-manager-all.yaml
```


Type the following in the file
```bash
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
```


Save the file and exit (press Control + X, and Y).
```bash
Control + D
```
Next, type the following command on the terminal:
```bash
sudo netplan apply
```
    

## 2) Setting up SSH so that we can do configurations easily
```bash
sudo apt install -y openssh-server
```
    
```bash
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh
```
    
```bash
sudo ufw enable
sudo ufw allow ssh    
sudo ufw reload
```


Now, login remotely into the server using ssh, and perform any of the below steps.

## 3) Installation of Remote Desktop

[Click here for the detailed instructions](https://tecadmin.net/how-to-install-xrdp-on-ubuntu-20-04/)
```bash
sudo apt install vim xrdp -y
sudo systemctl status xrdp
sudo usermod -a -G ssl-cert xrdp
```
    
```bash
sudo vi /etc/xrdp/startwm.sh
```

```bash
# Add below statements above the line test -x (line 32 around)    
Unset DBUS_SESSION_ADDRESS
Unset XDG_RUNTIME_DIR
# Save the file and exit by pressing `ESC` + `:` + `wq` + ENTER
``` 

```bash
sudo systemctl restart xrdp 
sudo systemctl status xrdp
sudo ufw status
sudo ufw default allow outgoing
sudo ufw default deny incoming 
sudo systemctl status ufw.service
sudo ufw allow 3389/tcp
sudo ufw reload
```

## 4) Prevent Network Idle Sleep

[Click here for the detailed instructions](https://ubuntu-mate.community/t/stop-network-disconnecting-in-ubuntu/829)

```bash
 sudo vi /etc/avahi/avahi-daemon.conf
```

```vi
# Update  domain-name=local  to domain-name=.alocal
 
#Save the file and exit
```

```bash
sudo vi /etc/default/avahi-daemon
```

```nano
# Update AVAHI_DAEMON_DETECT_LOCAL=1 to AVAHI_DAEMON_DETECT_LOCAL=0
# Save the file and exit
```

```bash
sudo systemctl disable systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service
```


## 5) Prevent remote network disconnection during idle

```bash
sudo apt install wget openssh-server -y 

sudo vi /etc/ssh/sshd_config
```

```vi
#Write the following text at the end of the file
ClientAliveInterval 600
TCPKeepAlive yes
ClientAliveCountMax 10
#Save the file and exit
```
 
```bash
sudo /etc/init.d/ssh restart
```    

## 6) Installation of GUI, Anti-virus, OpenSSH, Tex, CURL and Other Python Libraries

```bash
sudo  apt-get  update && sudo  apt-get  upgrade -y
```
```bash
sudo  apt-get  install -y  texlive-xetex texlive-full texstudio texmaker texlive-latex-extra pandoc curl  libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev python3-pip openssl libssl-dev build-essential libcurl4-gnutls-dev libxml2-dev tasksel lightdm clamav clamav-daemon mailutils gnupg2  vim bash-completion
```

```bash
pip install click mitmproxy
```
Setting up the antivirus
```bash
 sudo systemctl stop clamav-freshclam
``` 
__Note:__ Choose 'No Configuration' option. Press any key to continue... 

```bash
sudo freshclam -d -c 2
sudo systemctl start clamav-freshclam
sudo systemctl enable clamav-freshclam
sudo systemctl status clamav-freshclam
```
  
Setting up the tasksel GUI. Choose 'Ubuntu/Debian Desktop'. Press any key to continue... 
```bash
sudo  tasksel
```
    
```bash
sudo reboot
```

## 7) Allowing a program to utilize more memory
```bash
echo 1 | sudo tee /proc/sys/vm/overcommit_memory
```


## 8) Recording the history of each user's commands with a timestamp

```bash
sudo vi /etc/profile
```

```vi
export HISTTIMEFORMAT="%F %T " 
```
     