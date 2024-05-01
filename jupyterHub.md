`# [Main Menu](index.html)`

## 1. Create and login as a new sudo user

    sudo useradd -m -s /bin/bash -G sudo jupyter
    sudo passwd jupyter

    su - jupyter


## 2. Installation of NodeJS and NPM

 
    sudo apt-get install -y lvm2 vim plocate curl openssh-server dirmngr gnupg apt-transport-https ca-certificates software-properties-common r-base build-essential libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils
  
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    
    
    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    
    
    sudo apt-get update
    sudo apt-get install nodejs -y


    node -v   
    npm -v

## 3. Installing Julia

    wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.0-linux-x86_64.tar.gz
    tar -xvzf julia-1.8.0-linux-x86_64.tar.gz
    sudo cp -r julia-1.8.0 /opt/
    sudo ln -s /opt/julia-1.8.0/bin/julia /usr/local/bin/Julia
    

    julia  #to enter into julia interface.
    exit   #to edit from julia

## 4. Installing Anaconda

    sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 -y

    sudo useradd -m -s /bin/bash -G sudo jupyter
    sudo passwd jupyter
    su - jupyter

    wget https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Linux-x86_64.sh

    bash Anaconda3-2023.07-2-Linux-x86_64.sh
    #Accept the terms and press Y button whenever asked.

    source ~/.bashrc
    conda config --set auto_activate_base false 

    #Check the default Python version in the operating system
    python3 -V

    conda create --name jupyterHub python=<specifyPythonVersionFoundAbove>
        #conda create --name jupyterHub python=3.10 (example)
    conda activate jupyterHub

## 5. Installing Jupyterlab, notebook, and JupyterHub using Conda

    sudo  apt-get  install -y  wget texlive-xetex texlive-full texstudio texmaker texlive-latex-extra pandoc libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev python3-pip openssl libssl-dev build-essential gnupg2 vim bash-completion

    pip install --upgrade pip
    conda install -c conda-forge jupyterlab jupyterhub -y
    conda install notebook -y

    pip install configurable-http-proxy #sudo npm install -g configurable-http-proxy (for backup)
        
## 6. Installing Pandoc and playwright for chromium

    sudo apt-get install pandoc

    conda config --add channels conda-forge
    conda config --add channels microsoft
    conda install playwright -y
    playwright install  #playwright install chromium (backup command)

## 7. Creating configuration file for jupyter notebook

    jupyterhub --generate-config -f ~/jupyterhub_config.py

    sudo ln -s ~/anaconda3/envs/jupyterHub/bin/jupyter /usr/bin/jupyter

    vi jupyterhub_config.py

Add the below provided lines. Change the ipaddress of the machine.

    c.PAMAuthenticator.open_sessions = False
    c.JupyterHub.bind_url = 'http://163.143.87.224:8000'   #REPLACE the IPADDRESS
    c.Spawner.cmd = ['/home/jupyter/anaconda3/envs/jupyterHub/bin/jupyterhub-singleuser']
    c.JupyterHub.hub_bind_url = 'http://127.0.0.1:8085'
    c.JupyterHub.hub_port = 8082
    c.ConfigurableHTTPProxy.command = '/home/jupyter/anaconda3/envs/jupyterHub/bin/configurable-http-proxy'  #'/usr/local/bin/configurable-http-proxy'
    c.Spawner.cmd=["/home/jupyter/anaconda3/envs/jupyterHub/bin/jupyter-labhub"]


Save the above file and exit.

Open the ports:

    sudo ufw allow 8000/tcp
    sudo ufw reload

## 8. Checking the jupyterHub server

    sudo chmod -R 755 .

    sudo ls #enter the password

    sudo ./anaconda3/envs/jupyterHub/bin/jupyterhub -f ./jupyterhub_config.py
    
Check whether server is working properly by accessing the jupyterHub in browser. If everything is working properly, close the jupyterHub program to install additional plugins.


## 9. Installing Plugins

    pip install nbconvert pyppeteer
    pyppeteer-install
    pip install nbconvert[webpdf]

    #Check whether anyone of the below command is working or not.
    conda install -c conda-forge nbconvert-webpdf
    conda install -c "conda-forge/label/broken" nbconvert-webpdf
    conda install -c conda-forge nbconvert-webpdf


## 10. Setting up R-environment
Execute the following command on the terminal:

    sudo R

Execute the following commands in the R-environment:
    
    install.packages('IRkernel')
    IRkernel::installspec(user = FALSE)     #As jupyterHub is installed in an Environment   
    install.packages("devtools")            #This package is not mandatory, but suggested

Press Control+D and press n 

    conda install -c r r-irkernel  -y    
    

## 11. Setting up Julia
Restart Jupyterhub, login, and start the terminal. In the terminal, type the following commands:

    julia
    import Pkg
    Pkg.add("IJulia")

## 12. Installing Pytorch

    su - jupyter
    conda activate jupyterHub
    
    #CPU version
    pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu --user

    #GPU version
    pip3 install torch torchvision torchaudio
    




    

    
    


    