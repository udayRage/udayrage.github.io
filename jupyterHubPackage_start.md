# [Main Menu](index.html)

## 1. Installation of CUDA

[URL of the Manual](https://medium.com/@chavezgm2012/installing-tensorflow-2-12-with-gpu-support-on-ubuntu-22-04-250429035e63)

        sudo apt update && sudo apt upgrade -y
        
        sudo vi /etc/modprobe.d/blacklist-nvidia-nouveau.conf

        #paste the below provided lines
        blacklist nouveau
        options nouveau modeset=0
        #save and exit

        sudo update-initramfs -u

        sudo lshw -C display
        # The above command must show the GPU devices mounted in a virtual machine


[Click here](https://developer.nvidia.com/cuda-downloads?target_os=Linux) to download the CUDA library

        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
        sudo dpkg -i cuda-keyring_1.1-1_all.deb
        sudo apt-get update
        sudo apt-get -y install cuda-toolkit-12-3

        sudo apt-get install -y cuda-drivers
        sudo apt-get -y install cuda

        # check the cuda version at /usr/local/cuda-<version>
          E.g., /usr/local/cuda-12.3
        echo 'export PATH=/usr/local/cuda-12.3/bin${PATH:+:${PATH}}' >> ~/.bashrc
        echo 'export LD_LIBRARY_PATH=/usr/local/cuda-12.3/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc

        source ~/.bashrc

        sudo reboot  #Restart the server.

        nvidia-smi
        #above command shows the GPUs that exists in the machine  

## 2. Installation of CUDNN

Download the latest version of CUDNN from NVidia website

        sudo dpkg -i cudnn-local-repo-ubuntu2204-8.9.7.29_1.0-1_amd64.deb
    
Check the last line displayed after executing above command and execute it.

        sudo cp /var/cudnn-local-repo-ubuntu2204-8.9.7.29/cudnn-local-08A7D361-keyring.gpg /usr/share/keyrings/

        sudo apt-get update
        sudo apt-get install libcudnn8

## 3. Installation of TensorFlow

        conda activate jupyterHub
        conda update --all

        conda install -c conda-forge tensorflow
        or
        conda install tensorflow=2.12.*=gpu_*

## 4. Installation of Scikit (sklearn)

        conda install -c conda-forge scikit-learn

## 5. Installation of Pytorch

        conda install pytorch::pytorch
        or
        conda install conda-forge::pytorch-gpu

## 6. Installation of PAMI

        pip install pami