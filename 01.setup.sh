# update
sudo yum upgrade -y
sudo amazon-linux-extras install epel -y
sudo yum install -y git

# git
git config --global user.name "szkusisi"
git config --global user.email "szk@usisi.net"
git config --global credential.helper store

# gitauto
sudo cp gitauto /usr/local/bin/
/usr/local/bin/gitauto


# sudo yum install -y certbot python3-certbot-apache httpd mod_ssl

