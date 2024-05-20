# [Main Menu](index.html)

## 1. Creation of a user in Ubuntu


    sudo useradd -m -s /bin/bash userName
    sudo passwd userName

    #Optional: to be an admin (or sudo user)
      sudo usermod -aG sudo userName # To grant sudo access

__Example:__

    sudo useradd -m -s /bin/bash uday

## 2. Creation of public and private keys

    ssh-keygen -t rsa
    #press 'Enter' key when asked for paraphrase

## 3. Creation of a Config file for tunneling purposes

    vi config

    #add the following lines. 
    Host skytree
         User userName
         HostName 163.143.165.141

    Host storage
         User userName
         HostName 163.143.165.130

    Host gpu
         User userName
         HostName 163.143.165.143

    Host dgpu
         User userName
         HostName 163.143.165.140

    #save the file and exist

__Example:__

    Host skytree
         User uday
         HostName 163.143.165.141
    
    Host storage
         User uday
         HostName 163.143.165.130
    
    Host gpu
         User uday
         HostName 163.143.165.143
    
    Host dgpu
         User uday
         HostName 163.143.165.140
## Creation of users in PostGres
Login into the postgres database and execute the following commands:
    
    CREATE USER userName WITH PASSWORD 'password' CREATEDB;
    Alter user userName with superuser   #To make the user a super user

Inform the following to the new users.

    vi .bashrc
    export PGDATABASE=postgres
    # save and exit
    source .bashrc  # Compile the file
    psql            # To login in the database

## Granting database access to the users

[Click here for more information](https://tableplus.com/blog/2018/04/postgresql-how-to-grant-access-to-users.html)

    GRANT CONNECT ON DATABASE databaseName TO userName
    GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA schemaName TO username;
    #Generally schemaName is public