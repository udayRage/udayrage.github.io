# [Main Menu](index.html)

# Linux advanced commands


## Nohup: Running a process in background (very important command)
 
Normally, big data programs may take several hours/days to execute. Thus, the common problem encountered by
the researchers is that their programs often terminate when their remote terminals close 
due to session timeout, idle time, or network error. To evade this problem, users have to execute their
programs using *nohup* command. The syntax is as follows:

    nohup  command &
    E.g., nohup python bigDataProgram.py

When you want to execute nohup command with sudo, then first execute a random sudo command without nohup and provide the password. Next, execute the program.

    sudo ls
    #Enter the password when asked
    
    nohup sudo command &
    E.g., nohup sudo python bigDataProgram.py

The output of the nohup command will be saved in nohup.out. You can also redirect the output of nohup command to a specific file 

    nohup command >> outputFileName &
    E.g., nohup python bigDataProgram.py >> output.txt &

## SCP: copying files between remote servers and local machines

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

## SSH: Remote login

1. Execute the below command and simply keep on pressing enter until it is done

       ssh-keygen

2. Copy your public key to the remote server using the following command

       ssh-copy-id userName@serverIP
 
3. Test the remote login 

       ssh userName@serverIP

## Mounting remote folders to a diretory

Please refer to [https://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/](https://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/)