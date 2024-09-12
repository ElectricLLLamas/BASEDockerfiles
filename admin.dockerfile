FROM alpine:3.20.2
LABEL author=23skdu@users.noreply.github.com
RUN apk update && apk add --no-cache vim net-tools netcat-openbsd bind-tools
CMD ["nc","-l","8888"]
