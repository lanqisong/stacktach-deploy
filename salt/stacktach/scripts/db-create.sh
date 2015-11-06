#! /bin/bash

# Create database for stacktach
mysql -u root -p {{ pillar['root_pass'] }} -h lb-db <<EOF
DROP DATABASE IF EXISTS stacktach;
CREATE DATABASE stacktach CHARACTER SET=utf8;
GRANT ALL PRIVILEGES ON stacktach.* TO 'stacktach'@'%' IDENTIFIED BY 'stacktach_pass';
EOF
