#!/bin/sh
mkdir -p /var/spool/smtpd
chown -R root.root /var/spool/smtpd
chmod 0711 /var/spool/smtpd
mkdir -p /var/vmail
mkdir -p /var/spool/smtpd/purge
mkdir -p /var/spool/smtpd/queue
mkdir -p /var/spool/smtpd/corrupt
chown -R 101.root /var/vmail /var/spool/smtpd/purge /var/spool/smtpd/queue /var/spool/smtpd/corrupt
chmod 0700 /var/spool/smtpd/purge
mkdir -p /var/spool/smtpd/offline
chown -R root.102 /var/spool/smtpd/offline
chmod 0770 /var/spool/smtpd/offline
test -f /etc/smtpd/smtpd.conf || cp /smtpd.conf.sample /etc/smtpd/smtpd.conf
exec "$@"
