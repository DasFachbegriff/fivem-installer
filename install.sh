#!/bin/sh
clear
echo installing git...
sleep 2
sudo apt install git screen xz-utils -y

clear

dir=/home/FiveM/FXServer/server

if [ -e /home/FiveM/ ]
then
	echo "ERROR: The directory /home/FiveM/ already existed"
else
	mkdir /home/FiveM/
	mkdir /home/FiveM/FXServer/
	
	git clone https://github.com/citizenfx/cfx-server-data.git $dir
	wget --directory-prefix=$dir https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/$(wget -qO- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ | egrep -m 1 -o "............................................./*\/fx.tar.xz")
	
	tar xf $dir/fx.tar.xz -C $dir
	
	rm -r $dir/fx.tar.xz
	
	echo screen -S fivem bash $dir/run.sh >$dir/start.sh
	sh $dir/start.sh
fi
