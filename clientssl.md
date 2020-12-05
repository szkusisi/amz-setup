```
NameVirtualHost server.example.com:443
<VirtualHost server.example.com:443>
        ServerName server.example.com

        # SSL Params
        # Activate the client certificate
        SSLEngine On
        SSLCertificateFile /etc/httpd/cert/ca.crt
        SSLCertificateKeyFile /etc/httpd/cert/ca.key

        # Proxy Params
        ProxyVia On
        ProxyRequests On
        ProxyPreserveHost Off
        SSLProxyVerifyDepth 2
        ProxyPass /example http://example.com/
        ProxyPassReverse /example http://example.com
        Redirect Permanent /example http://example.com

        <Location /example>
                # SSL Params
                # Enable de Client Authentication only in this location
                SSLVerifyDepth 3
                SSLVerifyClient optional_no_ca
                SSLOptions +ExportCertData +StdEnvVars
                
                # Define HTTP Headers that will be forwarded to WebServer
                # CLIENT_SSL vars founded on: http://httpd.apache.org/docs/2.2/mod/mod_ssl.html
                RequestHeader set SSL_CLIENT_S_DN "%{SSL_CLIENT_S_DN}s"
                RequestHeader set SSL_CLIENT_I_DN "%{SSL_CLIENT_I_DN}s"
                RequestHeader set SSL_SERVER_S_DN_OU "%{SSL_SERVER_S_DN_OU}s"
                RequestHeader set SSL_CLIENT_VERIFY "%{SSL_CLIENT_VERIFY}s"
                requestHeader set SSL_CLIENT_S_DN_x509 "%{SSL_CLIENT_S_DN_x509}s"
        </Location>

</VirtualHost>
```



http://www.t2.ucsd.edu/twiki2/pub/UCSDTier2/WebAuthentication/ssl.conf
＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
```

LoadModule ssl_module modules/mod_ssl.so
Listen 443
AddType application/x-x509-ca-cert .crt
AddType application/x-pkcs7-crl    .crl

SSLPassPhraseDialog  builtin

SSLSessionCache        none
#SSLSessionCache        dbm:/var/cache/mod_ssl/scache(512000)
#SSLSessionCache        dc:UNIX:/var/cache/mod_ssl/distcache
SSLSessionCache         shmcb:/var/cache/mod_ssl/scache(512000)
SSLSessionCacheTimeout  300

SSLMutex  file:logs/ssl_mutex

SSLRandomSeed startup file:/dev/urandom  256
SSLRandomSeed connect builtin

SSLCryptoDevice builtin


<VirtualHost _default_:443>
DocumentRoot "/var/www/html"
ServerName yuan.ucsd.edu

ErrorLog logs/ssl_error_log
TransferLog logs/ssl_access_log
LogLevel warn

SSLEngine on
SSLCipherSuite ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP
SSLCertificateFile /etc/httpd/conf/ssl.crt/hostcert.pem
SSLCertificateKeyFile /etc/httpd/conf/ssl.key/hostkey.pem
SSLCACertificatePath /etc/grid-security/certificates

<Files ~ "\.(cgi|shtml|phtml|php3?)$">
    SSLOptions +StdEnvVars
</Files>
<Directory "/var/www/cgi-bin">
    SSLOptions +StdEnvVars
</Directory>


SetEnvIf User-Agent ".*MSIE.*" \
         nokeepalive ssl-unclean-shutdown \
         downgrade-1.0 force-response-1.0

CustomLog logs/ssl_request_log \
          "%t %h %{SSL_PROTOCOL}x %{SSL_CIPHER}x \"%r\" %b"

ProxyPreserveHost on

<Directory  "/var/www/html/ssltest1">
  SSLRequireSSL
  SSLVerifyDepth 2
  SSLVerifyClient require
  SSLOptions +StdEnvVars +StrictRequire +CompatEnvVars +ExportCertData
  SSLRequire %{SSL_CIPHER_USEKEYSIZE} >= 128
  <FilesMatch "^testme$">
   Options +ExecCGI
   SetHandler cgi-script
  </FilesMatch>
 </Directory>

<Directory  "/var/www/html/ssltest">
  SSLRequireSSL
  SSLVerifyDepth 3
  SSLVerifyClient require
  SSLOptions +StdEnvVars +StrictRequire +CompatEnvVars +ExportCertData
  SSLRequire %{SSL_CIPHER_USEKEYSIZE} >= 128
  Options +FollowSymlinks

  RequestHeader set SSL_CLIENT_CERT %{SSL_CLIENT_CERT}e
  RequestHeader set SSL_CLIENT_S_DN %{SSL_CLIENT_S_DN}e
  RequestHeader set SSL_CLIENT_VERIFY %{SSL_CLIENT_VERIFY}e
  RequestHeader set HTTPS %{HTTPS}e

  RewriteEngine on

  RewriteCond %{SSL:SSL_CLIENT_VERIFY} (SUCCESS)
  RewriteCond %{SSL:HTTPS} =on
#  RewriteRule ^test.html(.*)$ http://ming.ucsd.edu/ssltest/show_env.pl$2 [P,L,R=301]
  RewriteRule ^test.html(.*)$ http://submit-3.t2.ucsd.edu/production_request$1 [P,L,R=301]

  <FilesMatch "^testme$">
   Options +ExecCGI
   SetHandler cgi-script
  </FilesMatch>

 </Directory>

  <Directory /var/www/html/production_request>
  RewriteEngine on 
  
  SSLRequireSSL
  SSLVerifyDepth 3
  SSLVerifyClient require
  SSLOptions +StdEnvVars +StrictRequire +CompatEnvVars +ExportCertData
  SSLRequire %{SSL_CIPHER_USEKEYSIZE} >= 128
  Options +FollowSymlinks

  RequestHeader set SSL_CLIENT_CERT %{SSL_CLIENT_CERT}e
  RequestHeader set SSL_CLIENT_S_DN %{SSL_CLIENT_S_DN}e
  RequestHeader set SSL_CLIENT_VERIFY %{SSL_CLIENT_VERIFY}e
  RequestHeader set HTTPS %{HTTPS}e

  RewriteRule ^(.*) http://submit-3.t2.ucsd.edu/production_request/$1 [proxy] 
  </Directory>

  RewriteLog "/etc/httpd/logs/rewrite.log"
  RewriteLogLevel 10

</VirtualHost>
```

