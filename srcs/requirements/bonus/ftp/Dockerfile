FROM debian:bullseye 

RUN apt update && apt upgrade -y && apt install -y vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/ftp_start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/ftp_start.sh

RUN service vsftpd start

ENTRYPOINT ["ftp_start.sh"]

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
