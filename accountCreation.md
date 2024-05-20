# [Main Menu](index.html)

## 1. Servers' info

__Computational purposes:__
- Skytree server (CPU only, default): [http://163.143.165.141:8000/hub/login](http://163.143.165.141:8000/hub/login)
- Khalifa server-1 (GPU server-1): [http://163.143.165.143:8000/hub/login](http://163.143.165.143:8000/hub/login)
- Khalifa server-2 (GPU-server-2): [http://163.143.165.140:8000/hub/login](http://163.143.165.140:8000/hub/login)

__Storage purposes:__
- Storage server (10TB): http://163.143.165.145:8000/hub/login

__Course purposes:__
- Course server (CPU only + LDAP): http://163.143.165.145:8000/hub/login

## 2. Account Creation in the computing servers.

1. Choose a specific server and click on it.
   - [Skytree](http://163.143.165.141:8000)
   - [Khalifa-1](http://163.143.165.143:8000)
   - [Khalifa-2](http://163.143.165.140:8000)

2. Login to the server with the following admin account:
   1. userName: jupyter
   2. password: askLabLeader (or find it in lab's discord channel)

3. Click on the "Terminal" icon and open the terminal.

4. Create your account by executing the following command:

       sudo useradd -m -s /bin/bash <userName>
       sudo passwd <userName>

     - First, type the __admin password__ of the jupyter user.
     - Next, type your own login password
     - Finally, retype the same password.
   
5. Login into your account.

       su -userName

    Type your password to login. If you are unsuccessful, contact the lab leader, TA, or the professor. 

6. Create public and private ssh keys by executing the following terminal.

       ssh-keygen -t rsa
       #simply press Enter key when asked for the paraphrase

7. Type "exit" on the terminal.

8. Logout of the Jupyter Hub.

## 3. Account Creation in the storage servers.

1. [Click here](http://163.143.165.145:8000/hub/login) to access the storage server.

2. Login to the server with the following admin account:
   1. userName: jupyter
   2. password: askLabLeader (or find it in lab's discord channel)
   
3. Click on the "Terminal" icon and open the terminal.

4. Create your account by executing the following command:

       sudo useradd -m -s /bin/bash <userName>
       sudo passwd <userName>

     - First, type the __admin password__ of the jupyter user.
     - Next, type your own login password
     - Finally, retype the same password.
5. Login into your account.

       su -userName

    Type your password to login. If you are unsuccessful, contact the lab leader, TA, or the professor. 

6. Create a dummy file by executing the following file.

       touch dummy.txt
7. Type "exit" on the terminal.
8. Logout of the Jupyter Hub.

## 4. Mounting the Remote Storage Directory 

1. Click on the computing server on which you have created account previously.
   - [Skytree](http://163.143.165.141:8000)
   - [Khalifa-1](http://163.143.165.143:8000)
   - [Khalifa-2](http://163.143.165.140:8000)

2. Create a directory that points to the remote directory in the storage server.

       mkdir remoteDir

3. Mount the remote storage directory to this folder.

       sudo sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa userName@163.143.165.145:/home/userName ~/remoteDir

4. Enter into the remoteDir and check its contents. 

       cd remoteDir
       ls -la

  You must be able to see dummy.txt file that was created on the storage server. If you cannot see the file, it means 
  the remote directory did not mount properly. Try to execute the previous step 3 again.
