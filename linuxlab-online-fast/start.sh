#!/bin/sh

dockerd-entrypoint.sh &

until docker info >/dev/null 2>&1; do
  sleep 1
done

exec ttyd -W -p 7681 /usr/local/bin/lab.sh

