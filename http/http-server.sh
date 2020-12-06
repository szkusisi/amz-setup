HOSTNAME=test-www

sudo hostnamectl set-hostname $HOSTNAME
sudo timedatectl set-timezone Asia/Tokyo


sudo yum install -y httpd mod_ssl
sudo cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.org
sudo sed -i "s/#ServerName www.example.com:80/ServerName localhost:80/g" /etc/httpd/conf/httpd.conf

# Log X-forword-For
# Virtualhost
# SSL


sudo systemctl status httpd
sudo systemctl start httpd
sudo systemctl status httpd
sudo systemctl enable httpd


# htmlファイル作成
cd /var/www/html/
sudo tee index.html <<EOF
$HOSTNAME
EOF
