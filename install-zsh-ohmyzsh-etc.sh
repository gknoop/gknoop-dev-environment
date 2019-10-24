#!/bin/bash

# install zsh
printf "checking if zsh is installed...\n"
dpkg -s zsh &> /dev/null  
if [ $? -ne 0 ];
    then
        printf "zsh not installed. now installing...\n"
        apt update
        apt -qq install zsh -y
        printf "zsh is now installed.\n"
    else
        printf "zsh is installed.\n"
fi
printf "\n"

# rename .profile to .profile_deprecated
printf "checking if \".profile\" exists...\n"
if [ -f ~/.profile ]; 
	then
		printf "\".profile\" found. renaming..."
		mv ~/.profile ~/.profile_deprecated
		printf "\".profile\" is now \".profile_deprecated\".\n"
	else
		printf "no \".profile\" detected.\n"
fi
printf "\n"

# make zsh default shell
printf "checking default shell...\n"
if [ "$SHELL" != "/bin/zsh" ];
	then
		printf "zsh is not default. making zsh the default shell...\n"
		chsh -s $(which zsh)
		printf "zsh is now the default shell. (don't forget to log out!)\n"
	else
		printf "zsh is already the default shell.\n"
fi
printf "\n"

# install oh-my-zsh
printf "checking if oh-my-zsh is installed...\n"
if [ ! -d $ZSH_CUSTOM ];
	then
		printf "oh-my-zsh not installed. now installing...\n"
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		printf "oh-my-zsh is now installed.\n"
	else
		printf "oh-my-zsh is already installed.\n"
fi
printf "\n"

# install powerlevel10k
printf "checking if powerlevel10k is installed...\n"
if [ ! -d $ZSH_CUSTOM/themes/powerlevel10k ];
	then
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
		echo "# p10k config" >> ~/.zshrc
		echo "source $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
		echo "ZSH_THEME=powerlevel10k/powerlevel10k" >> ~/.zshrc
	else
		printf "powerlevel10k is already installed.\n"
fi
printf "\n"

# install RobotoMono (Nerd Fonts)
printf "checking if RobotoMono is installed...\n"
if ! fc-list | grep -i "robotomono" > /dev/null;
	then
		printf "installing RobotoMono fonts...\n"
		if [ ! -d ~/.local/share/fonts ]; 
			then
				printf "creating fonts folder..." && mkdir ~/.local/share/fonts && printf "fonts folder created.\n"
			else
				printf "fonts folder found.\n"
		fi
		cd ~/.local/share/fonts/
		mkdir RobotoMono
		cd RobotoMono
		curl -L -O https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/RobotoMono.zip
		unzip RobotoMono.zip
		printf "regenerating font cache... " && fc-cache -f && printf "regenerated.\n"
		rm RobotoMono.zip
		printf "RobotoMono fonts have been installed.\n"
	else
		printf "font is already installed.\n"
fi
printf "note: if you haven't already done so, change the font in the terminal.\n"
printf "\n"

# configure powerlevel10k
printf "checking if powerlevel10k is configured...\n"
if [ ! -f ~/.p10k.zsh ]
	then
		printf "importing powerlevel10k configuration...\n"
		git clone https://github.com/gknoop/my-ubuntu-config/blob/master/dotfiles/.p10k.zsh ~/
		echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc
	else
		printf "there is already a config file for powerlevel10k.\n"
fi
printf "\n"

printf "zsh installed and configured.\n"