#!/bin/bash

shopt -s dotglob

if ! dpkg-query -Wf'${db:Status-abbrev}' emacs24 2>&1 >/dev/null | grep -q '^i'; then
  apt-get -qy update
  apt-get install software-properties-common -y
  add-apt-repository ppa:cassou/emacs
  apt-get update
  apt-get install emacs24 emacs24-el emacs24-common-non-dfsg clojure -y
fi

cp /home/vagrant/src/.emacs /home/vagrant/.emacs

chmod +x /home/vagrant/src/setup
su -c "cd /home/vagrant/src && ./setup" vagrant 
chown -R vagrant /home/vagrant/





