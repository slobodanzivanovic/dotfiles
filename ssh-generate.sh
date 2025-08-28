#!/usr/bin/env bash

ssh-keygen -t rsa -b 4096 -C "219014701+slobodanzivanovic@users.noreply.github.com" -f ~/.ssh/id_rsa

eval "$(ssh-agent -s)"

touch ~/.ssh/config

echo -e "Host *\n  AddKeysToAgent yes\n  IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config

ssh-add ~/.ssh/id_rsa

if command -v pbcopy &> /dev/null; then
	pbcopy < ~/.ssh/id_rsa.pub
elif command -v xclip &> /dev/null; then
	xclip -sel clip < ~/.ssh/id_rsa.pub
else
	echo "No clipboard utility found. Please copy the public key manually."
	cat ~/.ssh/id_rsa.pub
fi

echo "SSH key has been generated and copied to clipboard."
