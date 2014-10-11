#!/bin/bash

#run idea и fireFox

#folder with script and properties file
ROOT_PATH=$(cd $(dirname $0) && pwd);

# get properties file
source "$ROOT_PATH/"setup.properties

#${runnable[0]} & echo ${runnable[0]} | grep '/[\w]'
#${runnable[1]} & echo ${runnable[1]} | grep 'idea'
${runnable[2]} &
    printf ${runnable[2]}
    echo " was running!"

exit 0