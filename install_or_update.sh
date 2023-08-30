#!/bin/bash

#если такая папка есть, то:
if [ -d ~/dot-files-2024 ]; then

	# update
	cd ~/dot-files-2024
	git pull

	#./install_or_update.sh

else

	# first run
	cd ~
	git clone https://github.com/Lazzlo2096/dot-files-2024.git
	cd ~/dot-files-2024

	#./install_or_update.sh
	echo -e "\nsource ~/dot-files-2024/bashrc_source.sh\n" >> ~/.bashrc

fi


source ~/dot-files-2024/bashrc_source.sh
