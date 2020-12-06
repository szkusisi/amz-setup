RequestHeader set SSL_CLIENT_VERIFY "%{SSL_CLIENT_VERIFY}s"

これの認証ステータスを確認して、認証してなら、リダイレクト


<VirtualHost _default_:443>
...
  <Directory "/var/www/html_ssl">
    Options -Indexes FollowSymLinks
    AllowOverride All
  </Directory>

  SSLVerifyClient optional
  SSLVerifyDepth 1
</VirtualHost>




上記動かなかったら以下を参照
https://terazzo.hatenadiary.org/entry/20120423/1335133206



ヘッダー
クライアント認証なし
==================
X-Client-Cert: (null)
SSL_CLIENT_VERIFY: NONE
==================

クライアント認証あり
==================
X-Client-Cert: -----BEGIN CERTIFICATE----- MIIDTjCCAjag～割愛～0ig== -----END CERTIFICATE-----
SSL_CLIENT_VERIFY: SUCCESS
==================


NGINXだけど、参考例
https://www.harumaki.net/2018/03/23/nginx-ssl-client-cert-and-access-control/




http://httpd.apache.org/docs/2.4/expr.html
<If "%{SSL_CLIENT_VERIFY} != 'SUCCESS'">
    Redirect permanent "/" "https://google.com"
</If>

