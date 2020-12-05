cd /etc/httpd/conf.d
sudo tee ap1.conf <<EOF
Listen 8881
NameVirtualHost *:8881
<VirtualHost *:8881>
DocumentRoot /var/www/html/ap1
ServerName ap1
</VirtualHost>
EOF

sudo mkdir /var/www/html/ap1
cd /var/www/html/ap1
sudo tee index.html <<EOF
ap1 8881
EOF

sudo systemctl restart httpd
curl http://127.0.0.1:8881/

