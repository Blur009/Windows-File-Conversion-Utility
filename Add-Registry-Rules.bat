@echo off
setlocal enabledelayedexpansion
title WFCU Registry Installer

set "WFCUExe=%~dp0Engine.exe"
set "EscapedExe=%WFCUExe:\=\\%"

:: The specific extensions we want to support in Windows Explorer
set "IMG_ASSOC=.jpg .jpeg .png .webp .gif .ico .heic .avif .bmp .tiff"
set "AUD_ASSOC=.mp3 .wav .flac .m4a .aac .ogg .opus"

:: The "Target" formats we want to show in the right-click menu
set "IMG_TARGETS=.jpg .png .webp .gif .ico .heic .avif .bmp .tiff"
set "AUD_TARGETS=.mp3 .wav .flac .m4a .aac .ogg .opus"

set "RegFile=%temp%\wfcu_setup.reg"

echo Windows Registry Editor Version 5.00 > "%RegFile%"

:: --- Images ---
for %%i in (%IMG_ASSOC%) do (
    echo [HKEY_CURRENT_USER\Software\Classes\SystemFileAssociations\%%i\Shell\WFCU] >> "%RegFile%"
    echo "MUIVerb"="Convert Image To..." >> "%RegFile%"
    echo "SubCommands"="" >> "%RegFile%"
    echo "Icon"="%EscapedExe%,0" >> "%RegFile%"
    
    set /a count=10
    for %%o in (%IMG_TARGETS%) do (
        set /a count+=1
        set "clean=%%o"
        set "clean=!clean:.=!"
        echo [HKEY_CURRENT_USER\Software\Classes\SystemFileAssociations\%%i\Shell\WFCU\shell\!count!_!clean!] >> "%RegFile%"
        echo "MUIVerb"="!clean!" >> "%RegFile%"
        echo [HKEY_CURRENT_USER\Software\Classes\SystemFileAssociations\%%i\Shell\WFCU\shell\!count!_!clean!\command] >> "%RegFile%"
        echo @="\"%EscapedExe%\" \"%%1\" \"%%o\"" >> "%RegFile%"
    )
)

:: --- Audio ---
for %%a in (%AUD_ASSOC%) do (
    echo [HKEY_CURRENT_USER\Software\Classes\SystemFileAssociations\%%a\Shell\WFCU] >> "%RegFile%"
    echo "MUIVerb"="Convert Audio To..." >> "%RegFile%"
    echo "SubCommands"="" >> "%RegFile%"
    echo "Icon"="%EscapedExe%,0" >> "%RegFile%"

    set /a count=10
    for %%o in (%AUD_TARGETS%) do (
        set /a count+=1
        set "clean=%%o"
        set "clean=!clean:.=!"
        echo [HKEY_CURRENT_USER\Software\Classes\SystemFileAssociations\%%a\Shell\WFCU\shell\!count!_!clean!] >> "%RegFile%"
        echo "MUIVerb"="!clean!" >> "%RegFile%"
        echo [HKEY_CURRENT_USER\Software\Classes\SystemFileAssociations\%%a\Shell\WFCU\shell\!count!_!clean!\command] >> "%RegFile%"
        echo @="\"%EscapedExe%\" \"%%1\" \"%%o\"" >> "%RegFile%"
    )
)

regedit.exe /s "%RegFile%"
del "%RegFile%"
echo Installation complete. Closing in 3 seconds.
timeout /t 3
exit