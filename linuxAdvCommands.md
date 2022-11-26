# [Main Menu](index.html)

# Linux advanced commands


## 1. SSH key generation and remote login

1. Execute the below command and simply keep on pressing enter until it is done

       ssh-keygen

2. Copy your public key to the remote server using the following command

       ssh-copy-id userName@serverIP

3. Test the remote login

       ssh userName@serverIP

## 2. Setting up the config file

1. Go into .ssh folder

       cd .ssh
2. Create a file named 'config'

       vim config

3. Edit the file by entering the following details

       Host petName
           User studentID
           Port 22
           Hostname ipaddress

       #Example   
       Host skytree
          User s123000
          Port 22
          Hostname skytree1.u-aizu.ac.jp


4. Save the file and exit.  
      
       :wq
5. Change the file permission to 600

       chmod 600 config
6. Try to remote login into the server from the terminal

       ssh petName
       E.g., ssh skytree

## 3. SCP: copying files between remote servers and local machines

Command to copy local files to remote server

    scp fileName userName@remoteServerIP:location

    E.g., scp test.txt user@server.uAizu:~
    #The above command copies text.txt into the home folder of the user

    scp -r folderName userName0remoteServerIP:location
    E.g., E.g., scp copyFolder user@server.uAizu:~

Command to copy remote files to local machine

    scp user@server.uAizu:fileName localPath
    E.g., scp user@server.uAizu:~/test.txt  ~

    scp -r user@server.uAizu:folderName localPath
    E.g., scp user@server.uAizu:fileName localPath



## 3. Monitoring the process

Monitor the processes running on the server machine using the below command:

    top

Press Control + C to quit   

