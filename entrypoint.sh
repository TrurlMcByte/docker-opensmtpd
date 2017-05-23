#!/bin/sh
chown -R root.root /var/spool/smtpd
chmod 0711 /var/spool/smtpd
chown -R 101.root /var/vmail /var/spool/smtpd/purge /var/spool/smtpd/queue /var/spool/smtpd/corrupt
chmod 0700 /var/spool/smtpd/purge
chown -R root.102 /var/spool/smtpd/offline
chmod 0770 /var/spool/smtpd/offline
test -f /etc/smtpd/smtpd.conf || cp /smtpd.conf.sample /etc/smtpd/smtpd.conf
exec "$@"
