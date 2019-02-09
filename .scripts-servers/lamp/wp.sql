CREATE DATABASE wp_myblog;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'Passw0rd1';
GRANT ALL ON wp_myblog.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
