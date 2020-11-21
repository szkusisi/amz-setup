# yum proxy
sudo tee -a /etc/yum.conf <<'EOF'
proxy=http://10.0.0.20:3128/
EOF


# env登録  amazon-linux-extrasでは必要
export HTTP_PROXY=http://10.0.0.20:3128/
export HTTPS_PROXY=http://10.0.0.20:3128/
