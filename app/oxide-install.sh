#!/bin/bash


# Next check if Oxide doesn't' exist, or if we want to always update it
INSTALL_OXIDE="0"
if [ ! -f "/steamcmd/rust/CSharpCompiler.x86_x64" ]; then
	INSTALL_OXIDE="1"
fi
if [ "$RUST_OXIDE_UPDATE_ON_BOOT" = "1" ]; then
	INSTALL_OXIDE="1"
fi

# If necessary, download and install latest Oxide
if [ "$INSTALL_OXIDE" = "1" ]; then
	echo "Downloading and installing latest Oxide.."
	OXIDE_URL="https://umod.org/games/rust/download/develop"
	curl -sL $OXIDE_URL | bsdtar -xvf- -C /steamcmd/rust/
	chmod 755 /steamcmd/rust/CSharpCompiler.x86_x64 > /dev/null 2>&1 &
fi

# install or update the desired plugins
cd /steamcmd/rust/oxide/plugins
if [ -f "_downloads.txt" ]; then
	for PLUGIN in $(cat "_downloads.txt"); do
		curl -O "$PLUGIN"
	done
fi
cd -
