# PostGres Advance Commands

### Basic data types in postgres

* boolean    (binary data)
* int/float/double  (Numerical data)
* char/varchar/text  (string data)
* timestamp/date         (temporal data)
* Array of string and numbers (Multi-valuaed attributes) 

  __Not advisable as it violates the first normal form 1 NF __

### CREATE COMMAND

Creating basic table

    CREATE TABLE tableName (attribute dataType condition,...,attribute dataType condition)    

    E.g., CREATE TABLE students(Name varchar not null, id integer not null, sex boolean, dob date, address varchar)


Creating table with primary key

    # Generic command that supports multiple attributes to be part of a primary key
    CREATE TABLE tableName(attribute dataType condition,...,attribute dataType condition, primary key(attributes)) 

    E.g., CREATE TABLE students(Name varchar not null, id integer not null, sex boolean, dob date, address varchar, primary key(id))

Creating table from a SELECT query

    CREATE TABLE tableName as (SELECT * FROM tableName WHERE conditions)
    
    E.g., CREATE TABLE fukushimaStudents as (SELECT * FROM students WHERE address='Fukushima')


Creating table with GEOMETRIC fields

Geometry is a 2D plane or X,Y cartesian coordinate system.

    CREATE TABLE tableName (attributes dataTypes, geometricAttributes geometry);
    
    E.g., CREATE TABLE students(Name varchar not null, id integer not null, sex boolean, dob date, address varchar,location geometry)


[Click here for more information](https://postgis.net/workshops/postgis-intro/geometries.html)

Creating tables with Geographic fields

The earth and other heavenly bodies are 3D structures with different projection systems. Geography is the right attribute to store location data.

    CREATE TABLE ptzgeogwgs84(attributes datatypes, geographicAttributes geography(type,SRID) );

    E.g., CREATE TABLE ptzgeogwgs84(gid serial PRIMARY KEY, geog geography(POINT,4326) );

Types:
* Point  - stores only X ad Y values
* PointZ - stores X, Y, and Z (altitude) values
* LINESTRING
* POLYGON
* MULTIPOINT/MULTILINESTRING/MULTIPOLYGON
* GEOMETRYCOLLECTION

[Click here for more information](https://postgis.net/docs/using_postgis_dbmanagement.html#PostGIS_Geography)


#### INSERT COMMAND

Basic insert command

    INSERT  INTO tableName (attributes) VALUES (...)

    E.g., 
    INSERT into student(name, id, sex, dob,address) VALUES ('XXXXX',2021013456, '200-01-01', 'Fukushima')
    
    #short form if we are inserting values in the same order as the attributes declared
    INSERT into student VALUES ('XXXXX',2021013456, '200-01-01', 'Fukushima')

Inserting geometric values

    INSERT INTO tableName (attributes) vallues (..., types)

    Example:
    INSERT INTO student (name,id,location) VALUES ('YYYYYYY',2098092345, 'POINT(-110 30)')

Inserting spatial values

    INSERT into tableName (attributes) VALUES (..., 'SRID=xxxx;type')

    Example:
    INSERT into student (name,id,location) VALUES ('YYYYYYY',2098092345, 'SRID=4326;POINT(-110 30)')


#### ALTER COMMAND

Adding attributes

    ALTER TABLE tableName 
    ADD COLUMN columnName dataType condition,
    ...
    ADD COLUMN columnName dataType condition.

    Example:
    ALTER TABLE customers
    ADD COLUMN fax VARCHAR,
    ADD COLUMN email VARCHAR;

[Click here for more info](https://www.postgresqltutorial.com/postgresql-add-column/)

Deleting attributes

    ALTER TABLE tableName
    DELETE COLUMN columnName condition
    ...
    DELETE COLUMN columName condition

    Example:
    ALTER TABLE customers
    DELETE COLUMN fax CASCADE
    DELETE COLUMN email

[Click here for more info](https://www.postgresqltutorial.com/postgresql-drop-column/)