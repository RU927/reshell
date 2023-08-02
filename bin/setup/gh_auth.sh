#!/bin/bash

# first install GIT CLI, not from snap:
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 23F3D4EA75716059
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# Create your token here:  created at https://github.com/settings/tokens
# Note: check most boxes that require Read, or you will have to do it again later.
# write it to file  ~/mytoken.txt

# now you can configure store where gh will keep credentials:
git config --global credential.helper 'store --file ~/.git-credentials'
/usr/bin/gh auth setup_git
cat ~/.gitconfig

# Hopefully, you can login now:
/usr/bin/gh auth login --with-token < ~/mytoken.txt

# now you can do operations that require authentication (careful!), "git" saves to and reads from store:
git push -f https://github.com/.....

# if it asks for password, give them the token:
Username for 'https://github.com': <your GitHub name>
Password for 'https://...@github.com': <token, not password>
