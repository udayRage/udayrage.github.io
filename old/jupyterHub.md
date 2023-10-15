# [Main Menu](index.html)

## 1. Create and login as a new sudo user

    sudo useradd -m -s /bin/bash -G sudo jupyterHub
    sudo passwd jupyterHub

    su - jupyterHub

## 2. Installation of NodeJS, R, Julia, and Anaconda
Execute the below commands:

    wget https://udayrage.github.io/scripts/nodejs.sh
    sh nodejs.sh
    source .bashrc
    conda config --set auto_activate_base false  # This command prevents the start-up of (base) environment by default
    conda update -n base -c defaults conda -y  #updates the conda to the latest version

    conda create --name jupyterHub python=3.10 -y   #Creating conda environment
    conda activate jupyterHub #Activating jupyterHub environment


## 3. Installation and setting up of jupyterHub and its plugins 
Execute the below commands:

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
Execute the following command on the terminal:

    sudo R

Execute the following commands in the R-environment:
    
    install.packages('IRkernel')
    IRkernel::installspec(user = FALSE)     #As jupyterHub is installed in an Environment   
    install.packages("devtools")            #This package is not mandatory, but suggested

Press Control+D and press n 

    conda install -c r r-irkernel  -y    
    

## 6. Setting up Julia
Restart Jupyterhub, login, and start the terminal. In the terminal, type the following commands:

    julia
    import Pkg
    Pkg.add("IJulia")

 