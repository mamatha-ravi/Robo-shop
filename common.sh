#!/bin/bash
USER_ID=$(id -u)
R='\e[31m'
G='\e[32m'
Y='\e[33m'
B='\e[34m'
N='\e[0m'   # No Color
log_folder="var/log/Robo-shop"
log_file="$log_folder/$0.log"
START_TIME=$(date +%s)


Root_CHECK(){
    if [ $USER_ID -ne 0 ]; then\
    echo -e "$R Please run script with Root User $N"
    exit 1
}
VALIDATE(){
    if [ $? -eq 0 ]; then
    echo -e "$(date "+%Y %m %d %H:%M:%S") | $2...$G Success $N"
    else
    echo -e "$(date "+%Y %m %d %H:%M:%S") | $2...$R Failure $N"
}
TOTAL_EXE_TIME(){
    END_TIME=$(date %s)
    TOTAL_TIME=$(($END_TIME-$START_TIME))
    echo "$SCRIPT executed in : $TOTAL_TIME"
}