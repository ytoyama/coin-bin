#!/bin/sh

user=toyama.12056
network=133.21.225.

for host in $(seq 146 147)
do
  address=$network$host
  scp $HOME/.ssh/id_rsa.pub $user@$address:id_rsa.pub
  home=/home/$user
  ssh $user@$address \
      "cat $home/id_rsa.pub >> $home/.ssh/authorized_keys && rm $home/id_rsa.pub"
done
