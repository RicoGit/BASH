# -- что использовать для запуска
#!/bin/bash


function usage {
    echo "Usage:"
    echo "$0 project build_name/number server"
    echo
    echo "Example:"
    echo "$0 tbs build_2_8_3/50000 tbsspare01"
    exit 2
}

([ "$1" == "" ] || [ "$(echo "$2" | egrep '/[0-9]{5}')" == "" ] || [ "$3" == "" ] || [ "$4" != "" ] ) && usage
project="$1"
foldername="$2"
server="$3"
filename="$(echo "$foldername.tar.gz" | tr '/' '@')"

function upload_addison_lee {
    ssh -i ~/.ssh/readonly_rsa -p 1301 readonly@91.213.230.65 "cd /var/www/html/builds && md5sum -c $filename.md5 > /dev/null"
    if [ "$?" != "0" ]; then
        echo "Build not found on shamrock-repo, loading from shamrock-builder"

        cd /run/shm
        ssh -i ~/.ssh/readonly_rsa readonly@shamrock-builder "cd /data/artifacts/$project && tar -czf - $foldername" > $filename
        if [ "$?" != "0" ]; then
            rm -f $filename
            exit 1
        fi

        md5sum $filename > $filename.md5
        scp -i ~/.ssh/readonly_rsa -P 1301 $filename.md5 $filename readonly@91.213.230.65:/var/www/html/builds
        if [ "$?" != "0" ]; then
            rm -f $filename $filename.md5
            exit 1
        fi
        rm -f $filename $filename.md5
    fi

    ssh -i ~/.ssh/readonly_rsa readonly@$server "cd /tmp && wget shamrock-repo/builds/$filename -O - | tar -xzf - --touch" || exit 1
}

function upload_haulmont {
    echo "Loading build from shamrock-builder"

    cd /run/shm
    ssh -i ~/.ssh/readonly_rsa readonly@shamrock-builder "cd /data/artifacts/$project && tar -czf - $foldername" > $filename
    if [ "$?" != "0" ]; then
        rm -f $filename
        exit 1
    fi

    cat $filename | ssh -i ~/.ssh/readonly_rsa readonly@$server "cd /tmp && tar -xzvf - --touch"
    result="$?"
    rm -f $filename
    exit "$result"
}

ip="$(ping -q -c 1 -W 1 $server | grep PING | sed -e "s/^[^(]*[(]//" | sed -e "s/[)].*$//")"
echo "Target server: $server ($ip)"

if [[ "$(echo "$ip" | egrep '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$')" == "" ]]; then
    echo "IP address doesn't look right"
    exit 2
fi

if [[ "$(echo "$ip" | egrep '172\.22\.100\.[0-9]{1,3}')" != "" ]] || [[ "$(echo "$ip" | egrep '192\.168\.44\.[0-9]{1,3}')" != "" ]]; then
    echo "This is a $(tput setaf 6)HAULMONT$(tput sgr0) server"
    upload_haulmont
else
    echo "This is an $(tput setaf 3)ADDISON LEE$(tput sgr0) server"
    upload_addison_lee
fi

