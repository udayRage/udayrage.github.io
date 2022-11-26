echo "Installing R"
sudo apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common r-base build-essential


echo "Installing Julia"
wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.0-linux-x86_64.tar.gz
tar -xvzf julia-1.8.0-linux-x86_64.tar.gz
sudo cp -r julia-1.8.0 /opt/
sudo ln -s /opt/julia-1.8.0/bin/julia /usr/local/bin/julia

#Removing the old versions of Nodejs
sudo apt-get purge nodejs npm
sudo apt-get autoremove

# Adding Nodejs new repository
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

echo "Installing Nodejs"
sudo apt update && sudo apt upgrade -y
sudo apt install -y nodejs npm libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils
sudo ln -s /usr/bin/nodejs /usr/bin/node


echo "Installing Anaconda"

wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh   # TRY TO DOWNMLOAD LATEST VERSION
read -p "Press 'Enter', 'Yes,' 'Enter,'  and 'Yes' when asked" -n1 -s
sh Anaconda3-2021.05-Linux-x86_64.sh
