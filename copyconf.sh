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

if [[ -d ~/.mozilla/firefox ]]; then
	MOZBASE=~/.mozilla/firefox/
	MOZ=${MOZBASE}profiles.ini
	if [[ $(grep '\[Profile[^0]\]' ${MOZ}) ]]; then
		PROFPATH=$(grep -E '^\[Profile|^Path|^Default' ${MOZ} | grep -1 '^Default=1' | grep '^Path' | cut -c6-)
	else 
		PROFPATH=$(grep 'Path=' ${MOZ} | sed 's/^Path=//')
	fi
	if [[ -d ${MOZBASE}${PROFPATH}/chrome ]]; then
		mkdir -p conffiles/mozilla/firefox/chrome
		cp ${MOZBASE}${PROFPATH}/chrome/userChrome.css conffiles/mozilla/firefox/chrome/userchrome.css
	fi
fi
