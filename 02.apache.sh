# update
sudo amazon-linux-extras install epel -y
sudo yum install -y certbot python3-certbot-apache httpd mod_ssl

# Let's Encryptでワイルドカード証明書
# 適宜修正
certbot certonly --manual -d <FQDN> -m <MAIL> --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01


# 成功すると
cd /etc/letsencrypt/live/aiocr.de/
ls
#====================================
#README  cert.pem  chain.pem  fullchain.pem  privkey.pem
#====================================
# cert.pem       ⇒ SSLサーバー証明書(公開鍵含む)
# chain.pem      ⇒ 中間証明書
# fullchain.pem  ⇒ cert.pem と chain.pem が結合されたファイル
# privkey.pem    ⇒ 公開鍵に対する秘密鍵

# SSL設定
# vi /etc/httpd/conf.d/ssl.conf
# ====================================
# SSLCertificateFile      /etc/letsencrypt/live/<FQDN>/cert.pem
# SSLCertificateKeyFile   /etc/letsencrypt/live/<FQDN>/privkey.pem
# SSLCertificateChainFile /etc/letsencrypt/live/<FQDN>/chain.pem
# ====================================

sudo systemctl status httpd
sudo systemctl start httpd
sudo systemctl status httpd


# htmlファイル作成
cd /var/www/html/
sudo tee index.html <<EOF
<html>
  <head>
  </head>
  <body>
    <p>Hello World!</p>
  </body>
</html>
EOF

