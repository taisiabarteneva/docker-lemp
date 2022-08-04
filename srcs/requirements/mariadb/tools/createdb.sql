CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'wurrigon'@'%' IDENTIFIED BY 'pseudoroot';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wurrigon'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'superroot';