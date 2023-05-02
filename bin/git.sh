#!/bin/sh
# git config --global user.name "Rustam Uzairov"
# git config --global user.email "mr.uzairov@gmail.com"
# git config --global merge.tool vimdiff

#git config --global gpg.format ssh
#git config --global user.signingkey /home/ru/.ssh/*.pub
#git config --global commit.gpgsign true

# ssh-keygen -t ed25519 -C "mr.uzairov@gmail.com"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519
# cat /home/ru/.ssh/id_ed25519.pub

ssh-keygen -t rsa -b 4096 -C "mr.uzairov@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat /home/ru/.ssh/id_rsa.pub

# git remote set-url origin git@github.com:ru927/reinst


