<Virtualhost *:443>
DocumentRoot /var/www/html/www.test.rece
ServerName www.test.rece

SSLEngine On
SSLProtocol all -SSLv2

SSLCertificateFile /etc/pki/tls/private/www.test.rece.crt
SSLCertificateKeyFile /etc/pki/tls/private/www.test.rece.key
SSLCACertificateFile /etc/pki/tls/private/ca.crt
</VirtualHost>


<Virtualhost *:443>
DocumentRoot /var/www/html/staff.test.rece
ServerName staff.test.rece

SSLEngine On
SSLProtocol all -SSLv2

SSLCertificateFile /etc/pki/tls/private/staff.test.rece.crt
SSLCertificateKeyFile /etc/pki/tls/private/staff.test.rece.key
SSLCACertificateFile /etc/pki/tls/private/ca.crt
</VirtualHost>


