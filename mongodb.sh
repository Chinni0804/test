#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .. $R Failed $N"
    else
        echo -e "$2 .. $G Success $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run as root access $N"
    exit 1 # We can give otherthan o
else
    echo "You are root user"
fi # fi means reverse of if indication conditon end

cp mongo.repo /etc/yum.repos.d

VALIDATE $? " Copied or sucess"

dnf install mongodb-org -y 

VALIDATE $? "Manogodb installed"  &>> $LOGFILE 

systemctl enable mongod

VALIDATE $? "enabled"

systemctl start mongod

VALIDATE $? "sTARTED"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>> $LOGFILE


VALIDATE $? "REMOTE ACCESS"

systemctl restart mongod

VALIDATE $? "Restarted manogdb"



