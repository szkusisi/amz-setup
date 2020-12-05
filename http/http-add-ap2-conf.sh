cd /etc/httpd/conf.d
sudo tee ap2.conf <<EOF
Listen 8882
NameVirtualHost *:8882
<VirtualHost *:8882>
DocumentRoot /var/www/html/ap2
ServerName ap2
</VirtualHost>
EOF

sudo mkdir /var/www/html/ap2
cd /var/www/html/ap2
sudo tee index.html <<EOF
ap2 8882
EOF

sudo systemctl restart httpd
curl http://127.0.0.1:8882/

