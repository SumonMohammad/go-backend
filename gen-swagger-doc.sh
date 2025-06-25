#!/bin/bash


echo "generating swagger docker image && get updated swagger json"


declare -a arr=("portfolio" "oms-auth" "oms-user-management" "oms-portfolio")

for i in "${arr[@]}"
do
  if [ -z $SERVICE ] || [ "$SERVICE" = "$i" ] || [ "$SERVICE" = "" ]; then
    cd ../$i
    echo $i
    cp -r docs/swagger/*.swagger.json ../backend/integration/swagger/
    cd - 1>/dev/null 2>&1
  fi
done