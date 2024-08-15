@REM Description: This script installs Git using winget, adds Git to the PATH, sets VS Code as the default Git editor, and configures Git with a username and email.

@echo off
setlocal enabledelayedexpansion

:: Prompt for Git username and email before installation
set /p git_username=Enter your Git username: 
set /p git_email=Enter your Git email: 

:: Store the username and email in variables
echo You entered:
echo Username: %git_username%
echo Email: %git_email%
echo Starting installation...

:: Install Git using winget
echo Installing Git...
winget install --id Git.Git -e --source winget

:: Add Git to PATH
@REM setx PATH "C:\Program Files\Git\bin"
set PATH=%PATH%;C:\Program Files\Git\bin
echo Git has been added to the PATH.

:: Set VS Code as the default Git editor
echo Setting VS Code as the default Git editor...
git config --global core.editor "code --wait"

:: Set the Git username and email using the stored variables
echo Configuring Git with username and email...
git config --global user.name "%git_username%"
git config --global user.email "%git_email%"

:: Download and set up the commit-msg hook
@REM echo Downloading and setting up commit-msg hook...
@REM curl -Lo .git/hooks/commit-msg https://gerrit.pixelexperience.org/tools/hooks/commit-msg
@REM if %errorlevel% neq 0 (
@REM     echo Failed to download commit-msg hook.
@REM     exit /b 1
@REM )

:: Make the commit-msg hook executable
:: Note: Windows doesn't support chmod, but you can ensure it's writable if needed.
attrib +r .git\hooks\commit-msg

echo Git and Visual Studio Code have been configured.
echo Git username and email have been set.
echo The commit-msg hook has been downloaded and set up.

:: Prompt to press spacebar to close the command prompt
echo.
echo Press the spacebar to close the command prompt.
pause >nul

endlocal
