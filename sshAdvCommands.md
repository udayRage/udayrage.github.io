# [Main Menu](index.html)

## Tunneling


Tunneling is the process of bypassing the gateway servers and connecting to machines in a network.

For example, Let univServer be the university gateway server and labServer be the server in the lab. The labServer does not have a global IP address, and thus can be accessed only with the university.

__Traditional approach:__ If a client/student wants to access the labServer, he/she has to first connect to univServer using ssh. Next, they have to perform another ssh from univServer to labServer.

    #login into univServer
    ssh user@univServer
    # from univServer login into labServer
    ssh user@labServer 

This traditional approach is cumbersome and is also difficult to trasfer files from local machine to labServer and vice-versa.

__Tunneling__ helps us in bypassing the cumbersome process by establishing a redirect command from gateWay server.

[Click here for more information](https://www.tecmint.com/create-ssh-tunneling-port-forwarding-in-linux/)


### Tunneling using SSH command

    ssh admin@server1.example.com -L 8080:server1.example.com:5432
    # An application, say postgres, is running on the server at the port 5432. 
    # Using -L (port forwarding) you can connect to the server locally using 8080


    Executing this commad is fast; however, the user has to execute this command everytime. If the user
is connecting to the remote server multiple times, it is better to save the details in a file as show below.

### Tunneling using a file

Create a file named 'config' in ~/.ssh/ folder

Establish remote connection by choosing anyone option

      Host labServer
          User userName
          Port 22
          HostName 127.0.0.1
          TCPKeepAlive yes
          IdentitiesOnly yes
          ProxyCommand ssh -W %h:%p univServer

      Host univServer
          User userName 
          Port 22
          Hostname univServer.university.ac.jp

For port forwarding 

      Host server
          User uday-197
          HostName univServer.university.ac.jp
          LocalForward 15432 univServer.university.ac.jp:5432

3. save the file and exit
4. Execute 'chmod 600 ~/.ssh/config' on the terminal

#### Direct login
     ssh labServer

#### SCP of files

     # copy local file to labServer
     ssh file.txt labServer:

     # Copy remote file to labServer
     ssh labServer:~/file.txt .

  