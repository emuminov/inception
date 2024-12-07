FROM debian:bullseye 

# nodejs for serving the website
RUN apt update -y && apt upgrade -y && apt install -y nodejs npm

COPY ./website /app

WORKDIR /app

RUN npm install

EXPOSE 9000

CMD ["node", "index.js"]
