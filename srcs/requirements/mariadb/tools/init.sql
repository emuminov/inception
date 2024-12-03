CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'DUMMY_USER'@'%' IDENTIFIED BY 'DUMMY_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'DUMMY_USER'@'%';
FLUSH PRIVILEGES;
