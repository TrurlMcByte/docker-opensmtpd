FROM alpine:latest

RUN apk add --no-cache ca-certificates opensmtpd \
    && addgroup -S vmail \
    && adduser -S -h /var/vmail -g 'Virtual Mail' -s /sbin/nologin -G vmail vmail

ADD entrypoint.sh /entrypoint.sh
ADD smtpd.conf /smtpd.conf.sample
VOLUME ["/etc/smtpd", "/var/vmail", "/var/spool/smtpd/"]

EXPOSE 25 587

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/smtpd","-d"]

