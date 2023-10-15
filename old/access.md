# Methods to access the Severs

### 1. Setting up VPN

All the servers have a fixed local ipaddress for security reasons. Students can directly access 
the servers within the university. If the students wants to access the servers from home/outside of university, please [set up a VPN](https://web-int.u-aizu.ac.jp/labs/istc/ipc/service/ains-vpn/vpn-e.html).


[Click here](https://web-int.u-aizu.ac.jp/labs/istc/ipc/index-e.html) for more information on the University of Aizu network (ISTC).


### 2. Accessing the servers

The skytree and khalifa servers can be accessed from a terminal, a browser, and a remote desktop.

1. Terminal:

       ssh userName/studentID@ipaddress

       E.g., ssh s1230000@khalifa1.u-aizu.ac.jp

2. Browser (Jupyter Hub):
   1. [http://skytree1.u-aizu.ac.jp:8000](http://163.143.165.136:8000/)
   2. [http://skytree2.u-aizu.ac.jp:8000](http://163.143.165.141:8000/)
   2. [http://khalifa1.u-aizu.ac.jp:8000](http://163.143.165.137:8000/)
   3. [http://khalifa2.u-aizu.ac.jp:8000](http://163.143.165.138:8000/)
   4. [http://khalifa3.u-aizu.ac.jp:8000](http://163.143.165.140:8000/)


3. Remote desktop

    Install any remote desktop client (e.g., VNC and Microsoft remote desktop) depending on your operating system. Access the 
servers using the following details
   1. Protocal: xrdp
   2. port: 3389 (Default port. So no need to specify most of the time)
   3. userName: studentID
   4. hostname: skytree1.u-aizu.ac.jp  or khalifa1.u-aizu.ac.jp
