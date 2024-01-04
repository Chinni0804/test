#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
N="\e[33m"

echo "$0"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "ERROR:: $2 .... $R Myql fail"
    else
        echo -e "Install $2 ... $G sucess"
    fi

}

if [ $ID -ne 0]
then
    echo " ERROR:: Please run as root user"
    exit 1
else
    echo " you are a root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? -e  " $G Mysql Success"

yum install git -y &>> $LOGFILE

VALIDATE $? -e  " $G Installing git Sucess"
