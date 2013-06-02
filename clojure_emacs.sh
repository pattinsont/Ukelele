#!/bin/bash

shopt -s dotglob

if (! (dpkg-query -Wf'${db:Status-abbrev}' emacs24  | grep -q '^i')); then
  apt-get -qy update
  apt-get install software-properties-common -y
  add-apt-repository ppa:cassou/emacs
  apt-get update
  apt-get install emacs24 emacs24-el emacs24-common-non-dfsg clojure -y
  else
    echo System has emacs24
fi

if [ ! -f /home/vagrant/.emacs ]; then
  cp /home/vagrant/src/.emacs /home/vagrant/.emacs
  else
  echo System has .emacs
fi

if (! (/home/vagrant/bin/lein version 2> /dev/null | grep -q 'Leiningen')); then 
  chmod +x /home/vagrant/src/setup
  su -c "cd /home/vagrant/src && ./setup" vagrant 
  chown -R vagrant /home/vagrant/
  else
  echo System has Leiningen installed
fi
