#!/bin/sh




# path to tomcat
tomcat_home=/home/rico/WebDev/haulmont/tomcat
# default site log
siteName=addlee




echo '################################################'





# -- init siteName from first param
if [ -n "$1" ]
    then siteName=$1
fi


# -- run tomcat
if [ 0 -eq "$(ps aux | grep '[t]omcat.*org.apache.catalina.startup.Bootstrap start' | wc -l)" ]
    then
       echo '    INFO:    Start Tomcat server'
      "$tomcat_home/bin/startup.sh"
    else
        echo '    INFO:    Stop Tomcat Server'
        kill -9 $(ps aux | grep '[t]omcat.*org.apache.catalina.startup.Bootstrap start' | awk '{printf $2}')
        echo '    INFO:    Start Tomcat server'
        "$tomcat_home/bin/startup.sh"
fi


# -- show logs
if [ 0 -eq "$(ps x | grep -E 'tail -f .*\.(log|out)' | wc -l)" ]
    then
        echo '    INFO:    Open terminal with logs'
        gnome-terminal --tab -t 'catalina' \
                -e "tail -f $tomcat_home/logs/catalina.out" \
                --tab -t "$siteName" \
                -e "tail -f $tomcat_home/logs/$siteName/app.log"
    else
        echo '    INFO:    Skip show log cause log is already running'
fi


#  сделсть опцию убить все процессы (switch case)
#  прибраться в коде