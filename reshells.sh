#!/bin/bash

RC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
GREEN2='[32;1m'
WHITE='[37;1m'
BLUE='[34;1m'

RV='\u001b[7m'

THIS_REPO_PATH="$(dirname "$(realpath "$0")")"
# THIS_REPO_PATH=$HOME/REPOS/reinst
DOT_CFG_PATH=$THIS_REPO_PATH/config
DOT_HOME_PATH=$THIS_REPO_PATH/home
USR_CFG_PATH=$HOME/.config
# USR_CFG_PATH=$THIS_REPO_PATH/test
mkdir -p "$USR_CFG_PATH"

configExists() {
	[[ -e "$1" ]] && [[ ! -L "$1" ]]
}

command_exists() {
	command -v $1 >/dev/null 2>&1
}

checkEnv() {
	## Check Package Handeler
	PACKAGEMANAGER='apt dnf pacman'
	for pgm in ${PACKAGEMANAGER}; do
		if command_exists "${pgm}"; then
			PACKAGER=${pgm}
			echo -e "${RV}Using ${pgm}"
		fi
	done

	if [ -z "${PACKAGER}" ]; then
		echo -e "${RED}Can't find a supported package manager"
		exit 1
	fi

	## Check if the current directory is writable.
	PATHs="$THIS_REPO_PATH $USR_CFG_PATH"
	for path in $PATHs; do
		if [[ ! -w ${path} ]]; then
			echo -e "${RED}Can't write to ${path}${RC}"
			exit 1
		fi
	done

	## Check SuperUser Group
	SUPERUSERGROUP='wheel sudo'
	for sug in ${SUPERUSERGROUP}; do
		if groups | grep "${sug}"; then
			SUGROUP=${sug}
			echo -e "Super user group ${SUGROUP}"
		fi
	done

	## Check if member of the sudo group.
	if ! groups | grep "${SUGROUP}" >/dev/null; then
		echo -e "${RED}You need to be a member of the sudo group to run me!"
		exit 1
	fi
}

checkEnv

install_depend() {
	## Check for dependencies.
	DEPENDENCIES='autojump bash bash-completion zsh surfraw surfraw-extra newsboat'
	echo -e "${YELLOW}Installing dependencies...${RC}"
	if [[ $PACKAGER == "pacman" ]]; then
		if ! command_exists yay; then
			echo "Installing yay..."
			sudo "${PACKAGER}" --noconfirm -S base-devel
			$(cd /opt && sudo git clone https://aur.archlinux.org/yay-git.git && sudo chown -R \
				${USER}:${USER} ./yay-git && cd yay-git && makepkg --noconfirm -si)
		else
			echo "Command yay already installed"
		fi
		yay --noconfirm -S "${DEPENDENCIES}"
	else
		sudo "${PACKAGER}" install -yq "${DEPENDENCIES}"
	fi
}

function back_sym {
	# перед создание линков делает бекапы только тех пользовательских конфикураций,
	# файлы которых есть в ./config ./home
	echo -e "\u001b${YELLOW} Backing up existing files... ${RC}"
	for config in $(ls ${DOT_CFG_PATH}); do
		if configExists "${USR_CFG_PATH}/${config}"; then
			echo -e "${YELLOW}Moving old config ${USR_CFG_PATH}/${config} to ${USR_CFG_PATH}/${config}.old${RC}"
			if ! mv "${USR_CFG_PATH}/${config}" "${USR_CFG_PATH}/${config}.old"; then
				echo -e "${RED}Can't move the old config!${RC}"
				exit 1
			fi
		fi
		echo -e "${GREEN}Linking ${DOT_CFG_PATH}/${config} to ${USR_CFG_PATH}/${config}${RC}"
		if ! ln -snf "${DOT_CFG_PATH}/${config}" "${USR_CFG_PATH}/${config}"; then
			echo echo -e "${RED}Can't link the config!${RC}"
			exit 1
		fi
	done

	for config in $(ls ${DOT_HOME_PATH}); do
		if configExists "$HOME/.${config}"; then
			echo -e "${YELLOW}Moving old config ${HOME}/.${config} to ${HOME}/.${config}.old${RC}"
			if ! mv "${HOME}/.${config}" "${HOME}/.${config}.old"; then
				echo -e "${RED}Can't move the old config!${RC}"
				exit 1
			fi
		fi
		echo -e "${GREEN}Linking ${DOT_HOME_PATH}/${config} to ${HOME}/.${config}${RC}"
		if ! ln -snf "${DOT_HOME_PATH}/${config}" "${HOME}/.${config}"; then
			echo echo -e "${RED}Can't link the config!${RC}"
			exit 1
		fi
	done

	echo -e "${GREEN}Done!\nrestart your shell to see the changes.${RC}"
	echo -e "\u001b[36;1m Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old'. ${RC}"
}

function install_alacritty {
	## Check for dependencies.
	DEPEND='libfontconfig1-dev libxcb-shape0-dev libxcb-xfixes0-dev libxkbcommon-dev'
	echo -e "${RV}${YELLOW} Installing dependencies${RC}"
	sudo "${PACKAGER}" install -yq "${DEPEND}"
	# Rust,Cargo
	if ! command_exists cargo; then
		echo -e "${RV} Installing Rust ${RC}"
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	else
		echo -e "${RV} Rust is installed${RC}"
	fi

	# source "~/.cargo/env/"
	# Alacritty
	if ! command_exists alacritty; then
		echo -e "${RV} Compiling Alacritty... ${RC}"
		# git clone https://github.com/alacritty/alacritty.git
		# cd alacritty
		# cargo build --release
		cargo install alacritty
	else
		echo -e "${RV} Alacritty is installed${RC}"
	fi
}

function install_sheldon {
	if command_exists cargo; then
		if ! command_exists sheldon; then
			echo -e "${RV} Compiling sheldon... ${RC}"
			cargo install sheldon
			sheldon lock
		else
			echo -e "${RV} Sheldon is installed${RC}"
		fi
	else
		echo -e "${RED}Rust is not installed!${RC}"
		# install_alacritty
		# install_sheldon
	fi
	# chsh -s $(which zsh)
}

install_starship() {
	if command_exists starship; then
		echo "Starship already installed"
		return
	fi

	if ! curl -sS https://starship.rs/install.sh | sh; then
		echo -e "${RED}Something went wrong during starship install!${RC}"
		exit 1
	fi
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
	install_depend
	install_alacritty
	install_sheldon
	install_starship
	back_sym
	install_alacritty
	install_sheldon
	install_lazygit
	install_file_managers
	install_fonts
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
echo -e "  \u001b[34;1m (d) dependencies \u001b[0m"
echo -e "  \u001b[34;1m (b) back_sym \u001b[0m"
echo -e "  \u001b[34;1m (1) install alacritty \u001b[0m"
echo -e "  \u001b[34;1m (2) install sheldon \u001b[0m"
echo -e "  \u001b[34;1m (3) starship \u001b[0m"
echo -e "  \u001b[34;1m (4) lazygit \u001b[0m"
# echo -e "  \u001b[34;1m (t) TERMINAL \u001b[0m"
# echo -e "  \u001b[34;1m (m) \u001b[0m"

echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"

echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

"a")
	all
	;;

"d")
	install_depend
	;;

"b")
	back_sym
	;;
"1")
	install_alacritty
	;;
"2")
	install_sheldon
	;;
"3")
	install_starship
	;;

"4")
	install_lazygit
	;;
*)
	echo -e "\u001b[31;1m Invalid option entered, Bye! \u001b[0m"
	exit 0
	;;
esac

exit 0
