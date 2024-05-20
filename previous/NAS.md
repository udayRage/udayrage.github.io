

# Remote login using SSH

    ssh uday@163.143.165.130

# Creation of new user account

    sudo useradd -m -s /bin/bash userName
    #sudo useradd -m -s /bin/bash -G sudo userName (admin command)


# Creation of a password

    sudo passwd userName

# Login as a new user

    su - userName

# In the skytree or khalifa server

    sudo apt install sshfs

# Create the mount point

    mkdir ~/remoteDir

# Pass the public key to the remote server

    ssh-keygen -t rsa

    #press enter key for simplicity 

    ssh-copy-id -i ~/.ssh/id_rsa.pub userName@163.143.165.130
    #press Y when asked for input.
    #Next, enter the password of userName specified in 163.143.165.130


# Mount the Remote File System Using SSHFS

    sudo sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa userName@163.143.165.130:/share/homes/userName ~/remoteDir

    #sudo sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa uday@163.143.165.130:/share/homes/uday  ~/remoteDir