#! /bin/bash

# Create database for stacktach
mysql <<EOF
DROP DATABASE IF EXISTS stacktach;
CREATE DATABASE stacktach CHARACTER SET=utf8;
GRANT ALL PRIVILEGES ON stacktach.* TO 'stacktach'@'%' IDENTIFIED BY 'stacktach_pass';
EOF
