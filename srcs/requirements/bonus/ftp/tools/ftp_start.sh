#!/bin/bash
adduser $FTP_USER --disabled-password --gecos "" --quiet &> /dev/null
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null

mkdir /home/$FTP_USER/ftp/files -p
chown nobody:nogroup /home/$FTP_USER/ftp

chmod a-w /home/$FTP_USER/ftp
chown -R "$FTP_USER:$FTP_USER" /home/$FTP_USER

echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

exec "$@"
