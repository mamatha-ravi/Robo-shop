#!/bin/bash

source ./common.sh
app_name=payment

Root_CHECK
app_setup
python_setup
systemd_setup
TOTAL_EXE_TIME