FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx vim openssl

RUN mkdir -p /etc/nginx/ssl /var/run/nginx
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=ARA/L=Lyon/O=\"42 Lyon Auvergne Rhone-Alpes\"/OU=42/CN=emuminov.42.fr/UID=emuminov"

RUN chmod 600 /etc/nginx/ssl/inception.key && \
    chmod 644 /etc/nginx/ssl/inception.crt

COPY ./default /etc/nginx/nginx.conf

EXPOSE 443

# daemon off is important, as containers just with daemons shut down instantly
CMD ["nginx", "-g", "daemon off;"]
