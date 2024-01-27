#/bin/bash

DISK_USAGE=$(df -hT | grep 'tmp|file')
DISK_THRESHOLD=1
message=""

while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' cut -d % -f1)
    #df -hT | grep -vE 'tmp|File' | awk '{print: $6F}' | cut -d % f1
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -ge $DISK_THRESHOLD ]
    then 
        message+="High Disk usage on $partition: $usage"

    done <<< $DISK_USAGE

    echo "Message: $message"
