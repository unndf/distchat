#!/bin/sh
#database exists
if [ "$#" -ne 2 ]; then
    echo "You must supply a port and network interface!"
    echo "Use the network interface that the server will be communicating with (ie. mlan0, eth0, em1, eth0, etc...)"
    echo "Usage: ./rundistchat.sh <port> <network interface>"
    exit
fi

if [ ! -e h2-1.4.193.jar ] 
then
    echo "h2 not found"
    echo "Downloading h2 from http://repo2.maven.org/maven2/com/h2database/h2/1.4.193/"
    wget "http://repo2.maven.org/maven2/com/h2database/h2/1.4.193/h2-1.4.193.jar"
fi

if [ -e distchat.mv.db ]
    then
        echo "Database already exists"
        echo "Starting h2 as daemon..."
        java -cp "h2-1.4.193.jar" org.h2.tools.Server -web &
        DB_PID=$!
    else
        #create database in cwd
        echo "Database does not exist"
        echo "Creating database..."
        java  -cp "h2-1.4.193.jar" org.h2.tools.RunScript -url jdbc:h2:./distchat -script distchat.db.schema.sql -user sa
        echo "Starting h2 as daemon..."
        java -cp "h2-1.4.193.jar" org.h2.tools.Server -web &
        DB_PID=$!
fi

#start application
echo "Starting Distchat"
java  -cp "*:target/*" com.group7.distchat.Distchat $1 $2

echo "SIGKILL h2..."
kill -n 9 $DB_PID #SIGKILL DB
echo "Done :)"
