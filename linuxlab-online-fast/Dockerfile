FROM docker:27-dind

RUN apk update && apk add ttyd figlet

LABEL AUTHOR="Pratik Mule"

WORKDIR /usr/local/bin/

COPY lab.sh start.sh  .

RUN chmod +x lab.sh start.sh

EXPOSE 7681
ENTRYPOINT ["sh","/usr/local/bin/start.sh"]
