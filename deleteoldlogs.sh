#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/tmp/shellscript-logs"

if [ ! -d $SOURCE_DIR ] # -d not exits directory
then    
    echo -e "$R Source directory: $SOURCE_DIR not exits $N"
fi


FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
    echo "Deleting file: $line"

    rm -rf $line

done <<< $FILES_TO_DELETE


