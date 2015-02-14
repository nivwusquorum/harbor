FROM redis

COPY redis.conf /usr/local/etc/redis/redis.conf
COPY redis-password.conf /usr/local/etc/redis/redis-password.conf

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
