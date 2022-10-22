# [Main Menu](index.html)

## Setting up of PostGres and PostGIS
[Click here for in-depth manual](https://computingforgeeks.com/how-to-install-postgis-on-ubuntu-linux/)

    sudo apt -y install gnupg2
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
### Installation of PostGres
[Click here for installation manual](https://computingforgeeks.com/how-to-install-postgresql-13-on-ubuntu/)

    sudo apt -y install vim bash-completion wget
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
    sudo apt update
    sudo apt install -y postgresql-13 postgresql-client-13
    
    systemctl status postgresql.service
    sudo su - postgres
    psql -c "alter user postgres with password 'StrongAdminP@ssw0rd'"   # change passwd
    psql        # to verify
    exit        # to come out of postgres
### Installation of PostGIS

[Click here for more information](https://www.cybertec-postgresql.com/en/postgresql-getting-started-on-ubuntu/)

    sudo apt install -y postgis postgresql-13-postgis-3
    sudo systemctl restart postgresql
    sudo systemctl status postgresql

### Remote connection settings

    sudo vi /etc/postgresql/13/main/pg_hba.conf    
    # Below "# IPv4 local connections:" add the following
        host all all 0.0.0.0/0 md5
        #Database administrative login by Unix domain socket
        local all postgres md5  
    # Save the file and exist

    sudo vi /etc/postgresql/13/main/postgresql.conf
        listen_addresses = '*'
    # Save and exist

### Testing the remote connection

Open the terminal in the jupyterHub and execute the below command to install psycopg2 library. 

    sudo pip install psycopg2

Create a file testDBConnection.py, and copy paste the below code

    import psycopg2
    from psycopg2 import Error

    try:
        # Connect to an existing database
        connection = psycopg2.connect(user="USER_NAME",      # set your user name
                                      password="PASSWORD",   # Set your password
                                      host="163.143.87.200",
                                      port="5432",
                                      database="kaguya")

        # Create a cursor to perform database operations
        cursor = connection.cursor()
        # Print PostgreSQL details
        print("PostgreSQL server information")
        print(connection.get_dsn_parameters(), "\n")
        # Executing a SQL query
        cursor.execute("SELECT version();")
        # Fetch result
        record = cursor.fetchone()
        print("You are connected to - ", record, "\n")

    except (Exception, Error) as error:
        print("Error while connecting to PostgreSQL", error)
    finally:
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")


Execute this program to test the remote connection.

### Removing PostGres and PostGIS

    sudo apt-get --purge remove postgresql   # OR
    sudo apt-get --purge remove postgresql-14  # Version number
