#!/bin/bash

ID=$(id-u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "ERROR:: $2 .... Myql fail"
    else
        echo "Install $2 ...  sucess"
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

VALIDATE $? "Mysql Success"

yum install git -y

VALIDATE $? "Installing git"
