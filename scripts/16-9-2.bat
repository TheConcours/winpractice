@echo off
rem directory to be backed up
set SRC_DIR=%HOMEPATH%\winpractice\data

rem directory to be backed up
set DEST_DIR=%HOMEPATH%\winpractice\backup

echo ##### %DATE% %TIME% Backup Started #####
rem echo %SRC_DIR%
rem echo %DEST_DIR%

rem execute backup
xcopy %SRC_DIR% %DEST_DIR% /d /e /y /r

rem Error Detection
if %ERRORLEVEL% neq 0 goto error

rem Exit with Success
echo ##### %DATE% %TIME% Backup Ended. #####
goto end

:error
echo ##### %DATE% %TIME% #####
echo ##### Process Aborted due to unexpected error.#####
:end
exit
