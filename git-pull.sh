#!/bin/bash


echo " 🧲 pulling the main branch of all repositories from git 🧲 "
echo "♠backend"
git pull origin main

declare -a arr=("portfolio" "oms-auth" "oms-user-management" "oms-portfolio")

for i in "${arr[@]}"
do
  if [ -z $SERVICE ] || [ "$SERVICE" = "$i" ] || [ "$SERVICE" = "" ]; then
    cd ../$i
    echo ⏳$i
    git pull origin main
    cd - 1>/dev/null 2>&1
  fi
done