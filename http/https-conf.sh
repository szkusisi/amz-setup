
<Virtualhost *:443>
ServerName ssl1
DocumentRoot /var/www/html/ssl1

SSLEngine On
SSLProtocol all -SSLv2

SSLCertificateFile /etc/pki/tls/private/ssl1.crt
SSLCertificateKeyFile /etc/pki/tls/private/ssl1.key
SSLCACertificateFile /etc/pki/tls/private/ssl1_ca.crt
SSLCARevocationFile /etc/pki/tls/private/ssl1_crl.pem
SSLCARevocationCheck chain

SSLVerifyClient require
SSLVerifyDepth 1

ProxyRequests Off
ProxyPass / http://127.0.0.1:8881/
ProxyPassReverse / http://127.0.0.1:8881/

RequestHeader set X-Client-Cert-Subject %{SSL_CLIENT_S_DN}s
RequestHeader set X-Client-Cert-Serial  %{SSL_CLIENT_M_SERIAL}s
RequestHeader set X-Client-Cert         %{SSL_CLIENT_CERT}s
</VirtualHost>


<Virtualhost *:443>
ServerName ssl2
DocumentRoot /var/www/html/ssl2
SSLEngine On
SSLProtocol all -SSLv2

SSLCertificateFile /etc/pki/tls/private/ssl2.crt
SSLCertificateKeyFile /etc/pki/tls/private/ssl2.key
SSLCACertificateFile /etc/pki/tls/private/ssl2_ca.crt

ProxyRequests Off
ProxyPass / http://127.0.0.1:8882/
ProxyPassReverse / http://127.0.0.1:8882/
</VirtualHost>

