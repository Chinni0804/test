#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [$ID -ne 0]
then
    echo -e "$R ERROR:: Please run as root access $N"
    exit 1 # We can give otherthan o
else
    echo "You are root user"
fi # fi means reverse of if indication conditon end

echo " All Arguement pass: $@"