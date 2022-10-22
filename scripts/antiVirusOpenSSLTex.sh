sudo  apt-get  update && sudo  apt-get  upgrade

echo "Installing Tex, CURL, GUI, Anti-virus and OpenSSH libraries:"
sudo  apt-get  install -y  texlive-xetex texlive-full texstudio texmaker texlive-latex-extra pandoc curl  libcurl4-openssl-dev  libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev python3-pip openssl libssl-dev build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev openssh-server tasksel lightdm clamav clamav-daemon mailutils

echo "Setting up Python Libraries"
sudo pip install click
sudo pip install mitmproxy

echo "Setting up anti-virus."
sudo systemctl stop clamav-freshclam

read -p "Choose 'No Configuration' option. Press any key to continue... " -n1 -s
sudo freshclam -d -c 2  #freshclam
sudo systemctl start clamav-freshclam
sudo systemctl enable clamav-freshclam
sudo systemctl status clamav-freshclam



echo "Setting up SSH"
sudo systemctl status ssh
sudo systemctl enable ssh
sudo systemctl start ssh
sudo ufw allow ssh
sudo ufw enable
sudo ufw reload

read -p "Setting up the tasksel GUI. Choose 'Ubuntu Desktop'" -n1 -s
sudo  tasksel

echo "Basic libraries have been installed. Rebooting the server"
sudo reboot
