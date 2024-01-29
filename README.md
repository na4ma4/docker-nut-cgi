# Docker-nut-cgi

Docker running nut-cgi.

## References

https://networkupstools.org

## Build

```shell
docker build --pull -t danchal/nut-cgi:latest .
```

## Push

```shell
docker push danchal/nut-cgi:latest
```

## Run

```shell
$ docker run -d \
    --name nut-cgi \
    -p 8086:80 \
    -e NUT_HOSTS='MONITOR myups@myserver "The UPS"' \
    -e NUT_ALLOW_SET=yes \
    danchal/nut-cgi
```
