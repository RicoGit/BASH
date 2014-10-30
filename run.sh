#!/bin/bash


# path to your tomcat
# tomcat_home=/home/rico/WebDev/haulmont/tomcat
tomcat_home=/home/rico/webdev/haulmont/tomcat
# default site log
siteName=addlee

# при запуске с параметром надо открывать только те логи которые не открыты
# неплохо бы сделать команду открывающую отдельно лог и закрывающую все либо названный лог

# рефакторинг, положить в переменную путь к логам

echo '##########################################################################'

function startTomcat {
     echo '     INFO:    Start Tomcat server'
    "$tomcat_home/bin/startup.sh"
}

function stopTomcat {
     echo '     INFO:    Stop Tomcat server'
     kill -9 $(ps aux | grep '[t]omcat.*org.apache.catalina.startup.Bootstrap start' | awk '{printf $2}')
}

function killAllProcess {
    echo '      INFO: Stop Tomcat with all logs'
    kill -9 $(ps aux | grep '[t]omcat' | awk '{printf $2" "}')
    exit 0
}

function openLogs {

    # if logs is not open yet
    if [ 0 -eq "$(ps x | grep -E 'tail -f .*\.(log|out)' | wc -l)" ]
        then
            echo '      INFO:    Open terminal with logs'
            gnome-terminal --tab -t 'catalina' \
                    -e "tail -f $tomcat_home/logs/catalina.out" \
                    --tab -t "$siteName" \
                    -e "tail -f $tomcat_home/logs/$siteName/app.log"
        else
            echo '      INFO:    Skip show log cause log is already running'
    fi
}


##### Script body #######

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

    dateNow=`date "+%Y-%m-%d"`
    dateOfCreationLogFile=`date -r "$tomcat_home/logs/$siteName/app.log" "+%Y-%m-%d"`

    # check today log existing 
    if [ "$dateNow" == "$dateOfCreationLogFile" ]
        then 
            echo "      INFO:   $siteName/app.log exists"
        else
            echo "      INFO:   create for today $siteName/app.log"
            # save old log
            mv "$tomcat_home/logs/$siteName/app.log" "$tomcat_home/logs/$siteName/app.log.$dateOfCreationLogFile" 
            # create new
            touch "$tomcat_home/logs/$siteName/app.log"    
    fi
    # open logs
    openLogs


exit 0
