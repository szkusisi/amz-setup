https://rohhie.net/certification-authority-to-make-at-company/
https://dev.classmethod.jp/articles/manage-aws-client-vpn-client-certificates/
https://docs.aws.amazon.com/ja_jp/vpn/latest/clientvpn-admin/client-authentication.html#mutual
https://server-setting.info/centos/openvpn-revoke-client.html#revoke
https://qiita.com/worldmotor/items/f81718ada1433ba9c71c



https://server-setting.info/centos/private-ca-cert.html
=============================================================
sudo sed -i "s/XX$/JP/g" /etc/pki/tls/openssl.cnf

sudo sed -i "s/#stateOrProvinceName_default/stateOrProvinceName_default/g" /etc/pki/tls/openssl.cnf
sudo sed -i "s/Default Province$/Tokyo/g" /etc/pki/tls/openssl.cnf
=============================================================




git clone https://github.com/OpenVPN/easy-rsa.git
cd easy-rsa/easyrsa3
./easyrsa init-pki
./easyrsa build-ca nopass

./easyrsa build-server-full www.aiocr.de nopass
./easyrsa build-client-full client1.aiocr.de nopass
./easyrsa build-client-full client2.aiocr.de nopass

mkdir ~/aiocr.de/
cp pki/ca.crt ~/aiocr.de/
cp pki/issued/www.aiocr.de.crt ~/aiocr.de/
cp pki/private/www.aiocr.de.key ~/aiocr.de/

cp pki/issued/client1,aiocr.de.crt ~/aiocr.de
cp pki/private/client1.aiocr.de.key ~/aiocr.de/

cp pki/issued/client2.aiocr.de.crt ~/aiocr.de
cp pki/private/client2.aiocr.de.key ~/aiocr.de/

cd ~/aiocr.de/




# vi /etc/httpd/conf.d/ssl.conf
# ====================================
# SSLCertificateFile      /etc/letsencrypt/live/aiocr.de/cert.pem
# SSLCertificateKeyFile   /etc/letsencrypt/live/aiocr.de/privkey.pem
# SSLCertificateChainFile /etc/letsencrypt/live/aiocr.de/chain.pem
# ====================================

SSLCACertificateFile /etc/letsencrypt/live/aiocr.de/cacert.pem
SSLVerifyDepth 1

