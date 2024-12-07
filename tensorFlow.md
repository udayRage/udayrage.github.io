# Installing TensorFlow, TensorRT, and Other Machine Learning Libraries



## Setting up the Kernal

Installing mainline 

```bash
sudo add-apt-repository ppa:cappelikan/ppa
sudo apt update
sudo apt install mainline -y
sudo mainline install 6.2
```
Reboot the Server
```bash
sudo reboot
```
Remove any existing Nvidia installations
```bash
sudo apt install gcc
sudo apt-get remove --purge '^nvidia-.*'
sudo apt-get autoremove
```

## Disabling the default NVidia libraries
Open the file
```bash
sudo vi /etc/modprobe.d/blacklist-nvidia-nouveau.conf
```
Insert these lines
```bash
blacklist nouveau
options nouveau modeset=0
```
Save and exit. Regenerate the kernel initramfs.
```bash
sudo update-initramfs -u
```
Check the graphics card by executing the following command:
```bash
sudo lshw -C display
```
Your graphic cards should be shown in the output generated.

## Installing Nvidia CUDA libraries

1. Visit the following URL: [https://developer.nvidia.com/cuda-12-2-0-download-archive](https://developer.nvidia.com/cuda-12-2-0-download-archive)
2. Choose your configurations based on your Operating System. Please Choose X86 architecture. 
3. Nvidia will provide you a set of commands to execute. Please execute them one after another by copying and pasting them. __An example has been provided below:__
```bash
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb 
sudo cp /var/cuda-repo-ubuntu2204-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt update && sudo apt -y install cuda 
```

```bash
sudo reboot 
```
4. After rebooting the server, execute the following command:
```bash
nvidia-smi
```
You should now see the list of GPUs attached to your machine.

## Installing Nvidia cuDNN

1. Using your Nvidia account, visit the following URL: [https://developer.nvidia.com/rdp/cudnn-archive](https://developer.nvidia.com/rdp/cudnn-archive)
2. Download the local installer by choosing the latest version based on your operating system.
3. Execute the following commands:
```bash
wget -nc https://www.dropbox.com/scl/fi/ck7akyej5l0onopvmvecf/cudnn-local-repo-ubuntu2204-8.9.7.29_1.0-1_amd64.deb
```
```bash
sudo dpkg -i cudnn-local-repo-ubuntu2204-8.9.7.29_1.0-1_amd64.deb
sudo cp /var/cudnn-local-repo-ubuntu2204-8.9.7.29/cudnn-local-08A7D361-keyring.gpg /usr/share/keyrings/
sudo apt update && sudo apt install libcudnn8 libcudnn8-dev -y 
```

## Installation of NodeJS and NPM

 
    sudo apt-get install -y fuse lvm2 vim plocate curl openssh-server dirmngr gnupg apt-transport-https ca-certificates software-properties-common r-base build-essential libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils
  
    sudo  apt-get  install -y  wget texlive-xetex texlive-full texstudio texmaker texlive-latex-extra pandoc libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev python3-pip openssl libssl-dev build-essential gnupg2 vim bash-completion

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    
    
    NODE_MAJOR=22
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    
    
    sudo apt-get update
    sudo apt-get install nodejs -y


    node -v   
    npm -v

## Installing Julia

    wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.0-linux-x86_64.tar.gz
    tar -xvzf julia-1.8.0-linux-x86_64.tar.gz
    sudo cp -r julia-1.8.0 /opt/
    sudo ln -s /opt/julia-1.8.0/bin/julia /usr/local/bin/julia

    julia  #to enter into julia interface.
    exit   #to edit from julia

## Creation and login as a new sudo use`r (Optional)

```bash
sudo useradd -m -s /bin/bash -G sudo jupyter
```

```bash
sudo passwd jupyter
```

```bash
su - jupyter
```

## Setting a Virtual Environment using Conda

1. Download the latest version of Anaconda.
```bash
wget -nc https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh
```
2. Install the conda
```bash
bash Anaconda3-2024.10-1-Linux-x86_64.sh
```

- Press `Enter`
- Press `Spacebar` until you see `license terms`
- Type `Yes` and press `Enter`
- Press `Enter`
- Type `Yes` to install the path variable.

If you face any problem, type the following command:
```bash
eval "$(/home/jupyter/anaconda3/bin/conda shell.bash hook)"
```


3. Execute the below provided commands
```bash
source .bashrc
conda config --set auto_activate_base false 
 ```
4. Check the Python Version
```bash
python -V
```
5. Tensorflow GPU currently works better if your Python Version is 3.10. Thus, let us create virtual environment with Python 3.10
```bash
conda create --name jupyterHub python=3.12
 ```
6. Enter into that Virtual Environment
```bash
conda activate jupyterHub
```
7. Execute the following commands
```bash
pip install --upgrade pip
conda config --add channels conda-forge
conda config --add channels microsoft
```

## Installing and Setting Up TensorFlow GPU

1. Install tensorflow-gpu
```bash
conda install anaconda::tensorflow-gpu -y
```
2. Check the correctness of installed TensorFlow-gpu by executing the following commands:

   - Approach-1

   ```bash
   python3
   ```
   ```PYTHON
   import tensorflow as tf
   ``` 
   __Note:__ If you see any error, such as core dump, then there is a problem.

   - Approach-2
   
   ```bash
   python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
   ```
         
   You should be the following output

   ```output
   [PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU'), PhysicalDevice(name='/physical_device:GPU:1', device_type='GPU')]
   ```
   
2. Install Keras, PyTorch, and other libraries
```bash
conda install conda-forge::keras -y
conda install -c conda-forge scikit-learn -y
conda install -c rapidsai -c conda-forge -c nvidia dask-cuda cuda-version=12.3 -y
conda install pandas pyarrow -c conda-forge -y
conda install dask distributed -c conda-forge -y
conda install conda-forge::s3fs -y
conda install conda-forge::pytorch-gpu -y
conda install cmake zeromq cppzmq OpenSSL xtl nlohmann_json -c conda-forge -y
```

```bash
python -m pip install torch torch-tensorrt tensorrt pami

pip install matlab_kernels
```

## Installation of JupterHub
Execute the following commands by staying the `jupyterHub` environment created in the previous steps. 

```bash
conda activate jupyterHub
```
```bash
pip install --upgrade pip
conda install -c conda-forge jupyterlab jupyterhub -y
conda install notebook sidecar playwright -y

conda install -n base -c conda-forge jupyterlab_widgets
conda install conda-forge::configurable-http-proxy -y
#pip install configurable-http-proxy -y

conda install -c conda-forge ipywidgets -y
#pip install ipywidgets

pip install jupyter_contrib_nbextensions
#conda install -c conda-forge jupyter_contrib_nbextensions

conda install -c conda-forge jupyterlab-spellchecker -y
conda install xeus-python notebook -c conda-forge -y
```

```bash
playwright install-deps
playwright install
```

```bash

pip install tensorflow[and-cuda]

pip install autots auto-ts darts etna[all] greykite kats -y
```

## Setting up the JupyterHub
Come to the home directory.
```bash
cd ~
```
Setup symbolic links to jupyterHub and jupyterNotebook to access them directly from the terminal.
```bash
sudo ln -s ~/anaconda3/envs/jupyterHub/bin/jupyter /usr/bin/jupyter
sudo ln -s ~/anaconda3/envs/jupyterHub/bin/jupyterhub /usr/bin/jupyterhub
```
Create the jupyterHub default configuration file
```bash
jupyterhub --generate-config -f ~/jupyterhub_config.py
```
Open the jupyterHub configuration file
```bash
vi ~/jupyterhub_config.py
```
Add the following text in the file
```bash
c.Authenticator.allow_all = True
c.PAMAuthenticator.open_sessions = False
c.JupyterHub.bind_url = 'http://163.143.87.224:80'   #REPLACE the IPADDRESS
c.Spawner.cmd = ['/home/jupyter/anaconda3/envs/jupyterHub/bin/jupyterhub-singleuser']
c.JupyterHub.hub_bind_url = 'http://127.0.0.1:8085'
c.JupyterHub.hub_port = 8082
c.ConfigurableHTTPProxy.command = '/home/jupyter/anaconda3/envs/jupyterHub/bin/configurable-http-proxy'  #'/usr/local/bin/configurable-http-proxy'
c.Spawner.cmd=["/home/jupyter/anaconda3/envs/jupyterHub/bin/jupyter-labhub"]
```
__Note:__ Change the _ipaddress_ of the variable `c.JupyterHub.bind_url` 

Create a startup file that starts jupyterHub right after the server starts
```bash
sudo vi /usr/lib/systemd/system/jupyterhub.service
```
Copy and Paste the below-provided text:
```bash
[Unit]
Description=JupyterHub

[Service]
Type=simple
PIDFile=/run/jupyterhub.pid
# Step 1 and Step 2 details are here..
# ------------------------------------
ExecStart=jupyterhub -f /home/jupyter/jupyterhub_config.py
#User=root
#Group=root
#WorkingDirectory=/home/jupter
Restart=always
RestartSec=10
#KillMode=mixed

[Install]
WantedBy=multi-user.target
```
Save and exit.

Execute the below commands on the terminal
```bash
sudo systemctl enable jupyterhub.service
sudo systemctl daemon-reload
sudo systemctl restart jupyterhub.service
```
Change the home directory permissions
```bash
sudo chmod -R 755 .
```
Reboot the system
```bash
sudo reboot
```