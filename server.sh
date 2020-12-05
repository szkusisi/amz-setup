HOSTNAME=test123



sudo hostnamectl set-hostname $HOSTNAME
sudo timedatectl set-timezone Asia/Tokyo

sudo yum install -y httpd mod_ssl

sudo systemctl status httpd
sudo systemctl start httpd
sudo systemctl status httpd
sudo systemctl enable httpd


# htmlファイル作成
cd /var/www/html/
sudo tee index.html <<EOF
$HOSTNAME
EOF
