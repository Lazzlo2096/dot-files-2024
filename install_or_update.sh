#!/bin/bash

#если такая папка есть, то:
if [ -d ~/dot-files-2024 ]; then

	# update
	echo "> Updating..."
	cd ~/dot-files-2024
	git pull

else

	# first run
	echo "> Installing..."
	cd ~
	git clone https://github.com/Lazzlo2096/dot-files-2024.git
	cd ~/dot-files-2024

	echo -e "\nsource ~/dot-files-2024/bashrc_source.sh\n" >> ~/.bashrc

fi

#source ~/dot-files-2024/bashrc_source.sh # не работает из скрипта
echo "> Перезапустите терминал для вступления изменений в силу!"
