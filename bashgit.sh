#!/usr/bin/env bash

now=$(date +"%m.%d.%Y %H:%M")

echo $0 $now


BUILDNR=0
MINOR=1
FILE=CurrentVersion
VERSIONSCRIPT=$FILE.sh
DUMMY=$FILE.dummy
README=README2.md

# use of ssh
REMOTE=git@github.com:go-hse/git-experiment.git


cat <<EOF > $README
# git-experiment
## Experimental usage of git commands
The Windows batch file playgit.bat
EOF

# clone from github with ssh
# git clone git@github.com:go-hse/git-experiment.git

# git config --global user.email "johndoe@example.com"
# git config --global user.name "john doe"

# check the configuration
# git config --list

echo - shows the remote repos >>$README
git remote -v

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo - reads a batch file with the current build number, if it exists>>$README


if [ -f $VERSIONSCRIPT ]; then
	source $VERSIONSCRIPT
fi

((BUILDNR++))
MINOR=$((BUILDNR/5))

# set /a MINOR=%BUILDNR% %% 5

cat <<EOF > $VERSIONSCRIPT
echo Build $BUILDNR $MINOR at $now
BUILDNR=$BUILDNR
EOF

cat <<EOF > $DUMMY
echo echo This is an unuseful dummy at $now
EOF
git status -s


git add $VERSIONSCRIPT
git add $0
git commit -m "Linux Build $BUILDNR"

# git push origin master





