#!/bin/sh
chown -R root.root /var/spool/smtpd
chmod 0711 /var/spool/smtpd
chown -R 101.root /var/vmail /var/spool/smtpd/purge /var/spool/smtpd/queue /var/spool/smtpd/corrupt
test -f /etc/smtpd/smtpd.conf || cp /smtpd.conf.sample /etc/smtpd/smtpd.conf
exec "$@"
