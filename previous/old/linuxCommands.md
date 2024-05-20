# [Main Menu](index.html)

## Basic linux commands

#### Symbols
    ~   represents users home directory
    .   represents current directory
    ..  represents parent directory of current directory

#### File commands

    touch fileName      #Creates an empty file
    vi fileName         #Open an editor to write a file
    mv sourceFileName destFileName  #Rename a file
    cp  sourceFileName destFileName #Copy a file
    rm fileName         # deletes a file

#### Directory commands
    
    mdkir directoryName     #Creates a directory
    cd directoryName        #Move into the respective directory
    cd ..                   #Move to parent directory
    mv sourceDirectory destinationDirectory #Rename/Move a directory
    cp -r sourceDirectory destinationDirectory #Copy a directory
    rm -r directoryName     #Deletes a directory
    

#### Printing the contents of a file

    cat fileName    #Prints the contents of a file
    head fileName   #Prints first 10 lines of a file. head -100 fileName prints first 100 lines
    tail fileName   #Prints last 10 lines of a file. tail -100 fileName prints last 100 lines

#### Other commands

    su -userName    #To login as a different user
    pwd     #Prints the current working directory
    top     #Prints the details of various processes running on a system. Press 'q' to quit.
    whoami  #Prints the userName
    history #Prints the history of commands executed on a shell
    !!      #Shortcut to execute the previous command
    !number #Executes the command having the same number in the history. E.g., !109 executes the command 109 in the history.
    kill -9 pid #Kills the process whose id is -9. 
    
#### Symbolic links to files and folders

    ln -s <sourceFolder> <folderToLink>
    Example:
    mkdir ~/linkFolder
    ln -s /data/code ~/linkFolder

Note: you must create linkFolder before executing the folder.
