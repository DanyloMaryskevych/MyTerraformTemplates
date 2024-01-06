#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "<h2>This instance is lunched in fully my created vpc. P.S. I feel the pomazanie! Eeeep booy</h2>" > /var/www/html/index.html