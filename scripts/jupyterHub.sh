conda config --set auto_activate_base false  # This command prevents the start-up of (base) environment by default
conda update -n base -c defaults conda -y  #updates the conda to the latest version

conda create --name jupyterHub python=3.10 -y   #Creating conda environment
conda activate jupyterHub #Activating jupyterHub environment

echo "Installation of jupyterHub, jupyterLab, puppeteer, and configurable-http-proxy"
pip install --upgrade pip
conda install -c conda-forge jupyterlab jupyterhub -y  #nodejs
conda install notebook -y
npm install -g configurable-http-proxy
sudo npm install puppeteer


echo "Creating default configurable file"
jupyterhub --generate-config -f ~/jupyterhub_config.py
sudo ln -s ~/anaconda3/bin/jupyter /usr/bin/jupyter


echo "Installing jupyterHub plugins"
wget https://github.com/jgm/pandoc/releases/download/2.14.2/pandoc-2.14.2-1-amd64.deb
sudo dpkg -i pandoc-2.14.2-1-amd64.deb
conda install nbconvert       # try with sudo if the error persists
pip install nbconvert[webpdf] # try with sudo if the error persists


jupyter labextension install jupyterlab-spreadsheet
pip3 install jupyter-tabnine --user
jupyter nbextension install --py jupyter_tabnine --user
jupyter nbextension enable --py jupyter_tabnine --user
jupyter serverextension enable --py jupyter_tabnine --user
jupyter labextension install @jupyterlab/debugger
pip3 install pami sklearn tensorflow sklearn-extensions pyspark oauthenticator RISE psycopg2-binary plotly==5.3.1 torch pycuda
pip install jupyter_contrib_nbextensions
sudo jupyter contrib nbextension install
pip install jupyter_nbextensions_configurator
sudo jupyter nbextensions_configurator enable --system

conda install -c conda-forge -y jupyterlab-drawio




