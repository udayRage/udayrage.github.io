# [Main Menu](index.html)

## 1. Removing a broken repositories from apt list
   [More information](https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/)

   1. Find the list of available repositories by executing the following command: 
         
           sudo ls /etc/apt/sources.list.d
   2. Remove the broken repository by executing the following command:

           sudo rm /etc/apt/sources.list.d/repositoryName.list 