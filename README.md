#Distchat#
A Distributed chat application based around UDP and IP-Multicast

##Dependancies##
- Maven
- H2
- Junit3 (Unit Tests)

##Build Instructions##
Distchat uses maven to build. Most eclipse installs come with the maven plugin (m2e) preinstalled

###Manual Build###
    mvn compile
    mvn package

###Eclipse Build###
Eclipse *should* handle it automatically. Maven commands can still be run from inside eclipse.

##How to run##
    java -cp <distchat-DEMOx.jar> com.group7.distchat.<className> <args>
or
    ./rundistchat.sh <port> <interface name>

Distchat, the Server application takes two arguments, a port and the name of a network interface (eth0, wlan0, mlan0, em1, etc..). An exception will be thrown if the given 
interface does not support multicast. 

Distchat has two clients, a CLI one and a basic GUI one. Run the Client class for the CLI and the ClientGuiWndow for the GUI. The cooresponding shell scripts can be used to tun both as well (runcli.sh and run rungui.sh). The Clients make use of a file named `known_hosts` to populate it's inital list of Servers. Before running make sure these files exist in the current working directory.


