# Installing TensorFlow, TensorRT, and Other Machine Learning Libraries



## Setting up the Kernal

Installing mainline 

```console
sudo add-apt-repository ppa:cappelikan/ppa
sudo apt update
sudo apt install mainline
mainline --install 6.2
```
Reboot the Server
```console
sudo reboot
```
Remove any existing Nvidia installations
```console
sudo apt install gcc
sudo apt-get remove --purge '^nvidia-.*'
sudo apt-get autoremove
```

## Disabling the default NVidia libraries
Open the file
```console
sudo vi /etc/modprobe.d/blacklist-nvidia-nouveau.conf
```
Insert these lines
```console
blacklist nouveau
options nouveau modeset=0
```
Save and exit. Regenerate the kernel initramfs.
```console
sudo update-initramfs -u
```
Check the graphics card by executing the following command:
```console
sudo lshw -C display
```
Your graphic cards should be shown in the output generated.

## Installing Nvidia CUDA libraries

1. Visit the following URL: [https://developer.nvidia.com/cuda-12-2-0-download-archive](https://developer.nvidia.com/cuda-12-2-0-download-archive)
2. Choose your configurations based on your Operating System. Please Choose X86 architecture. 
3. Nvidia will provide you a set of commands to execute. Please execute them one after another by copying and pasting them. __An example has been provided below:__
```console
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb 
sudo cp /var/cuda-repo-ubuntu2204-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt update
sudo apt -y install cuda 
sudo reboot 
```
4. After rebooting the server, execute the following command:
```console
nvidia-smi
```
You should now see the list of GPUs attached to your machine.

## Installing Nvidia cuDNN

1. Using your Nvidia account, visit the following URL: [https://developer.nvidia.com/rdp/cudnn-archive](https://developer.nvidia.com/rdp/cudnn-archive)
2. Download the local installer by choosing the latest version based on your operating system.
3. Execute the following commands:
```console
sudo dpkg -i cudnn-local-repo-ubuntu2204-8.9.7.29_1.0-1_amd64.deb
sudo apt-get update
sudo apt-get install libcudnn8 libcudnn8-dev 
```
## Setting a Virtual Environment using Conda

1. Download the latest version of Anaconda.
```console
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh
```
2. Install the conda
```console
bash Anaconda3-2024.10-1-Linux-x86_64.sh
```
 __Note:__ Accept the terms and conditions. When asked for Yes/No, type 'Yes'.

3. Execute the below provided commands
```console
 source .bashrc
 conda config --set auto_activate_base false 
 ```
4. Check the Python Version
```console
python -V
```
5. Tensorflow GPU currently works better if your Python Version is 3.10. Thus, let us create virtual environment with Python 3.10
```console
conda create --name jupyterHub python=3.10
 ```
6. Enter into that Virtual Environment
```console
conda activate jupyterHub
```
7. Execute the following commands
```console
pip install --upgrade pip
conda config --add channels conda-forge
conda config --add channels microsoft
```

## Installing and Setting Up TensorFlow GPU

1. Install tensorflow-gpu
```console
conda install anaconda::tensorflow-gpu
```
2. Check the correctness of installed TensorFlow-gpu by executing the following commands:

   - Approach-1

   ```console
   python3
   ```
   ```PYTHON
   import tensorflow as tf
   ``` 
   __Note:__ If you see any error, such as core dump, then there is a problem.

   - Approach-2
   
   ```console
   python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
   ```
         
   
2. Install Keras, PyTorch, and other libraries
```console
conda install conda-forge::keras -y
conda install -c conda-forge scikit-learn -y
conda install -c rapidsai -c conda-forge -c nvidia dask-cuda cuda-version=12.3 -y
conda install pandas pyarrow -c conda-forge -y
conda install dask distributed -c conda-forge -y
conda install conda-forge::s3fs -y
conda install conda-forge::pytorch-gpu
```

```console
python -m pip install torch torch-tensorrt tensorrt pami
```

## Installation of JupterHub
Execute the following commands by staying the `jupyterHub` environment created in the previous steps. 
```console
conda activate jupyterHub
pip install --upgrade pip
conda install -c conda-forge jupyterlab jupyterhub -y
conda install notebook -y
pip install configurable-http-proxy
pip install ipywidgets
pip install tensorflow[and-cuda]
conda install sidecar -y
conda install playwright -y
playwright install-deps
playwright install
pip install autots auto-ts darts etna[all] greykite kats
```

## Setting up the JupyterHub
Come to the home directory.
```console
cd ~
```
Setup symbolic links to jupyterHub and jupyterNotebook to access them directly from the terminal.
```console
sudo ln -s ~/anaconda3/envs/jupyterHub/bin/jupyter /usr/bin/jupyter
sudo ln -s ~/anaconda3/envs/jupyterHub/bin/jupyterhub /usr/bin/jupyterhub
```
Create the jupyterHub default configuration file
```console
jupyterhub --generate-config -f ~/jupyterhub_config.py
```
Open the jupyterHub configuration file
```console
vi ~/jupyterhub_config.py
```
Add the following text in the file
```console
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
```console
sudo vi /usr/lib/systemd/system/jupyterhub.service
```
Copy and Paste the below-provided text:
```console
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
```console
sudo systemctl enable jupyterhub.service
sudo systemctl daemon-reload
sudo systemctl restart jupyterhub.service
```
Change the home directory permissions
```console
sudo chmod -R 755 .
```
Reboot the system
```console
sudo reboot
```