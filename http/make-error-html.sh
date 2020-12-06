#!/bin/bash

DIR=/var/www/html/ap1/error
VHOST=ap1

sudo mkdir $DIR

while read LINE
do
sudo tee /var/www/html/$VHOST/error/$LINE.html <<EOF >/dev/null
$VHOST $LINE error
EOF
done < ./make-error-html.txt
