# [Main Menu](index.html)

## Basic PostGres Commands

#### Connecting to a database from the terminal

    psql    # local machine
    psql -U userName -h hostName -d databaseName    #Remote machine

#### Top-10 commands

|Command|Purpose|
|-------|--------|
|\l| List the databases|
|\c| Connect to a database |
|\d| Display all accessible tables in a database|
|\d tableName| Describe the contents of a table|
|\s| Displays the history of commands executed by the user|
|\s fileName| Saves the history of commands in a file|
|\g | shortcut to execute previous command|
|\i fileName| Executes the lists of commands in a file|
|\o fileName|Saves the output of the subsequent queries in a file. Exit the postGres to prevent further saving of the queries|
|\q or control + D| Quit the postGres|

## Basic SQL Commands

#### SELECT queries

    SELECT * FROM tableName;    #Displays whole data provided in a table
    SELECT col1,col2,...,colN FROM tableName;   # Display only requested columns data

    SELECT count(*) FROM tableName; # Prints the number of rows in a table

    SELECT distinct(column) FROM tableName; #Prints the unique values in a column

#### SELECT-LIMIT queries

    SELECT * FROM tableName LIMIT n;    #Displays only n rows
    SELECT col1,col2,...,colN FROM tableName LIMIT n;

#### SELECT-ORDER BY ASC/DESC

    SELECT * FROM tableName ORDER BY column ASC
    SELECT * FROM tableName ORDER BY column DESC

#### SELECT-WHERE queries

    SELECT * FROM tableName WHERE col1='STRING/DATE' and/or col2=NUMBER and/or col3<=NUMBER and/or col4>=NUMBER

#### SELECT-WHERE-ORDER BY-LIMIT combination queries

    SELECT * FROM tableName WHERE col1<=10 ORDER BY col2 ASC LIMIT 100

#### SELECT for SPATIAL objects
The postgres stores the spatial objects in a hexadecimal format. Thus, we need to use ST_asTeXT(geometryColumn) function to get reable data

    SELECT ST_asText(geom), col1, col2, col3 FROM tableName;

    SELECT ST_asX(geom), ST_asY(geom), col1, col2, col3 FROM tableName;  
    # Above commands reads Lat and Long seperately

#### SELECT on Multiple tables

    SELECT * FROM table1 t1, table2 t2 WHERE t1.colK = t2.colY

    SELECT t1.col1, t2.col1, t1.col3,t3.col4 FROM table1 t1, table2 t3 WHERE t1.colK > t2.colY ORDER BY t1.col1 LIMIT 100



For more information, visit [W3SCHOOLS](https://www.w3schools.com/sql/sql_select.asp)