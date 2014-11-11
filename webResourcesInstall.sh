#!/bin/bash
mvn install:install-file \
-Dfile=/home/rico/Dropbox/lib/gradle-web-resources-plugin-0.3.jar \
-DgroupId=com.haulmont.web -DartifactId=gradle-web-resources-plugin \
-Dversion=0.3 \
-Dpackaging=jar 
