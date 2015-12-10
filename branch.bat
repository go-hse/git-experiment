@echo off


set BRANCH=newbranch

git rev-parse --verify %BRANCH%
IF %ERRORLEVEL% NEQ 0 (
	echo %BRANCH% does not exist

	git branch %BRANCH%
)

git log --oneline --decorate

git checkout %BRANCH%