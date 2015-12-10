@echo off

:: this batch is called from playgit.bat

set HERE=%CD%
echo %REMOTE% %HERE% %VERSIONBAT%
cd ..

set GITDIR=git-%currentdate%
mkdir %GITDIR%

cd /D %GITDIR%
git init
git remote add gitex %REMOTE%
git fetch gitex
git checkout master

if exist %VERSIONBAT% (
	call %VERSIONBAT%
)
pause

cd ..
rmdir /S /Q %GITDIR%

cd /D %HERE%


