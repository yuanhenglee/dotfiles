#! /bin/bash

for package in zsh nvim git zellij
do
	stow -v1 -t ~ $package
done
