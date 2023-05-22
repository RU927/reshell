#!/bin/sh
sudo snap remove lxd
sudo snap remove core20
sudo snap remove snapd
# df | grep snapd
# sudo umount /snap/snapd/14978
# or
# sudo umount /var/snap
sudo snap remove snapd
sudo apt purge snapd

