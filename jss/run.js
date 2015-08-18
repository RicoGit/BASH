#!/usr/bin/jjs -scripting

var tomcatDir_default = '/home/rico/webdev/tomcat';
var tomcatDir_7 = '/home/rico/webdev/haulmont/tomcat7';
var tomcatDir_8 = '/home/rico/webdev/haulmont/tomcat';

//print($ARG.length);

if ($ARG.length > 0) {

    var args = [];

    $ARG.forEach(function(arg) {

        var pare = arg.split('=');

        if (pare.length > 0) {

            var paramKey =    pare[0];
            var paramValue1 = pare[1];
            var paramValue2 = pare[2];

            switch (paramKey) {

                case 'start':
                    startTomcat(getTomcatPath(paramValue1));
                    break;
                case 'stop':
                    stopTomcat(getTomcatPath(paramValue1));
                    break;
                case 'x':
                    killAllProcessTomcat();
                    break;
                case 'log':
                    startLog(paramValue1, paramValue2);
                    break;
                default:
                    print('\n       WARN: "' + arg + '" is unknown key\n')
           }
        }

    });
}

/* Functions */

function getTomcatPath(tomcatCode) {
    switch (tomcatCode) {
        case 7:  return tomcatDir_7;
        case 8:  return tomcatDir_8;
        default:return tomcatDir_default
    }
}

function startTomcat(tomcatPath) {
    print('\n       INFO:   Start Tomcat server\n');
    print($EXEC(tomcatPath + '/bin/startup.sh'));
}

function stopTomcat(tomcatPath) {
     print('\n      INFO:   Stop Tomcat server\n');
     print($EXEC(tomcatPath + "/bin/shutdown.sh"));
}

function killAllProcessTomcat() {
    print('\n      INFO:   Stop Tomcat with all logs\n');
    print($EXEC("kill -9 $(ps aux | grep '[t]omcat' | awk '{printf $2\' \'}')"));
    exit();
}

function startLog(siteName, tomcatCode) {

    print('\n      INFO:    Open logs for ' + siteName + '\n');

    var command = 
    "gnome-terminal --tab --command 'pwd'";
    print($EXEC(command));
    print($ERR);
    print(command);
}


function x(x) {
	print('x='+x);
}

function y(y) {
	print('y='+y);

    // var command = "gnome-terminal " +
        // "--tab -t 'catalina'        -e 'tail -f " + getTomcatPath(tomcatCode) + "/logs/catalina.out' " +
        // "--tab -t '" + siteName + "' -e 'tail -f " + getTomcatPath(tomcatCode) + "/logs/" + siteName + "/app.log'";


}