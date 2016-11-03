# docker-opensmtpd
dockerized opensmtpd

# usage
```
docker run -d  --restart=always --name opensmtpd \
    --log-opt max-size=5m \
    -p 125:25 \
    -p 587:587 \
    -v /srv/docker/opensmtpd/etc:/etc/smtpd \
    -v /srv/docker/opensmtpd/var:/var/vmail \
    -v /srv/docker/opensmtpd/spool:/var/spool/smtpd \
     trurlmcbyte/opensmtpd
```

