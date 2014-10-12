#!/bin/bash

param=$1
commandKillAll='x'

echo "$param"


# -- Simple compare strings

if [ "$param" = 'x' ]
    then
        echo "First param is $param"
    else
        echo "First param is not $commandKillAll"
fi

echo "###########################################################"

# -- complex

if [ -n "$param" ] && [ "$param" = "$commandKillAll" ]
    then
        echo "First param is $param"
    else
        echo "First param is not $commandKillAll"
fi

# -- simolify form

[ -n "$param" ] && [ "$param" = 'x' ] && echo "True, First param is x"


echo '##############################################################'

function some {
  echo "Start \'some\' function"
}

some

