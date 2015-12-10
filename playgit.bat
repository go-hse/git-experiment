@echo off
clear

 :: git config --global user.email "johndoe@example.com"
:: git config --global user.name "john doe"

For /f "tokens=1-3 delims=. " %%a in ('date /t') do (set currentdate=%%c-%%b-%%a)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set currenttime=%%a:%%b)

set BUILDNR=0
set FILE=CurrentVersion
set VERSIONBAT=%FILE%.bat

:: load the file, add to build number
if exist %VERSIONBAT% (
	call %VERSIONBAT%
	set /a BUILDNR += 1
)

:: save the file
(
echo echo Build %currentdate% %currenttime%
echo set BUILDNR=%BUILDNR%
)>%VERSIONBAT%

git add %~f0
git add %VERSIONBAT%

git status
git commit -m "Build %BUILDNR%"
git status

git push origin master

