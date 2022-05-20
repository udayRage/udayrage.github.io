# [Main Menu](index.html)

#Setting up geoAnalytics Package 

## Installation of necessary packages

    sudo apt-get install -y cdo nco      #necessary for geoAnalytics package.
    sudo add-apt-repository ppa:ubuntugis/ppa 
    sudo apt-get update
    sudo apt-get install gdal-bin
    sudo apt-get install libgdal-dev

Open .bashrc file and add the below two lines

    export CPLUS_INCLUDE_PATH=/usr/include/gdal
    export C_INCLUDE_PATH=/usr/include/gdal

Execute the following command on the terminal

    pip install GDAL