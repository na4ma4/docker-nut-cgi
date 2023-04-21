# Docker-nut-cgi
Docker running nut-cgi.

## References
https://networkupstools.org

## Build
    docker build --pull -t nut-cgi:latest .

## Run
    $ docker run -d \
        --name nut-cgi \
        -p 8086:80 \
        -e NUT_HOSTS='MONITOR myups@myserver "The UPS"' \
        nut-cgi
