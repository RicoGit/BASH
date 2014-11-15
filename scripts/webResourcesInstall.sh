#!/bin/bash

# install gradle-web-resources-plugin-0.3.jar into maven local repository

path=/home/rico/Dropbox/lib

mvn install:install-file \
-Dfile="$path/gradle-web-resources-plugin-0.3.jar" \
-DgroupId=com.haulmont.web -DartifactId=gradle-web-resources-plugin \
-Dversion=0.3 \
-Dpackaging=jar
