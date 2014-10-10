#!/bin/bash


scriptName=$0
paramertName=$1

echo "scipt name is $scriptName"
echo "parametr name is $paramertName"

echo $DIRSTACK

if [[ "$scriptName" -eq  1231 ]]
    then
        echo "fail"
    else
      echo "success"
      echo $scriptName
fi

exit 0