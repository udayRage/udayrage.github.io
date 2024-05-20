# [Main Menu](index.html)

## Running the jupyterHub

1. Login into the hostserver using jupyter account

       ssh jupyter@hostipaddress 

2. Remove the previous nohup.out file

       rm -rf nohup.out 

3. Execute _ls_ command using sudo. Enter the password of the jupyter user upon asked.

       sudo ls

4. Execute the below provided nohup command.

       nohup sudo jupyterhub -f /home/userName/jupyterhub_config.py &

5. Check the status of the jupyterHub. __Connect the supervisor if errors were observed__.

       tail nohup.out
    

6. Open the jupyterHub in a webserver, login with your account, and check whether everything is fine or not.