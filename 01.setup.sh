# update
sudo yum upgrade -y

# git
git config --global user.name "szkusisi"
git config --global user.email "szk@usisi.net"
git config --global credential.helper store

# timezone
sudo timedatectl set-timezone Asia/Tokyo

# gitauto コピー
sudo cp bin/gitauto /usr/local/bin/
/usr/local/bin/gitauto




