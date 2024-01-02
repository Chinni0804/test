#!/bin/bash

ID=$(id-u)

VALIDATE(){
    if [ $? -ne 0 ]
    then 
        echo "Myql fail"
    else
        echo "Install myql sucess"
    fi

}

if [$ID -ne 0]
then
    echo " ERROR:: Please run as root user"
    exit 1
else
    echo " you are a root user"
fi

yum install mysql -y

VALIDATE

yum install git -y

VALIDATE
