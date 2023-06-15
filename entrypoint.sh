#!/bin/sh
echo "Starting nut-cgi, build date $(cat /build-date.txt)"
echo "${NUT_HOSTS}"

# setup list of monitored ups hosts
cp /etc/nut/hosts.conf.original /etc/nut/hosts.conf

IFS=';'
for host in $NUT_HOSTS
do
    echo "${host}" >> /etc/nut/hosts.conf
done

if [ ! -z ${NUT_AUTH} ]; then
    echo "${NUT_AUTH}" > /etc/lighttpd/lighttpd.user
    (
        echo 'server.modules += ( "mod_auth", "mod_authn_file" )'
        echo 'auth.backend = "plain"'
        echo 'auth.backend.plain.userfile  = "/etc/lighttpd/lighttpd.user"'
        echo 'auth.require = ( "" => ("method" => "basic", "realm" => "example", "require" => "valid-user") )'
    ) > "/etc/lighttpd/conf-enabled/05-auth.conf"
fi

/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
