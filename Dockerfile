FROM wblankenship/dind-jenkins

ADD dante /bin/dante
ADD run.sh /usr/local/bin/run

CMD wrapdocker /usr/local/bin/run
