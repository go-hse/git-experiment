@echo off
clear

 git config --global user.email "andreas.roessler@hs-esslingen.de"

For /f "tokens=1-3 delims=. " %%a in ('date /t') do (set mydate=%%c-%%b-%%a)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a:%%b)

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
echo echo Build %mydate% %mytime%
echo set BUILDNR=%BUILDNR%
)>%VERSIONBAT%

git add %~f0
git add %VERSIONBAT%

git status
git commit -m "Build %BUILDNR%"
git status

git push origin master

