#!/usr/bin/env bash

if [[ -f ~/.vimrc ]]; then
	cp -u ~/.vimrc conffiles/vimrc
fi

if [[ -f ~/.bashrc ]]; then
	cp -u ~/.bashrc conffiles/bashrc
fi

if [[ -d ~/.config ]]; then
	if [[ -d ~/.config/sakura ]]; then
		# make sure the sakura folder exists
		mkdir -p conffiles/config/sakura
		cp ~/.config/sakura/sakura.conf conffiles/config/sakura/sakura.conf
	fi

	if [[ -d ~/.config/i3 ]]; then
		mkdir -p conffiles/config/i3
		cp ~/.config/i3/config conffiles/config/i3/config
	fi
fi
