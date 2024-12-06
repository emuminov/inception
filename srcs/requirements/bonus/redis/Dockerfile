FROM debian:bullseye 

RUN apt update -y && apt upgrade -y && apt install -y redis

EXPOSE 6379

# to check if the redis is working:
# inside the container `redis-cli -h <redis_container_name> -p 6379 ping`
# the server should return PONG
CMD ["redis-server", "--protected-mode", "no"]
