# Rootless ttyd lab for online deployment
FROM alpine:latest

# Install bash, ttyd, figlet, curl, git
RUN apk add --no-cache bash figlet ttyd curl git docker-cli

WORKDIR /usr/local/bin

COPY lab.sh setup_OS.sh start.sh .

RUN chmod +x *.sh

EXPOSE 7681

ENTRYPOINT ["sh","/usr/local/bin/start.sh"]
