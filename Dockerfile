FROM debian:stretch
LABEL maintainer="abel.silva@gmail.com"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        sudo \
        psmisc \
        procps \
        lsb-release \
 && rm -rf /var/lib/apt/lists/*

RUN export DOWNLOAD_URL="https://portal.domotz.com/download/agent_packages/domotz-debian-x64-1.0-2.1.5-0354.deb" \
 && curl -L ${DOWNLOAD_URL} -o /tmp/domotz-agent.deb \
 && dpkg -i /tmp/domotz-agent.deb \
 && rm -f /tmp/domotz-agent.deb

ADD start.sh /srv/bin/start.sh
RUN chmod +x /srv/bin/start.sh

EXPOSE 3000
VOLUME /opt/domotz/var/cache
VOLUME /opt/domotz/var/log/domotz

CMD ["/srv/bin/start.sh"]
