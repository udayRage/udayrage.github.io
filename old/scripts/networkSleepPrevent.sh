sudo apt install openssh-server -y

# shellcheck disable=SC2129
sudo echo "ClientAliveInterval 600" >> /etc/ssh/sshd_config
sudo echo "TCPKeepAlive yes" >> /etc/ssh/sshd_config
sudo echo "ClientAliveCountMax 10" >> /etc/ssh/sshd_config

sudo /etc/init.d/ssh restart