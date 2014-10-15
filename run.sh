#!/bin/bash



# path to your tomcat
tomcat_home=/home/rico/WebDev/haulmont/tomcat
# default site log
siteName=addlee

# при первом запуске томката еще нет лога аддлии, его надо подождать а потом открыть
# при запуске с параметром надо открывать только те логи которые не открыты
# неплохо бы сделать команду открывающую отдельно лог и закрывающую все либо названный лог


echo '##########################################################################'

function startTomcat {
     echo '    INFO:    Start Tomcat server'
#     "$tomcat_home/bin/startup.sh"
}

function stopTomcat {
     echo '    INFO:    Stop Tomcat server'
     kill -9 $(ps aux | grep '[t]omcat.*org.apache.catalina.startup.Bootstrap start' | awk '{printf $2}')
}

function killAllProcess {
    echo '    INFO: Stop Tomcat with all logs'
    kill -9 $(ps aux | grep '[t]omcat' | awk '{printf $2" "}')
    exit 0
}

function openLogs {

    dateNow=test date '+%x'
    dateOfCreationLogFile=test date -r "$tomcat_home/logs/$siteName/app.log" '+%x'

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
}

    # -- if paramert == x killAllProcesses
    [ "$1" = 'x' ] && killAllProcess

    # -- param is site name, write to siteName variable
    if [ -n "$1" ]
        then siteName=$1
    fi

    # -- run tomcat
    if [ 0 -eq "$(ps aux | grep '[t]omcat.*org.apache.catalina.startup.Bootstrap start' | wc -l)" ]
        then
            startTomcat
        else
            stopTomcat
            startTomcat
    fi

      # вариант 1
    # -- check the existence of the log ( siteName/app.log )
#    dateNow=test date '+%x'
#    dateOfCreationLogFile=test date -r "$tomcat_home/logs/$siteName/app.log" '+%x'
#    if [ "$date" = "$dateOfCreationLogFile" ]
#        then
#           echo '    INFO:   "app.log" already was created today, opening logs...'
#           openLogs
#        else
#            echo 'wait log creation'
#    fi

   # -- вариант 2

    openLogs


exit 0
