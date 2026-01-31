@echo off

NET SESSION >nul 2>&1
if %ERRORLEVEL% EQU 0 (

REM =========== IMAGE FILES ==============
REG DELETE "HKCR\SystemFileAssociations\.jpg\Shell\WFCU"  /f
REG DELETE "HKCR\SystemFileAssociations\.jpeg\Shell\WFCU" /f
REG DELETE "HKCR\SystemFileAssociations\.png\Shell\WFCU"  /f
REG DELETE "HKCR\SystemFileAssociations\.ico\Shell\WFCU"  /f
REG DELETE "HKCR\SystemFileAssociations\.bmp\Shell\WFCU"  /f
REG DELETE "HKCR\SystemFileAssociations\.tiff\Shell\WFCU" /f
REG DELETE "HKCR\SystemFileAssociations\.tif\Shell\WFCU"  /f
REG DELETE "HKCR\SystemFileAssociations\.webp\Shell\WFCU" /f
REG DELETE "HKCR\SystemFileAssociations\.jfif\Shell\WFCU" /f

REM =========== AUDIO FILES ==============
REG DELETE "HKCR\SystemFileAssociations\.ogg\Shell\WFCU"  /f
REG DELETE "HKCR\SystemFileAssociations\.mp3\Shell\WFCU"  /f
REG DELETE "HKCR\SystemFileAssociations\.aac\Shell\WFCU"  /f
REG DELETE "HKCR\SystemFileAssociations\.flac\Shell\WFCU" /f
REG DELETE "HKCR\SystemFileAssociations\.wma\Shell\WFCU"  /f
REG DELETE "HKCR\SystemFileAssociations\.m4a\Shell\WFCU"  /f
REG DELETE "HKCR\SystemFileAssociations\.alac\Shell\WFCU" /f
REG DELETE "HKCR\SystemFileAssociations\.opus\Shell\WFCU" /f
REG DELETE "HKCR\SystemFileAssociations\.wav\Shell\WFCU"  /f

echo ========== WFCU sucessfully Removed from registry ===========
echo.
echo.
echo exiting...
timeout /t 2
exit
) else (
     echo This script must be run with administrator privileges. Please run it as an administrator.
     echo exiting...
     timeout /t 7
     exit
)