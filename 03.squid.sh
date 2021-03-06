# Squid Install
sudo yum install -y squid
sudo mv /etc/squid/squid.conf /etc/squid/squid.conf.org


sudo tee /etc/squid/squid.conf <<'EOF' 
acl localnet src 10.0.0.0/8     # RFC1918 possible internal network
acl localnet src 172.16.0.0/12  # RFC1918 possible internal network
acl localnet src 192.168.0.0/16 # RFC1918 possible internal network
acl localnet src fc00::/7       # RFC 4193 local private network range
acl localnet src fe80::/10      # RFC 4291 link-local (directly plugged) machines

acl SSL_ports port 443
acl Safe_ports port 80          # http
acl Safe_ports port 21          # ftp
acl Safe_ports port 443         # https
acl Safe_ports port 70          # gopher
acl Safe_ports port 210         # wais
acl Safe_ports port 1025-65535  # unregistered ports
acl Safe_ports port 280         # http-mgmt
acl Safe_ports port 488         # gss-http
acl Safe_ports port 591         # filemaker
acl Safe_ports port 777         # multiling http
acl CONNECT method CONNECT

http_access deny !Safe_ports
http_access deny CONNECT !SSL_ports
http_access allow localhost manager
http_access deny manager
http_access allow localnet
http_access allow localhost
http_access deny all

http_port 3128

cache_mem 256 MB
# cache_dir 5GB
cache_dir ufs /var/spool/squid 5120 16 256
maximum_object_size 2048 MB
coredump_dir /var/spool/squid

refresh_pattern ^ftp:           1440    20%     10080
refresh_pattern ^gopher:        1440    0%      1440
refresh_pattern -i (/cgi-bin/|\?) 0     0%      0
refresh_pattern .               0       20%     4320
refresh_pattern -i \.(deb|rpm|exe|msi)$ 129600 100% 129600 override-expire ignore-no-cache ignore-no-store ignore-private
#refresh_pattern -i \.(deb|rpm|exe|msi)$ 10080 90% 43200 override-expire ignore-no-cache ignore-no-store ignore-private

request_header_access Referer deny all
request_header_access X-Forwarded-For deny all
request_header_access Via deny all
request_header_access Cache-Control deny all

visible_hostname unknown
forwarded_for off
EOF

# 起動設定
sudo systemctl start squid
sudo systemctl enable squid
sudo systemctl status squid
