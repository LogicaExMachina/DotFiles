#!/usr/bin/env bash

if [[ -f ~/.vimrc ]]; then
	cp -u ~/.vimrc conffiles/vimrc
fi

if [[ -f ~/.bashrc ]]; then
	cp -u ~/.bashrc conffiles/bashrc
fi
