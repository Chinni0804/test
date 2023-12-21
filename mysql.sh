#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR :: Please run as root user"

else 
    echo " Your ar root user"
fi