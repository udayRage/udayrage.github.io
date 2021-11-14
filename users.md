# [Main Menu](index.html)

## Creation of users in Ubuntu


    sudo useradd -m -s /bin/bash userName
    sudo passwd userName
    sudo usermod -aG sudo userName # To grant sudo access

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