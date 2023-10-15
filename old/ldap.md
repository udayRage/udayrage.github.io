# [Main Menu](index.html)


## Install the necessary libraries

[Click here for detailed info](https://computingforgeeks.com/how-to-configure-ubuntu-as-ldap-client/)

    sudo apt-get update
    sudo apt -y install nscd libnss-ldap libpam-ldap ldap-utils

## Performing the following configurations in the appeared menu

- Set the following for the LDAP-URI

      ldaps://ains-ldaps.u-aizu.ac.jp:636

- Set a Distinguished name of the search base 

      ou=People,dc=u-aizu,dc=ac,dc=jp
- Select LDAP version 
  
      3

- Make local root Database admin

      no
- Again press 'no' in the next screen

## Perform the following on the terminal

    sudo vi  /etc/nsswitch.conf

    #add ldap authentication to passwd and group lines.

    passwd: compat systemd ldap
    group: compat systemd ldap
    shadow: compat

    #SAVE FILE AND EXIT

    sudo vi  /etc/pam.d/common-password

    #Remove use_authtok on line 26 to look like below.

    password [success=1 user_unknown=ignore default=die] pam_ldap.so try_first_pass

    #SAVE FILE AND EXIT

    sudo vi /etc/pam.d/common-session

    #Add the below line at the end of the file

    session optional pam_mkhomedir.so skel=/etc/skel umask=077

    # SAVE FILE AND EXIT

## Restart the network connection

     sudo service nscd restart

## Check whether LADP is working or not by typing the following command

    getent passwd

    #If the connection was successful, you must see a BIG list of users and their details.

## Test the remote login using LADP

    su - userName       #userName must not exist in the system. It should be your studentID/facultyID
    