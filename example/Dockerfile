FROM alpine:latest

RUN apk add --update --no-cache bash

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]