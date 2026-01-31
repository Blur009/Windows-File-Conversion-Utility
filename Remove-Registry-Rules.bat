@echo off
setlocal
title WFCU Uninstaller

set "ALL_EXTS=.webp .avif .heic .png .jpg .jpeg .bmp .gif .ico .tiff .tif .tga .dds .wav .flac .alac .aiff .mp3 .aac .m4a .ogg .opus"
set "RegFile=%temp%\wfcu_remove.reg"

cls
echo ======================================================
echo           WFCU CONTEXT MENU REMOVER
echo ======================================================
echo.
echo Removing WFCU from your system...
echo Windows Registry Editor Version 5.00 > "%RegFile%"

for %%e in (%ALL_EXTS%) do (
    <nul set /p "= Cleaning %%e... "
    echo [-HKEY_CURRENT_USER\Software\Classes\SystemFileAssociations\%%e\Shell\WFCU] >> "%RegFile%"
    echo Done.
)

regedit.exe /s "%RegFile%"
del "%RegFile%"

echo.
echo ------------------------------------------------------
echo   SUCCESS: WFCU has been removed from the menu.
echo   Thank you for using the tool!
echo ------------------------------------------------------
echo.
echo Closing automatically in 3 seconds...
timeout /t 3
exit