#!/bin/bash -xe

function mods {
	yes yes | installmgr -r "$1"
	MODS=$(installmgr -rl "$1" | sed -E -e 's/.*\[(.*?)\].*/\1/' | sed -e '1,3d')
	for mod in $MODS; do
		yes yes | installmgr -ri "$1" $mod;
	done
}

echo "yes" > /tmp/yes
installmgr -init < /tmp/yes
installmgr -sc < /tmp/yes

mods Xiphos
