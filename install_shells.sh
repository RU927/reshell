#!/bin/bash

shellhome=$HOME/REPOS/shells

function backup_configs {
	echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
	# mv -iv ~/.config/    ~/.config/
	# mv -iv ~/.config/    ~/.config/

	# mv -iv ~/.            ~/.
	# mv -iv ~/.            ~/.
	echo -e "\u001b[36;1m Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old'. \u001b[0m"
}

## -f удаляет имеющийся линк
function setup_symlinks {
	echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
	mkdir -p ~/.config
	# ln -sfnv "$shellhome"/config/nvim/"          ~/.config/
	# ln -sfnv "$shellhome"/config/lazygit/ ~/.config/
	ln -sfnv "$shellhome"/config/sheldon/ ~/.config/

	ln -sfnv "$shellhome"/bash/zshrc ~/.zshrc
	ln -sfnv "$shellhome"/zshenv ~/.zshenv
	ln -sfnv "$shellhome"/bash/bashrc ~/.bashrc
	ln -sfnv "$shellhome"/profile ~/.profile
	# ln -sfnv "$shellhome"/xinitrc ~/.xinitrc
	# ln -sfnv "$shellhome"/Rprofile ~/.Rprofile
	# ln -sfnv "$shellhome"/Renviron ~/.Renviron
	# ln -sfnv "$shellhome"/                ~/.
	# ln -sfnv "$shellhome"/                ~/.

}

function install_lazygit {
	echo -e "\u001b[7m Installing  \u001b[0m"
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" |
		grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_\
          ${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm -rf lazygit.tar.gz
	lazygit --version
}

function all {
	echo -e "\u001b[7m Setting up Dotfiles... \u001b[0m"
	# install_packages
	backup_configs
	setup_symlinks
	install_alacritty
	install_sheldon
	install_lazygit
	install_file_managers
	install_fonts
	install_debget
	echo -e "\u001b[7m Done! \u001b[0m"
}

if [ "$1" = "--all" -o "$1" = "-a" ]; then
	all
	exit 0
fi

# Menu TUI
echo -e "\u001b[32;1m Setting up Dotfiles...\u001b[0m"

echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (a) ALL \u001b[0m"
echo -e "  \u001b[34;1m (s) symlinks \u001b[0m"
echo -e "  \u001b[34;1m (t) TERMINAL \u001b[0m"
echo -e "  \u001b[34;1m (m) \u001b[0m"

echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"

echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

"a")
	all
	;;

"s")
	setup_symlinks
	;;
*)
	echo -e "\u001b[31;1m Invalid option entered, Bye! \u001b[0m"
	exit 0
	;;
esac

exit 0
