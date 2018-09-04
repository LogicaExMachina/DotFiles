#!/usr/bin/env bash

if [[ -f conffiles/vimrc ]]; then
	cp -u conffiles/vimrc ~/.vimrc
fi

if [[ -f conffiles/bashrc ]]; then
	cp -u conffiles/bashrc ~/.bashrc
fi

if [[ -d ~/.config ]]; then
	if [[ -d ~/.config/sakura ]]; then
		cp conffiles/config/sakura/sakura.conf ~/.config/sakura/sakura.conf 
	fi

	if [[ -d ~/.config/i3 ]]; then
		cp conffiles/config/i3/config ~/.config/i3/config 
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
	if [[ -d ${MOZBASE}${PROFPATH} ]]; then
		mkdir -p chrome
		cp conffiles/mozilla/firefox/chrome/userchrome.css  ${MOZBASE}${PROFPATH}/chrome/userChrome.css 
	fi
fi
