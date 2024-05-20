# [Main Menu](index.html)

## 1. Installation of PostGres and PostGIS

    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
    sudo apt update
    sudo apt install -y postgresql-13 postgresql-client-13 postgis postgresql-13-postgis-3
    sudo systemctl restart postgresql
    sudo systemctl status postgresql

## 2. Setting up password for the postgres user

    sudo su - postgres
    psql -c "alter user postgres with password 'StrongAdminP@ssw0rd'"   # change passwd
    psql        # to verify
    exit        # to come out of postgres

## 3.  Remote connection settings

Execute the following command on the terminal

    sudo vi /etc/postgresql/13/main/pg_hba.conf    

Below "# IPv4 local connections:" add the following

        host all all 0.0.0.0/0 md5
        #Database administrative login by Unix domain socket
        local all postgres md5  

Save the file and exit. Next, execute the following command.

    sudo vi /etc/postgresql/13/main/postgresql.conf

Set

    listen_addresses = '*'      #Allows connection form any ipaddress

Save and exist

## 4. Testing the remote connection

Open the terminal in the jupyterHub and execute the below command to install psycopg2 library. 

    pip install psycopg2

Create a file testDBConnection.py, and copy paste the below code

    import psycopg2
    from psycopg2 import Error

    try:
        # Connect to an existing database
        connection = psycopg2.connect(user="USER_NAME",      # Set your user name
                                      password="PASSWORD",   # Set your password
                                      host="IPADDRESS",      # Set ipaddress   
                                      port="PORT",           #5432 is default port 
                                      database="DATABASE_NAME")

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

## 5. Removing PostGres and PostGIS

    sudo apt-get --purge remove postgresql   # OR
    sudo apt-get --purge remove postgresql-14  # Version number
