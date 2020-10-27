#!/bin/sh

CONF_DIR=/etc/apache2/conf.d
envsubst < $CONF_DIR/gateway.conf.template > $CONF_DIR/gateway.conf && cat $CONF_DIR/gateway.conf

exec /usr/sbin/httpd -D FOREGROUND -f ${APACHE_DEFAULT_CONF}

