#!/usr/bin/env bash

HOST=127.0.0.1
REDIS_PORT=6379

redis-server --daemonize yes

echo "Start waiting for Redis fully start. Host '$HOST', '$REDIS_PORT'..."
echo "Try ping Redis... "
PONG=`redis-cli -h $HOST -p $REDIS_PORT ping | grep PONG`
while [ -z "$PONG" ]; do
    sleep 1
    echo "Retry Redis ping... "
    PONG=`redis-cli -h $HOST -p $REDIS_PORT ping | grep PONG`
done
echo "Redis at host '$HOST', REDIS_PORT '$REDIS_PORT' fully started."

export ENV=PROD

Rscript R/app.R