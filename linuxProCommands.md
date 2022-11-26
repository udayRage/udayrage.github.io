# [Main Menu](index.html)

# Linux professional commands



## 1. Nohup: Running a process in background (very important command)

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

## 2. Mounting remote folders to a directory in a local machine

Please refer to [https://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/](https://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/)