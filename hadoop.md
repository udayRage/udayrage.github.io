# [Main Menu](index.html)

## Basic tutorial on Hadoop

### Setting up the PATH environmental variable

To execute Hadoop commands, users have to set the location of Hadoop directory in PATH variable.

* Open the .bashrc file

      vi ~/.bashrc

* At the end of the file, add the location of Hadoop/bin folder

      export PATH=$PATH:<path to hadoop/bin folder>

      E.g., export PATH=$PATH:/opt/hadoop/bin

* Save the file and compile it by executing the following command:

      source .bashrc

* Check whether hdfs command is working or not by typing the below command in the terminal

      hdfs

   The following text must appear if the command is successful

      Usage: hdfs [OPTIONS] SUBCOMMAND [SUBCOMMAND OPTIONS]

      OPTIONS is none or any of:

      --buildpaths                       attempt to add class files from build tree
      --config dir                       Hadoop config directory
      --daemon (start|status|stop)       operate on a daemon
      --debug                            turn on shell script debug mode
      ...

### Creating a user folder and assigning the permissions  (administrator commands)

Hadoop internally uses user permissions of the server machine to access the files and folders. 
Please note that hadoop does not maintain seperate user permissions for files and folders.

* create a user folder in hadoop by executing the following command
  
      hdfs -dfs -mkdir userFolderName

      E.g., hdfs -dfs -mkdir udayHome
   
   

* Change the owner of this folder to user

      hdfs -dfs -chown user userFolderName

      E.g., hdfs -dfs -chown uday udayHome


### Basic Hadoop Commands

1. Put a file from local machine to hadoop

       hdfs -dfs -put fileName /userFolderName/
       
       Examples:

       hdfs -dfs -put text.txt /udayHome/
       hdfs -dfs -put text*.txt /udayHome/
       hdfs -dfs -put ~/* /udayHome/

2. Get a file from hadoop to local machine

       hdfs -dfs -get /userFolderName/fileName  ~/folder

       Examples:

       hdfs -dfs -get /udayHome/test.txt ~/
       hdfs -dfs -get /udayHome/*   ~/

3. Copying files in command

       hdfs -dfs -get /userFolderName/mainfileName  /userFolderName/copyFileName

       Examples:

       hdfs -dfs -get /udayHome/text.txt /udayHome/copiedText.txt

4. List files in a hadoop folder

       hdfs -dfs -ls /userFolderName

       Examples:

       hdfs -dfs -ls /userHome

5. Delete a file in hadoop

       hdfs -dfs -rm [-skipTrash] fileName1 fileName2 ... 

       Examples:

       hdfs -dfs -rm /udayHome/text.txt /udayHome/copiedText.txt



