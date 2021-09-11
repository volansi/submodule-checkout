#/bin/env bash
token=$1
adir=$2
echo `pwd`
echo $adir
if [[ `grep "url" .gitmodules 2>/dev/null` ]]; then
	sed -E "s/git@github.com:|https:\/\/github.com\//https:\/\/$token:$token@github.com\//" -i .gitmodules
	git submodule sync
	git submodule update --init
	git submodule foreach --quiet "bash $adir/recurse-submodules.sh $token $adir || :"
fi

