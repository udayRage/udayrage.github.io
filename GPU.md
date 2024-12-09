# GPU server setup

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
conda create --name jupyterHub python=3.10 -y
 ```
6. Enter into that Virtual Environment
```bash
conda activate jupyterHub
```

## Installing Tensorflow, TensorRT, and other import DL-plugins

1. Add the necessary channels

```bash
pip install --upgrade pip
conda config --add channels conda-forge
conda config --add channels microsoft
```

2. Install tensorflow-gpu
```bash
conda install -n base conda-libmamba-solver -y
conda config --set solver libmamba
conda install anaconda::numpy -y
conda install anaconda::scipy -y
conda install conda-forge::cupy -y
conda install anaconda::tensorflow-gpu -y
```


3. Check the correctness of installed TensorFlow-gpu by executing the following commands:

   ```bash
   python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
   ```
   Output must contain the following last line
   
       [PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU'), PhysicalDevice(name='/physical_device:GPU:1', device_type='GPU')]
   
   If you do not see the above line, it means their may be an installation problem. Try to execute the below step
 
    ```bash
    pip install tensorflow[and-cuda]
   
    python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
    ```

## Installation of JupyterHub, JupyterLab, and Notebook

```bash
pip install --upgrade pip
conda install -c conda-forge jupyterlab jupyterhub -y
conda install notebook -y
```

## Installing important dependencies, kernels, and widgets of JupyterHub

```bash
conda install sidecar playwright -y

```

```bash
playwright install-deps
playwright install
```

```bash
conda install -c conda-forge jupyterlab_widgets -y
conda install conda-forge::configurable-http-proxy -y
conda install -c rapidsai-nightly -c conda-forge jupyterlab-nvdashboard -y
conda install -c conda-forge ipywidgets -y
conda install -c conda-forge jupyterlab-spellchecker -y
conda install conda-forge::jupyterlab-spreadsheet-editor -y
conda install -c conda-forge jupyterlab jupyterlab-git -y

conda install -c conda-forge python-kaleido -y
conda install conda-forge::jupyterlab-latex -y
conda install -c conda-forge jupyterlab-drawio -y

conda install bokeh -y
conda install -c plotly plotly=6.0.0rc0 -y
conda install -c plotly plotly-geo=1.0.0 -y

conda install -c conda-forge jupyter_contrib_nbextensions
```
```bash
sudo apt install -y qtcreator qtbase5-dev qt5-qmake cmake
```
```bash
conda install qtconsole -y
```

```bash
pip install pyqt5
```


```bash 
pip install aquirdturtle_collapsible_headings 

pip install tqdm jupyterlab-unfold
pip install jupyterlab-code-formatter 
pip install black isort
pip install lckr_jupyterlab_variableinspector
 

pip install jupyterlab_theme_solarized_dark

pip install pyqt5
conda install qtconsole -y

pip install colabcode
pip install autots auto-ts darts


#pip install autots auto-ts darts etna[all] greykite #kats
#error in kats setupfile. 

jupyter contrib nbextension install --user
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

#c.JupyterHub.ssl_key = '/path/to/my.key'
#c.JupyterHub.ssl_cert = '/path/to/my.cert'
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

## Setting up the cluster

```bash
pip install ipyparallel
ipcluster start
```