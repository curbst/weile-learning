#!/usr/bin/bash
#This script help you open your app

read -p "Enter Username: " Username
read -p "Enter Password: " Password

opener() {
  while true; do
    read -p "What app would you like to open: " app
    if [ "$app" == "exit" ]; then
      echo "Bye"
      break
    fi
    open -a $app
  done
}

if [ "$Username" = "Weile" ] && [ "$Password" = "272004" ]; then
  echo "Access Allowed

    Welcome to App_Opener
    Your id is 112203
    Script Version: 1.00.01 Wei's Safe App Terminal Opener - a

    Copyright (c) 2022, Wei's Corporation of Technology

    Wei's is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.
    
    "

  opener
else
  echo "Access Prohibited"
fi
