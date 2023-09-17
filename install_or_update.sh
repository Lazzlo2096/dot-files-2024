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
	
	git clone https://github.com/Lazzlo2096/dot-files-2024.git ~/dot-files-2024
	#cd ~/dot-files-2024
	
	vim ~/dot-files-2024/bashrc_source.sh

	echo -e "\nsource ~/dot-files-2024/bashrc_source.sh\n" >> ~/.bashrc

fi

#source ~/dot-files-2024/bashrc_source.sh # не работает из скрипта
echo "> Перезапустите терминал, чтобы изменения вступили в силу!"
