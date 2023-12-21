#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR :: Please run as root user"
    exit 1 

else 
    echo " Your ar root user"
fi

yum install mysql -y