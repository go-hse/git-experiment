@echo off


set BRANCH=newbranch

git rev-parse --verify %BRANCH%
IF %ERRORLEVEL% NEQ 0 (
	echo %BRANCH% does not exist

	:: create a new branch
	git branch %BRANCH%
)

git log --oneline --decorate

:: switch to new branch
git checkout %BRANCH%

git status

git checkout master

git branch -d %BRANCH%