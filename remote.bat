@echo off

:: this batch is called from playgit.bat
:: it needs env vars:
::		%REMOTE% 
::		%VERSIONBAT%
::		%currentdate%

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

cd ..
rmdir /S /Q %GITDIR%

cd /D %HERE%


