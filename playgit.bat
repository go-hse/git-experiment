@echo off
clear

set GIT_SSH=

::::: clone from github with ssh
:: git clone git@github.com:go-hse/git-experiment.git

:: git config --global user.email "johndoe@example.com"
:: git config --global user.name "john doe"

::::: check the configuration
:: git config --list


For /f "tokens=1-3 delims=. " %%a in ('date /t') do (set currentdate=%%c-%%b-%%a)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set currenttime=%%a:%%b)

set BUILDNR=0
set FILE=CurrentVersion
set VERSIONBAT=%FILE%.bat
set DUMMY=%FILE%.dummy

::::: load the file, add to build number
if exist %VERSIONBAT% (
	call %VERSIONBAT%
	set /a BUILDNR += 1
)

::::: save the file
(
echo echo Build %currentdate% %currenttime%
echo set BUILDNR=%BUILDNR%
)>%VERSIONBAT%

::::: save a dummy
(
echo echo This is an unuseful dummy at %currentdate% %currenttime%
)>%DUMMY%

::::: check the status
git status -s

::::: diff working <--> staged
git diff

::::: track/stage the files
git add %~f0
git add %VERSIONBAT%
git add %DUMMY%

git status
pause

::::: unstage the dummy file
git reset HEAD %DUMMY%
git status

pause
::::: commit the files
git commit -m "Build %BUILDNR%"

::::: show the last changes
git log -p -2
git log --pretty=format:"%h - %an, %ar : %s"




::::: push to github
git push origin master

