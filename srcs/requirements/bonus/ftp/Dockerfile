FROM debian:bullseye 

RUN apt update -y && apt upgrade -y && apt install -y vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/ftp_start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/ftp_start.sh

RUN service vsftpd start

ENTRYPOINT ["ftp_start.sh"]

# to test: ftp -p localhost 21
# enter $FTP_USER and $FTP_PASSWORD
# cd files
# get <any file that is on the wordpress volume>
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
