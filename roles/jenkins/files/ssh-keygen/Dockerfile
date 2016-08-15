FROM alpine:latest

RUN apk update && apk add --update openssh-client

COPY ./generate-key.sh /
RUN chmod 0755 /generate-key.sh
ENTRYPOINT ["/generate-key.sh"]
