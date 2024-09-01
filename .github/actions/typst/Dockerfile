FROM ghcr.io/typst/typst:latest
RUN  apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing font-fira-ttf
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
