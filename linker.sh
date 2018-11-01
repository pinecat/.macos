#!/usr/bin/env bash

# .macos/linker.sh
# creates softlinks for dotfiles to home directory

# print out script name
printf "##############################\n"
printf "# Linker                     #\n"
printf "##############################\n"

function linker() {
    # link runcom dotfiles for shell
    ln -sfv $HOME/.macos/runcom/.bashrc $HOME/.bashrc
    ln -sfv $HOME/.macos/runcom/.bash_profile $HOME/.bash_profile
    ln -sfv $HOME/.macos/runcom/.bash_prompt $HOME/.bash_prompt
    ln -sfv $HOME/.macos/runcom/.aliases $HOME/.aliases
    ln -sfv $HOME/.macos/runcom/.exports $HOME/.exports

    # link screen dotfiles
    ln -sfv $HOME/.macos/.screenrc $HOME/.screenrc

    # link vim dotfiles
    ln -sfv $HOME/.macos/.vimrc $HOME/.vimrc
    ln -sfv $HOME/.macos/.vim $HOME/.vim

    # link wget dotfiles
    ln -sfv $HOME/.macos/.wgetrc $HOME/.wgetrc
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    linker;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/N) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		linker;
	fi;
fi
