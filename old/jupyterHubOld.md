# [Main Menu](index.html)

## Create and login as a new sudo user

    sudo useradd -m -s /bin/bash -G sudo jupyterHub
    sudo passwd jupyterHub

    su - jupyterHub

## Download the latest version of Nodejs, NPM, and Anaconda

    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    # If necessary, run below commands to remove old version of nodejs
        sudo apt-get purge nodejs npm
        sudo apt-get autoremove
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y nodejs npm libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget
    
    wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh   # TRY TO DOWNMLOAD LATEST VERSION
    sh Anaconda3-2021.05-Linux-x86_64.sh  # Press 'Enter', 'Yes,' 'Enter,'  and 'Yes' when asked
    source .bashrc 
    conda config --set auto_activate_base false  # This command prevents the start-up of (base) environment by default

    conda update -n base -c defaults conda -y  #updates the conda to the latest version

## Install JupyterHub on a Conda Environment

    conda create --name jupyterHub python=3.10 -y

    conda activate jupyterHub

    pip install --upgrade pip
    conda install -c conda-forge nodejs jupyterlab jupyterhub -y 
    conda install notebook -y

    sudo ln -s /usr/bin/nodejs /usr/bin/node    
    npm install -g configurable-http-proxy
    jupyterhub --generate-config -f ~/jupyterhub_config.py

Open the ~/jupyterhub_config.py file and add the below lines at the beginning of the file

    c.PAMAuthenticator.open_sessions = False
    c.JupyterHub.bind_url = 'http://163.143.87.200:8000'   #REPLACE the IPADDRESS
    c.Spawner.cmd = ['/home/jupyterHub/anaconda3/envs/jupyterHub/bin/jupyterhub-singleuser']
    c.JupyterHub.hub_bind_url = 'http://127.0.0.1:8085'
    c.JupyterHub.hub_port = 8082
    c.ConfigurableHTTPProxy.command = '/home/jupyterHub/anaconda3/envs/jupyterHub/bin/configurable-http-proxy'  #'/usr/local/bin/configurable-http-proxy'
    c.Spawner.cmd=["/home/jupyterHub/anaconda3/envs/jupyterHub/bin/jupyter-labhub"]

Save the file and exit
    
    chmod -R 755 ~
    sudo ufw allow 8000/tcp
    sudo ufw reload
    # START THE SERVER
    sudo ~/anaconda3/envs/jupyterHub/bin/jupyterhub -f ~/jupyterhub_config.py

Test whether JupyterHub is working properly or not. If there are any issues, then execute the below commands

* Check for node and npm versions by typing: node -v     and npm -v
* If the nodejs is not available then install it using command: sudo apt install -y nodejs
* conda deactivate jupyterHub
* conda activate jupyterHub
* sudo ~/anaconda3/envs/jupyterHub/bin/jupyterhub -f ~/jupyterhub_config.py

If the problems still persist, then perform the following:

    sudo ln -s /home/uday/anaconda3/envs/jupyterHub/bin/jupyter /usr/bin/jupyter
    sudo ln -s /home/uday/anaconda3/envs/jupyterHub/bin/jupyterhub /usr/bin/jupyterhub
    sudo ln -s /home/uday/anaconda3/envs/jupyterHub/bin/jupyterhub-singleuser /usr/bin/jupyterhub-singleuser

## Installing plugins (nbextension, and other plugins)

    sudo npm install puppeteer
    wget https://github.com/jgm/pandoc/releases/download/2.14.2/pandoc-2.14.2-1-amd64.deb
    sudo dpkg -i pandoc-2.14.2-1-amd64.deb
    conda install nbconvert       # try with sudo if the error persists
    pip install nbconvert[webpdf] # try with sudo if the error persists
    sudo jupyter nbconvert --to webpdf --allow-chromium-download Untitled2.ipynb   #Perform this command in jupyterHub

    conda install -c conda-forge jupyterlab-latex jupyter_contrib_nbextensions jupyter_nbextensions_configurator jupyterlab-drawio jupyterlab_execute_time ipympl ipywidgets
    
### Upgrading nodejs   
    node --version
    nodejs --version
    which node
    #If the version number is less than 12, then perform below steps by copying the location of the node command.
    mv  <copyLocation> <copyLocation.bak>
    #Create symbolic links
    ln -s /usr/bin/node <copyLocation>
    ln -s /user/bin/node <copyLocationFolder>nodejs


    jupyter labextension install jupyterlab-spreadsheet
    pip3 install jupyter-tabnine --user
    jupyter nbextension install --py jupyter_tabnine --user
    jupyter nbextension enable --py jupyter_tabnine --user
    jupyter serverextension enable --py jupyter_tabnine --user
    jupyter labextension install @jupyterlab/debugger
    pip3 install pami sklearn tensorflow sklearn-extensions pyspark oauthenticator RISE psycopg2-binary plotly==5.3.1 torch pycuda

    which jupyter
    #Copy the location of the jupyter. Create a virtual link
    ln -s <copyLocation> /usr/bin/jupyter

    pip install jupyter_contrib_nbextensions
    sudo jupyter contrib nbextension install 
    pip install jupyter_nbextensions_configurator
    sudo jupyter nbextensions_configurator enable --system

    conda install -c conda-forge jupyterlab-drawio

## Installing R and IRkernal

[Click here for the installation of R](https://linuxize.com/post/how-to-install-r-on-ubuntu-20-04/)

    sudo apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common
    sudo apt install -y  r-base build-essential

[Click here for setting up of IRKernal](https://developers.refinitiv.com/en/article-catalog/article/setup-jupyter-notebook-r )

Open R shell by typing the letter R on the terminal

    sudo R
Execute the following commands:
    
    install.packages('IRkernel')
    IRkernel::installspec(user = FALSE)     #As jupyterHub is installed in an Environment   
    #EXECUTE BELOW COMMAND IF ANY PROBLEM OCCURS
    sudo ln -s ~/anaconda3/bin/jupyter /usr/bin/jupyter                         
    install.packages("devtools")

    Press Control+D and press n 

    conda install -c r r-irkernel  -y

## Installing Julia

    wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.0-linux-x86_64.tar.gz
    tar -xvzf julia-1.8.0-linux-x86_64.tar.gz
    sudo cp -r julia-1.8.0 /opt/
    sudo ln -s /opt/julia-1.8.0/bin/julia /usr/local/bin/julia
    
    #Type julia to check whether it works or not
    julia
    #Press Control + D to exit

Restart Jupyterhub, login, and start the terminal. In the terminal, type the following commands:

    julia
    import Pkg
    Pkg.add("IJulia")
    

    