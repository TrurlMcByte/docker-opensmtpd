#!/bin/sh
#
CON_NAME=opensmtpd
IMG_VER=latest
IMG_BASE_NAME="trurlmcbyte/opensmtpd"
IMG_NAME="$IMG_BASE_NAME:$IMG_VER"

set -eo pipefail
test -f ./build.log && mv -fb ./build.log ./build.log.old
docker build --pull -t $IMG_NAME . | tee ./build.log
set +e
set +o pipefail

docker stop -t 2 $CON_NAME
docker rm $CON_NAME

docker run -d  --restart=always --name $CON_NAME \
    --log-opt max-size=5m \
    -p 125:25 \
    -l port.25=smtp \
    -p 587:587 \
    -l port.587=mta \
    -v /srv/docker/opensmtpd/etc:/etc/smtpd:ro \
    -v /srv/docker/opensmtpd/var:/var/vmail:rw \
    -v /srv/docker/opensmtpd/spool:/var/spool/smtpd:rw \
    $IMG_NAME

sleep 2s
echo -en "\007"
echo -en "\007" > /dev/console

#read

#if curl -s http://home.mcbyte.net:5280/http-bind | grep -q "It works" ; then
#   echo "Build $IMG_NAME is OK"
#   docker tag $IMG_NAME $IMG_BASE_NAME:latest
#   docker push $IMG_BASE_NAME
#fi

