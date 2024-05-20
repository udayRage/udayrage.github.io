# [Main Menu](index.html)

## Chapter 1: Installation of Ubuntu, Creation of Users, and Enabling Direct Remote Login

1. Select _k_ machines and install ubuntu each of them. Check [ubuntu installation](ubuntu.html).

2. Assign an ipaddress to each machine.

       sudo nano /etc/netplan/01-network-manager-all.yaml

       #copy and paste the below text

       network:
         ethernets:
           ens18:
             addresses:
             - <specify_ip_address> #163.143.165.138/24
             nameservers:
               addresses:
               - <specify_name server> #163.143.1.100
               search: []
             routes:
             - to: default
               via: <specify_router> #163.143.165.1
       version: 2

Save the file and exit (press Control + X, and Y). Next, type the following command on the terminal:
    
    sudo netplan apply

3. In every machine, create a sudo user with same the username.


       sudo useradd -m -s /bin/bash -G sudo hadoop

       sudo passwd hadoop

4. Login into every machine and create public and private keys. 

       ssh-keygen -t rsa

       #press enter key for simplicity 

5. Among _k_ machines, select  a machine as a **master node**. Consider the remaining machines as **slave nodes**. Note down the ipaddresses of master and slave machines. Please ensure that the machine representing the master node has high specs (CPU and RAM) to do processing.

    
      Example:
      163.143.165.138  - master
      163.143.165.139  - slave1
      ... # one can have any number of slaves

5. In every machine, enter the ipaddress and hostname of every machine.

       sudo vi /etc/hosts

       #add these sentences at the begining
       163.143.165.138 master  
       163.143.165.139 slave1

      **Note:** Please do not simply type master and slave1. Using 'hostname' check the name of the machine and type it.

6. Copy the public ssh key from the master machine to all slave machines.

       ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@163.143.165.139
       ...

       chmod 0600 ~/.ssh/authorized_keys 
7. From each slave machine, copy its public ssh to master machine.

        ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@163.143.165.139
        ...
        chmod 0600 ~/.ssh/authorized_keys 

8. Open the following ports by executing below commands in the terminal

        sudo ufw allow 9000
        sudo ufw allow 9001 
        sudo ufw allow 9870  #name node webui
        sudo ufw allow 8088  #resource node webui
        sudo ufw allow 19888 #mapreduce job history webui
        sudo ufw allow ssh

       sudo ufw enable  
       # press 'Y' when asked

## Chapter 2: Installation of Java
Perform the below steps on every machine irrespective of master or slave.

1. Install the latest version of Java JDK.

        sudo apt install openjdk-17-jdk -y

2. In the .bashrc file, add java details to Java_home and path variables.

           nano .bashrc
 
           # enter the following text at the end of the file

            export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
            export PATH=$PATH:$JAVA_HOME/bin

Save the file and exit (press Control + X, and Y). Next, type the following commands on the terminal:
    
    source .bashrc   #ensure no errors were generated
    javac   #You should able see the commands that you can execute.

## Chapter 3: Downloading, Unzipping, and Moving Hadoop folder to a common location
Perform the below steps on every machine irrespective of master or slave.

1. Download the latest version of Hadoop system into your home directory.

       wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.0/hadoop-3.4.0.tar.gz

2. Unzip the file.

       tar -zxvf hadoop-3.4.0.tar.gz
 
3. Move the unzip folder into a common directory where other users can also access it. Rename the folder to "hadoop" to maintain consistency.

       mv hadoop-3.4.0 /opt/hadoop

4. In the .bashrc file, upload the PATH variable and add other Hadoop variables.

       nano .bashrc

       export PATH=$PATH:$JAVA_HOME/bin:/opt/hadoop/bin:/opt/hadoop/sbin
       export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true
       export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop

Save the file and exit (press Control + X, and Y).

## Chapter 4: Configuring the Hadoop directory

### Chapter 4.1: Login into  Master node and perform the below-mentioned steps.

1. Enter into Hadoop directory

       sudo cd /opt/hadoop

2.  Open the core-site.xml file that exists in the /opt/hadoop/etc/hadoop folder.
 
        nano /opt/hadoop/etc/hadoop/core-site.html
3. Copy and paste the below provided code.

         <configuration>
            <property> 
             <name>fs.default.name</name> 
             <value>hdfs://hadoop-master:9000/</value> 
            </property> 
            <property> 
              <name>dfs.permissions</name> 
              <value>false</value> 
            </property> 
         </configuration>
Save the file and exit (press Control + X, and Y).

4. Open the hdfs-site.xml file that exists in the /opt/hadoop/etc/hadoop folder and copy-paste the below provided text.

        <configuration>
          <property> 
             <name>dfs.data.dir</name> 
             <value>/opt/hadoop/hadoop/dfs/name/data</value>
             <final>true</final> 
          </property> 
          <property> 
             <name>dfs.name.dir</name> 
             <value>/opt/hadoop/hadoop/dfs/name</value> 
             <final>true</final> 
          </property> 
          <property> 
             <name>dfs.replication</name> 
             <value>1</value> 
          </property> 
        </configuration>

Save the file and exit (press Control + X, and Y).

**Note:** You can specify the replication value to be 2, 3, or more to ensure fault-tolerant.

5. Create the following directories to save the data and names.

       mkdir /opt/hadoop/hadoop/dfs/name
       mkdir /opt/hadoop/hadoop/dfs/name/data

6. Open mapred-site.xml file that exists in the /opt/hadoop/etc/hadoop folder and copy-paste the below provided text.

        <configuration>
          <property> 
             <name>mapred.job.tracker</name> 
             <value>hadoop-master:9001</value> 
          </property> 
        </configuration>
Save the file and exit (press Control + X, and Y).
7. Open hadoop-env.sh file that exists in the /opt/hadoop/etc/hadoop folder and copy-paste the below provided text.

       export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
       export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true
       export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
       export PATH=$PATH:$JAVA_HOME/bin:/opt/hadoop/bin:/opt/hadoop/sbin

Save the file and exit (press Control + X, and Y).

### Chapter 4.2: Setting up the slave nodes

**Option 1:**
Login into every slave node and perform all the above-mentioned steps mentioned for the Master node.

**Option 2:** You can simply copy the hadoop directory from the master node to each of the slave node.

       scp -r hadoop hadoop@slave1:/opt/
       ...

Save the file and exit (press Control + X, and Y).
### Chapter 4.3: Configuring the master node

1. Specify the ipaddress of the master node

       nano /opt/hadoop/etc/hadoop/masters

       master1 #or type the ipaddress of the master node
Save the file and exit (press Control + X, and Y).

2. Specify the ipaddresses of the slave nodes

       nano /opt/hadoop/etc/hadoop/slaves

       slave1 #mention the ipaddress of slave nodes
       slave2
       ...

Save the file and exit (press Control + X, and Y).

3. Format the master node to store hadoop data.

       /opt/hadoop/bin/hadoop namenode –format
                      or
       /opt/hadoop/bin/hadoop namenode   (for latest versions)

4. Start the Hadoop services

       /opt/hadoop/sbin/start-all.sh


5. Check the process running in master and a worker machines by executing the following command on the terminal:

       jps

6. Open the browser and check the HDFS using the following URL:

       http://ipAddressMasterNode:9870/

       Examaple: http://163.143.165.138:9870/