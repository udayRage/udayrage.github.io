# [Main Menu](index.html)

## 1. Create and login as a new sudo user

    sudo useradd -m -s /bin/bash -G sudo jupyterHub
    sudo passwd jupyterHub

    su - jupyterHub

## 2. Installation of NodeJS, R, Julia, and Anaconda
   Execute the below commands

    wget https://udayrage.github.io/scripts/nodejs.sh
    sh nodejs.sh

## 3. Installation and setting up of jupyterHub and its plugins 
Execute the below commands

    wget https://udayrage.github.io/scripts/jupyterHub.sh
    sh jupyterHub.sh
 
## 4. Configuring jupyterHub
Open the ~/jupyterhub_config.py file and add the below lines at the beginning of the file

    c.PAMAuthenticator.open_sessions = False
    c.JupyterHub.bind_url = 'http://163.143.87.200:8000'   #REPLACE the IPADDRESS
    c.Spawner.cmd = ['/home/jupyterHub/anaconda3/envs/jupyterHub/bin/jupyterhub-singleuser']
    c.JupyterHub.hub_bind_url = 'http://127.0.0.1:8085'
    c.JupyterHub.hub_port = 8082
    c.ConfigurableHTTPProxy.command = '/home/jupyterHub/anaconda3/envs/jupyterHub/bin/configurable-http-proxy'  #'/usr/local/bin/configurable-http-proxy'
    c.Spawner.cmd=["/home/jupyterHub/anaconda3/envs/jupyterHub/bin/jupyter-labhub"]

Save the file and exit
    
## 5. Setting up R-environment
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
    

## 6. Setting up Julia
Restart Jupyterhub, login, and start the terminal. In the terminal, type the following commands:

    julia
    import Pkg
    Pkg.add("IJulia")


# Old version text. Refer only for backup purposes.



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
    

    