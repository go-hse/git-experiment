@echo off
clear

set GIT_SSH=
set README=README.md

::::: write the readme from here
(
echo # git-experiment
echo ## Experimental usage of git commands
echo The Windows batch file playgit.bat
)>%README%


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


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo - reads a batch file with the current build number, if it exists>>%README%
if exist %VERSIONBAT% (
	call %VERSIONBAT%
	set /a BUILDNR += 1
)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo - saves the batch file with the current build number>>%README%
(
echo echo Build %BUILDNR% at %currentdate% %currenttime%
echo set BUILDNR=%BUILDNR%
)>%VERSIONBAT%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo - creates a dummy file>>%README%
(
echo echo This is an unuseful dummy at %currentdate% %currenttime%
)>%DUMMY%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo - check the git status>>%README%
git status -s
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo - diffs working dir vs. staged >>%README%
git diff

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo - tracks/stages the files with git add >>%README%
git add %~f0
git add %VERSIONBAT%
git add %DUMMY%
git status

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo - unstages the dummy file with git reset >>%README%
git reset HEAD %DUMMY%
git status


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo - shows the last changes (git log) >>%README%
::::: show the last changes
git log -p -2

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo - commits the stage to the repo >>%README%
echo - pushes everything to github >>%README%
echo - and creates this README file >>%README%

git add %README%
git commit -m "Build %BUILDNR%"

:: modify the file
(
echo echo Some extra line.
)>>%VERSIONBAT%

:: discard the changes; fetch commited version from repo
git checkout -- %VERSIONBAT%

:: call the file; should not display the extra line
call %VERSIONBAT%

:: push to github
git push origin master



