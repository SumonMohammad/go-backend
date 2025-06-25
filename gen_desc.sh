#!/usr/bin/env bash 


declare -a arr=("portfolio" "oms-auth" "oms-user-management" "oms-portfolio")

for i in "${arr[@]}"
do
  if [ -z $SERVICE ] || [ "$SERVICE" = "$i" ] || [ "$SERVICE" = "" ]; then
    cd ../$i
    echo "generating protobuf for ../$i"
    go generate ./...
    cd - 1>/dev/null 2>&1
  fi
done

go generate ./...