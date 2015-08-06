#!/bin/bash
set -e
chown -R jenkins $DATA
exec su jenkins -c "java -jar /usr/share/jenkins/jenkins.war"
