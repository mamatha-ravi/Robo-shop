#!/bin/bash

source ./common.sh
Root_CHECK
cp mongo.repo /etc/yum.repos.d/mongo.repo
validate "copying mongo repo"

dnf install mongodb-org -y &>>$log_file
validate "Installing Mongodb server"

systemctl enable mongod 
validate "enabling mongodb"
systemctl start mongod 
validate "starting mongodb"

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mongod.conf
validate "allowing remote connections"

systemctl restart mongod
validate "restarted mongodb"

TOTAL_EXE_TIME