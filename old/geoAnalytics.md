# [Main Menu](index.html)

#Setting up geoAnalytics Package 

## Installation of necessary GDAL packages

Login into jupyter sudo-user and activate jupyterHub conda environment by executing the following command

    conda activate jupyterHub

In the jupyterHub conda environment, perform the below steps. 

    sudo apt-get update && sudo apt upgrade -y && sudo apt autoremove 
    sudo apt-get install -y cdo nco gdal-bin libgdal-dev
    
    

    python -m pip install --upgrade pip setuptools wheel
    python -m pip install --upgrade gdal
    #check whether the above commands install/upgrades gdal or not

    conda install -c conda-forge libgdal
    conda install -c conda-forge gdal
    conda install tiledb=2.2
    conda install poppler

    ogrinfo --version
    # the above command must give an output

    pip install geoAnalytics