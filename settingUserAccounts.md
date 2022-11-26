# Setting the user accounts in the servers

All the servers have been set up with LADP. Thus, the students can directly access the servers using their studentID and password.

The students have to perform the below-mentioned steps in a server (only once): 

### Step 1: Login into the server.
1. Open a terminal in your machine 
2. Login into the server using the ssh command:

       ssh studentID@serverName
      
       E.g.,  ssh studentID@skytree1.u-aizu.ac.jp

    **Note:** Use the password of your student email to login. Contact TAs or professors if you encounter any login problems.


### Step 2: Setting up the remote storage directory

Every server has a separate '/userData' **mounted** folder to store user data and programs. Storing in this folder 
is better than storing in your home directory.  It is because your data will be saved from system crashes. Perform the below steps to
save your data and programs.

      cd ~
      mkdir /userData/studentID  #create your directory in the mounted disk 
      mkdir rdir #create a directory that will remotely connect to your directory in the mounted disk
      ln -s rdir /userData/studentID    #link the directories

      cd rdir # will take you to your remote directory

### Step 3: Setting up the database access
1. execute the below set of commands:
   1. Type this command on the terminal: 
   
          echo "export PGDATABASE=postgres" >> .bashrc 
   2. Compile the .bashrc file by typing the following command on the terminal:  
   
          source .bashrc
   3. Check whether you can access the Postgres server by typing the below command
      
          psql -U temp -h localhost
          #Enter the password:  temp149   

   4. Create a database by using the following syntax

          create database <yourStudentID>;     
         
      **Note:**
      1. If you enter the wrong studentID, then delete the database by executing the following query:  drop database <wrongStudentID>;
      2. PLEASE BE VERY CAREFUL WHEN DELETING THE DATABASE.  DO THIS STEP ONLY UNDER THE GUIDANCE OF THE INSTRUCTOR/TA.
      3. YOU WILL BE FAILED IN THIS COURSE IF YOU DON'T FOLLOW THE GUIDELINES AND DELETE OTHER DATABASES.
   5. Connect to your database by executing the following command:
      
          \c <studentID>
   
   6. Enable the PostGIS extension by executing the following command:

          CREATE EXTENSION postgis;
   7. Create your database user account and grant access to the database.

          CREATE USER studentID WITH PASSWORD 'databasePassword';
          GRANT CONNECT ON DATABASE studentID TO studentID;
          GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO studentID;

          Note: Remember your studentId and databasePassword. They are used for future login and access to the database.
   8. Exit the postGres by pressing  Control + D buttons 
