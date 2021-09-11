#/bin/env bash
token=$1
echo `pwd`
if [[ `grep "url" .gitmodules 2>/dev/null` ]]; then
	sed -E "s/git@github.com:|https:\/\/github.com\//https:\/\/$token:$token@github.com\//" -i .gitmodules
	git submodule sync
	git submodule update --init
	git submodule foreach --quiet 'cp $toplevel/recurse-submodules.sh . && bash $toplevel/recurse-submodules.sh || :'
fi

