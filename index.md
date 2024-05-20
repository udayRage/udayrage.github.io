
## Important Links
## Tutorials
1. Linux
   1. [Basic commands](linuxCommands.html)
   2. [Advanced commands](linuxAdvCommands.html) and
   3. [Pro commands](linuxProCommands.html)
   
2. PostGres
   - [Database specific commands](https://www.commandprompt.com/education/postgresql-basic-psql-commands/)
   - [Basic SQL](postGresCommands.html)
   - [Advanced SQL](postGresAdvCommands.html)
   - [Pro SQL](postGresProCommands.html)

3. [Markdown](https://www.datacamp.com/tutorial/markdown-in-jupyter-notebook)
   
4. Jupyter Notebook

   - [GUI](https://docs.sevenbridges.com/docs/editor-quick-reference)
   - [Short cuts](https://udayrage.github.io/jupyterLabCommands.html)
   - [Basic Jupyter tutorial](https://towardsdatascience.com/a-beginners-tutorial-to-jupyter-notebooks-1b2f8705888a)
   - [Interactive widgets](https://towardsdatascience.com/bring-your-jupyter-notebook-to-life-with-interactive-widgets-bc12e03f0916)
   - [Cheat sheet**](https://www.edureka.co/blog/cheatsheets/jupyter-notebook-cheat-sheet)
   - [Practise](markdownPractise.pdf)
   
5. [Google Colab](https://www.tutorialspoint.com/google_colab/index.htm)



## Server administration

1. [Setting up a Ubuntu Server](ubuntu.html)

    __Topics:__ Installation of GUI, Anti-virus, Remote Desktop, Prevent Network Idle Sleep, and Installation of Tex Live, NPM, and Node JS.
    
2. [Setting up the Jupyter Hub for Machine Learning](jupyterHub.html)

   __Topics:__ Installation of R, Conda, Setting up an environment, installation of JupyterHub and its add ons. 


3. [Installing packages and starting Jupyter Hub](jupyterHubPackage_start.md)

       #INSTALLING A PYTHON PACKAGE
       su - jupyter
       conda activate jupyterHub
         
       pip3 install <packageName>
       #pip3 install pami

       #STARTING JUPYTERHUB
       sudo ls
       nohup sudo ./anaconda3/envs/jupyterHub/bin/jupyterhub -f ./jupyterhub_config.py & 
4. [Installation and Setting up of PostGres and PostGIS in Ubuntu Server](postGres.html)

    __Topics:__ Installation of PostGres and PostGIS, Starting the server, and enabling remote connection. 

5. [Creating users and giving database access](users.html)

    __Topics:__ Creating users, super users, and granting database access.

6. [Setting up LDAP Client](ldap.html)

    __Topics:__ Setting up of LDAP client 

7.   [Creating a python repository in PYPI](pypi.html)

    __Topics:__ Installing necessary packages, writing codes, and running them.

8. Updating packages in Conda

         conda activate environmentName
         #conda activate jupyterHub

         conda update all -y #to update all packages in an environment

         conda update packageName -y
         #conda update notebook numpy pandas scikit-learn -y

         conda update conda #to update conda

9. [GeoAnalytics package](geoAnalytics.html)

    __Topics:__ Installing geoAnalytics package

10. [Resizing the disk using LVM](diskResize.html)

11. [Account Creation in Rage's Lab](accountCreation.html)

