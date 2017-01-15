FROM java:8-jre

RUN apt-get update && apt-get install -y wget git curl zip && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/share/traccar/

WORKDIR /usr/share/traccar/

RUN wget https://github.com/tananaev/traccar/releases/download/v3.9/traccar-linux-3.8.zip

RUN unzip traccar-linux-3.8.zip

RUN ./traccar.run

VOLUME /opt/traccar/conf

RUN touch /opt/traccar/logs/tracker-server.log

EXPOSE 8082

ENTRYPOINT /opt/traccar/bin/startDaemon.sh && tail -f /opt/traccar/logs/tracker-server.log
