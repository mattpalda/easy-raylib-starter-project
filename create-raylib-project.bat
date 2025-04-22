@echo off
setlocal

if "%~1"=="" (
    echo Usage: create-raylib-project.bat NewProjectName
    exit /b 1
)

set "TEMPLATE_DIR=%~dp0EasyRaylibSetup"
set "OLD_NAME=EasyRaylibSetup"
set "NEW_NAME=%~1"
set "DEST_DIR=%~dp0%NEW_NAME%"

echo ---------------------------------------------------
echo Creating new project: %NEW_NAME%
echo Template folder:     %TEMPLATE_DIR%
echo Destination folder:  %DEST_DIR%
echo ---------------------------------------------------

REM Check if template folder exists
if not exist "%TEMPLATE_DIR%" (
    echo ERROR: Template folder not found: %TEMPLATE_DIR%
    pause
    exit /b 1
)

REM Copy all files
xcopy "%TEMPLATE_DIR%" "%DEST_DIR%" /E /I /Y > nul

REM Go into new folder
pushd "%DEST_DIR%"

REM Rename project files
if exist "%OLD_NAME%.sln" ren "%OLD_NAME%.sln" "%NEW_NAME%.sln"
if exist "%OLD_NAME%.vcxproj" ren "%OLD_NAME%.vcxproj" "%NEW_NAME%.vcxproj"
if exist "%OLD_NAME%.vcxproj.filters" ren "%OLD_NAME%.vcxproj.filters" "%NEW_NAME%.vcxproj.filters"
if exist "%OLD_NAME%.vcxproj.user" ren "%OLD_NAME%.vcxproj.user" "%NEW_NAME%.vcxproj.user"

REM Replace old name with new in project files
for %%F in ("%NEW_NAME%.sln" "%NEW_NAME%.vcxproj" "%NEW_NAME%.vcxproj.filters") do (
    if exist "%%F" powershell -Command "(Get-Content '%%F') -replace '%OLD_NAME%', '%NEW_NAME%' | Set-Content '%%F'"
)

popd

echo Project "%NEW_NAME%" created successfully!
pause