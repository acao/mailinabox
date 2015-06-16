#!/bin/bash
#########################################################
# This script is intended to be run like this:
#
#   curl https://.../bootstrap.sh | sudo bash
#
#########################################################

if [ -z "$TAG" ]; then
	TAG=v0.10
fi

# Are we running as root?
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root. Did you leave out sudo?"
	exit
fi

# Clone the Mail-in-a-Box repository if it doesn't exist.
if [ ! -d $HOME/mailinabox ]; then
	echo Installing git . . .
	DEBIAN_FRONTEND=noninteractive apt-get -q -q install -y git < /dev/null
	echo

	echo Downloading Mail-in-a-Box $TAG. . .
	git clone \
		https://github.com/acao/mailinabox \
		$HOME/mailinabox \
		< /dev/null 2> /dev/null

	echo
fi

# Change directory to it.
cd $HOME/mailinabox

# Start setup script.
setup/start.sh

