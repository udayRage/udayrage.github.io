# [Main Menu](index.html)

## Database backup command

    pg_dump databaseName > databaseName.sql

## Database restore command

* Login into the postgres and create a database.
* Open the terminal and execute the following command:

      psql databaseName  < dataBackup.sql
                    #OR
      psql -U username -h hostName -d databaseName  < dataBackup.sql

## Storing database in a different place using table space

    create tablespace tableSpaceName location 'folder';
    #create tablespace bigData location '/data/alt/postgres';

    create database databaseName with tablespace = tableSpaceName;
    #create database rainfall with tablespace = bigData;