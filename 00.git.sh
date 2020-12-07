# update
sudo yum upgrade -y
sudo yum install git -y

# git
git config --global user.name "szkusisi"
git config --global user.email "szk@usisi.net"
git config --global credential.helper store

# timezone
# sudo timedatectl set-timezone Asia/Tokyo
# sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime


# gitauto コピー
sudo cp bin/gitauto /usr/local/bin/
/usr/local/bin/gitauto




