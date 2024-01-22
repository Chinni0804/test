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

dnf module disable nodejs -y ;
dnf module enable nodejs:18 -y

VALIDATE $? "enabled nodejs"

dnf install nodejs -y

VALIDATE $? "Installed nodejs"

#useradd roboshop

id roboshop

if [ $? -ne 0 ]
then
    useradd roboshop
    VALIDATE $? "roboshop useradded"
else
    echo -e "roboshop user already exit $G skopping $N"

VALIDATE $? "useradded"

mkdir -p /app #-p will not throw error if dir not there it will create or else it will skip

curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip

unzip -o /tmp/catalogue.zip

VALIDATE $? "unzipped"

cd /app

npm install 

VALIDATE $? "installed npm"

cp /home/centos/test/catalogue.service /etc/systemd/system/catalogue.service

VALIDATE $? "copied cs"

systemctl daemon-reload

VALIDATE $? "reload"

systemctl enable catalogue

systemctl start catalogue

cp /home/centos/test/mongo.repo /etc/yum.repos.d/mongo.repo

VALIDATE $? "Repo copied"

dnf install mongodb-org-shell -y

VALIDATE $? "MONOGDB INSTALLED"

mongo --host 172.31.45.40 </app/schema/catalogue.js

