FROM debian:latest

RUN apt update && apt install -y wget
RUN mkdir -p /opt/speedtest
RUN cd /opt/speedtest && wget https://install.speedtest.net/ooklaserver/stable/OoklaServer.tgz \
	&& tar xvfz OoklaServer.tgz OoklaServer-linux64.tgz \ 
	&& tar xvfz OoklaServer-linux64.tgz && chmod a+x OoklaServer \
	&& chown root:root OoklaServer \
	&& mv OoklaServer.properties.default OoklaServer.properties && rm OoklaServer-linux64.tgz OoklaServer.tgz \
	&& sed -i "s/# OoklaServer\.enableAutoUpdate = true/OoklaServer.enableAutoUpdate = true/g" OoklaServer.properties
WORKDIR /opt/speedtest
CMD ["./OoklaServer"]
