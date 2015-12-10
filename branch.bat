@echo off
cls

For /f "tokens=1-3 delims=. " %%a in ('date /t') do (set currentdate=%%c-%%b-%%a)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set currenttime=%%a:%%b)

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

set TL=timeline.txt

(
echo echo Time %currentdate% %currenttime% 
)>>%TL%

git add %TL%
git commit -m "Commit to branch %newbranch% %currentdate% %currenttime%"

:: switch to master branch
git checkout master

:: merge changes from new branch
echo Merge %BRANCH%
git merge %BRANCH%


IF %ERRORLEVEL% == 0 (
	:: delete the new branch
	echo Delete %BRANCH%
	git branch -d %BRANCH%
)
