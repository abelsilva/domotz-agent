#!/bin/sh

if [ ! -f "/opt/domotz/etc/domotz.env" ]
then
    cp /opt/domotz/etc.dist/domotz.env /opt/domotz/etc/domotz.env
fi

/etc/init.d/domotz start

sleep infinity
