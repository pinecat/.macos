#!/usr/bin/env bash

# .macos/bootstrap.sh
# runs all the bash script files in the .macos directory

# print out script name
printf "##############################\n"
printf "# Bootstrap                  #\n"
printf "##############################\n"

git pull origin master

function bootstrapper() {
    ./linker.sh -f
    ./brew.sh
    ./macpref.sh
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    bootstrapper;
else
    read -p "This may overwrite existing files in your home directory. Are you sure you want to continue? (y/N) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		bootstrapper;
	fi;
fi

read -p "Your computer must restart for changes to take effect. Would you like to restart now? (y/N) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo shutdown -r now
fi;
