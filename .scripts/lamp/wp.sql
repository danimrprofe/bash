#DROP DATABASE wp_myblog;
CREATE DATABASE wp_myblog;
#DROP USER 'wpuser'@'localhost';
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'Passw0rd1';
GRANT ALL ON wp_myblog.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
