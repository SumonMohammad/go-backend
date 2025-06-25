#!/usr/bin/env bash

go mod tidy  # for backend

declare -a arr=("portfolio" "oms-auth" "oms-user-management" "oms-portfolio")

for i in "${arr[@]}"
do
  if [ -z $SERVICE ] || [ "$SERVICE" = "$i" ] || [ "$SERVICE" = "" ]; then
    cd ../$i
    echo "Regenerate mod file for ../$i"
    #export GOSUMDB=off
    export GOPRIVATE=gitlab.techetronventures.com
    #rm -rf go.mod go.sum && go mod init &&  go mod tidy
    go mod tidy
    cd - 1>/dev/null 2>&1
  fi
done