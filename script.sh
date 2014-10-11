#!/bin/bash


scriptName=$0
paramertName=$1

echo "scipt name is $scriptName"
echo "parametr name is $paramertName"

echo $DIRSTACK

if [[ paramertName -eq  qwer ]]
    then
        echo "success"
        exit 0
    else
      echo "fail"
      exit 1
fi

