FROM debian
MAINTAINER Steven Jack <stevenmajack@gmail.com>

RUN apt-get update
RUN apt-get install git-buildpackage -y

WORKDIR /app

COPY run.sh /run.sh
RUN chmod u+x /run.sh

ENTRYPOINT ["/run.sh"]
