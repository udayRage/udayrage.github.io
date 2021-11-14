# [Main Menu](index.html)

## Setting up of PostGres and PostGIS

### Installation of PostGres

    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    sudo apt update
    sudo apt install postgresql-13
    sudo pg_ctlcluster 13 main start
    sudo systemctl start postgresql
    sudo systemctl status postgresql
    sudo systemctl enable postgresql

### Installation of PostGIS

[Click here for more information](https://www.cybertec-postgresql.com/en/postgresql-getting-started-on-ubuntu/)

    sudo apt list --installed | grep postgresql
    apt-cache search postgresql-13-postgis
    apt-cache policy postgresql-13-postgis-3 postgresql-13-postgis-3-scripts
    sudo apt-get install postgresql-13-postgis-3=3.1.4+dfsg-1.pgdg20.04+1 postgresql-13-postgis-3-scripts=3.1.4+dfsg-1.pgdg20.04+1
    sudo systemctl restart postgresql
    sudo systemctl status postgresql

### Remote connection settings

    sudo vi /etc/postgresql/13/main/pg_hba.conf    
    # Below "# Accept from anywhere" add the following
        host all all 0.0.0.0/0 md5
        #Database administrative login by Unix domain socket
        local all postgres md5  
    # Save the file and exist

    sudo vi /etc/postgresql/13/main/ postgresql.conf
        listen_addresses = '*'
    # Save and exist

### Removing PostGres and PostGIS

    sudo apt-get --purge remove postgresql   # OR
    sudo apt-get --purge remove postgresql-14  # Version number
