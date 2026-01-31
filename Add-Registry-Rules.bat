@echo off
setlocal

set "WFCUExe=%~dp0\src\dist\WFCU.exe"

NET SESSION >nul 2>&1 
if %ERRORLEVEL% EQU 0 (
    echo ========== Adding WFCU to registry ===========

    REG ADD "HKCR\SystemFileAssociations\.jpeg\Shell\WFCU"  /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.png\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ico\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.bmp\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tiff\Shell\WFCU"  /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tif\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.webp\Shell\WFCU"  /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jfif\Shell\WFCU"  /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1

    REM For .jpeg
    REG ADD "HKCR\SystemFileAssociations\.jpeg\Shell\WFCU\shell\Convert To PNG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".png\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jpeg\Shell\WFCU\shell\Convert To WEBP\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".webp\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jpeg\Shell\WFCU\shell\Convert To BMP\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".bmp\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jpeg\Shell\WFCU\shell\Convert To ICO\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".ico\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jpeg\Shell\WFCU\shell\Convert To TIFF\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".tiff\""  /f >nul 2>&1
    echo JPEG  added to registry

    REM For .jpg
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU\shell\Convert To PNG\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".png\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU\shell\Convert To JPEG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".jpeg\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU\shell\Convert To WEBP\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".webp\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU\shell\Convert To ICO\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".ico\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU\shell\Convert To BMP\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".bmp\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jpg\Shell\WFCU\shell\Convert To TIFF\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".tiff\""  /f >nul 2>&1
    echo JPG   added to registry

    REM For .png
    REG ADD "HKCR\SystemFileAssociations\.png\Shell\WFCU\shell\Convert To GIF\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".gif\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.png\Shell\WFCU\shell\Convert To JPEG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".jpeg\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.png\Shell\WFCU\shell\Convert To WEBP\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".webp\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.png\Shell\WFCU\shell\Convert To ICO\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".ico\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.png\Shell\WFCU\shell\Convert To BMP\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".bmp\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.png\Shell\WFCU\shell\Convert To TIFF\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".tiff\""  /f >nul 2>&1
    echo PNG   added to registry

    REM For .ico
    REG ADD "HKCR\SystemFileAssociations\.ico\Shell\WFCU\shell\Convert To PNG\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".png\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ico\Shell\WFCU\shell\Convert To JPEG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".jpeg\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ico\Shell\WFCU\shell\Convert To WEBP\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".webp\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ico\Shell\WFCU\shell\Convert To BMP\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".bmp\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ico\Shell\WFCU\shell\Convert To TIFF\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".tiff\""  /f >nul 2>&1
    echo ICO   added to registry

    REM For .bmp
    REG ADD "HKCR\SystemFileAssociations\.bmp\Shell\WFCU\shell\Convert To PNG\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".png\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.bmp\Shell\WFCU\shell\Convert To JPEG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".jpeg\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.bmp\Shell\WFCU\shell\Convert To WEBP\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".webp\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.bmp\Shell\WFCU\shell\Convert To ICO\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".ico\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.bmp\Shell\WFCU\shell\Convert To TIFF\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".tiff\""  /f >nul 2>&1
    echo BMP   added to registry

    REM For .tiff
    REG ADD "HKCR\SystemFileAssociations\.tiff\Shell\WFCU\shell\Convert To PNG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".png\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tiff\Shell\WFCU\shell\Convert To JPEG\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".jpeg\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tiff\Shell\WFCU\shell\Convert To WEBP\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".webp\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tiff\Shell\WFCU\shell\Convert To ICO\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".ico\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tiff\Shell\WFCU\shell\Convert To BMP\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".bmp\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tiff\Shell\WFCU\shell\Convert To TIFF\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".tif\""   /f >nul 2>&1
    echo TIFF  added to registry

    REM For .tif
    REG ADD "HKCR\SystemFileAssociations\.tif\Shell\WFCU\shell\Convert To PNG\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".png\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tif\Shell\WFCU\shell\Convert To JPEG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".jpeg\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tif\Shell\WFCU\shell\Convert To WEBP\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".webp\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tif\Shell\WFCU\shell\Convert To ICO\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".ico\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tif\Shell\WFCU\shell\Convert To BMP\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".bmp\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.tif\Shell\WFCU\shell\Convert To TIFF\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".tiff\""  /f >nul 2>&1
    echo TIF   added to registry

    REM For .webp
    REG ADD "HKCR\SystemFileAssociations\.webp\Shell\WFCU\shell\Convert To PNG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".png\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.webp\Shell\WFCU\shell\Convert To JPEG\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".jpeg\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.webp\Shell\WFCU\shell\Convert To BMP\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".bmp\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.webp\Shell\WFCU\shell\Convert To ICO\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".ico\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.webp\Shell\WFCU\shell\Convert To TIFF\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".tiff\""  /f >nul 2>&1
    echo WEBP  added to registry

    REM For .jfif
    REG ADD "HKCR\SystemFileAssociations\.jfif\Shell\WFCU\shell\Convert To PNG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".png\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jfif\Shell\WFCU\shell\Convert To JPEG\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".jpeg\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jfif\Shell\WFCU\shell\Convert To WEBP\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".webp\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jfif\Shell\WFCU\shell\Convert To ICO\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".ico\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jfif\Shell\WFCU\shell\Convert To BMP\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".bmp\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.jfif\Shell\WFCU\shell\Convert To TIFF\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".tiff\""  /f >nul 2>&1
    echo JFIF  added to registry

    REM ===========================AUDIO FILES============================

    REG ADD "HKCR\SystemFileAssociations\.ogg\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.mp3\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.aac\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.flac\Shell\WFCU"  /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wma\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.m4a\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.alac\Shell\WFCU"  /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.opus\Shell\WFCU"  /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wav\Shell\WFCU"   /v "SubCommands" /t REG_SZ /d "" /f >nul 2>&1

    REM For .ogg
    REG ADD "HKCR\SystemFileAssociations\.ogg\Shell\WFCU\shell\Convert To MP3\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".mp3\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ogg\Shell\WFCU\shell\Convert To AAC\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".aac\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ogg\Shell\WFCU\shell\Convert To FLAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".flac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ogg\Shell\WFCU\shell\Convert To WMA\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".wma\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ogg\Shell\WFCU\shell\Convert To M4A\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".m4a\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ogg\Shell\WFCU\shell\Convert To ALAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".alac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ogg\Shell\WFCU\shell\Convert To OPUS\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".opus\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.ogg\Shell\WFCU\shell\Convert To WAV\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".wav\""   /f >nul 2>&1
    echo OGG   added to registry

    REM For .mp3
    REG ADD "HKCR\SystemFileAssociations\.mp3\Shell\WFCU\shell\Convert To OGG\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".ogg\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.mp3\Shell\WFCU\shell\Convert To AAC\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".aac\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.mp3\Shell\WFCU\shell\Convert To FLAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".flac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.mp3\Shell\WFCU\shell\Convert To WMA\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".wma\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.mp3\Shell\WFCU\shell\Convert To M4A\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".m4a\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.mp3\Shell\WFCU\shell\Convert To ALAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".alac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.mp3\Shell\WFCU\shell\Convert To OPUS\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".opus\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.mp3\Shell\WFCU\shell\Convert To WAV\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".wav\""   /f >nul 2>&1
    echo MP3   added to registry

    REM For .aac
    REG ADD "HKCR\SystemFileAssociations\.aac\Shell\WFCU\shell\Convert To OGG\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".ogg\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.aac\Shell\WFCU\shell\Convert To MP3\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".mp3\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.aac\Shell\WFCU\shell\Convert To FLAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".flac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.aac\Shell\WFCU\shell\Convert To WMA\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".wma\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.aac\Shell\WFCU\shell\Convert To M4A\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".m4a\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.aac\Shell\WFCU\shell\Convert To ALAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".alac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.aac\Shell\WFCU\shell\Convert To OPUS\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".opus\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.aac\Shell\WFCU\shell\Convert To WAV\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".wav\""   /f >nul 2>&1
    echo AAC   added to registry

    REM For .flac
    REG ADD "HKCR\SystemFileAssociations\.flac\Shell\WFCU\shell\Convert To OGG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".ogg\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.flac\Shell\WFCU\shell\Convert To MP3\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".mp3\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.flac\Shell\WFCU\shell\Convert To AAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".aac\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.flac\Shell\WFCU\shell\Convert To WMA\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".wma\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.flac\Shell\WFCU\shell\Convert To M4A\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".m4a\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.flac\Shell\WFCU\shell\Convert To ALAC\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".alac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.flac\Shell\WFCU\shell\Convert To OPUS\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".opus\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.flac\Shell\WFCU\shell\Convert To WAV\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".wav\""   /f >nul 2>&1
    echo FLAC  added to registry

    REM For .wma
    REG ADD "HKCR\SystemFileAssociations\.wma\Shell\WFCU\shell\Convert To OGG\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".ogg\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wma\Shell\WFCU\shell\Convert To MP3\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".mp3\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wma\Shell\WFCU\shell\Convert To AAC\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".aac\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wma\Shell\WFCU\shell\Convert To FLAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".flac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wma\Shell\WFCU\shell\Convert To M4A\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".m4a\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wma\Shell\WFCU\shell\Convert To ALAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".alac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wma\Shell\WFCU\shell\Convert To OPUS\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".opus\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wma\Shell\WFCU\shell\Convert To WAV\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".wav\""   /f >nul 2>&1
    echo WMA   added to registry

    REM For .m4a
    REG ADD "HKCR\SystemFileAssociations\.m4a\Shell\WFCU\shell\Convert To OGG\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".ogg\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.m4a\Shell\WFCU\shell\Convert To MP3\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".mp3\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.m4a\Shell\WFCU\shell\Convert To AAC\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".aac\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.m4a\Shell\WFCU\shell\Convert To FLAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".flac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.m4a\Shell\WFCU\shell\Convert To WMA\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".wma\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.m4a\Shell\WFCU\shell\Convert To ALAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".alac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.m4a\Shell\WFCU\shell\Convert To OPUS\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".opus\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.m4a\Shell\WFCU\shell\Convert To WAV\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".wav\""   /f >nul 2>&1
    echo M4A   added to registry

    REM For .alac
    REG ADD "HKCR\SystemFileAssociations\.alac\Shell\WFCU\shell\Convert To OGG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".ogg\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.alac\Shell\WFCU\shell\Convert To MP3\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".mp3\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.alac\Shell\WFCU\shell\Convert To AAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".aac\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.alac\Shell\WFCU\shell\Convert To FLAC\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".flac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.alac\Shell\WFCU\shell\Convert To WMA\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".wma\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.alac\Shell\WFCU\shell\Convert To M4A\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".m4a\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.alac\Shell\WFCU\shell\Convert To OPUS\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".opus\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.alac\Shell\WFCU\shell\Convert To WAV\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".wav\""   /f >nul 2>&1
    echo ALAC  added to registry

    REM For .opus
    REG ADD "HKCR\SystemFileAssociations\.opus\Shell\WFCU\shell\Convert To OGG\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".ogg\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.opus\Shell\WFCU\shell\Convert To MP3\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".mp3\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.opus\Shell\WFCU\shell\Convert To AAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".aac\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.opus\Shell\WFCU\shell\Convert To FLAC\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".flac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.opus\Shell\WFCU\shell\Convert To WMA\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".wma\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.opus\Shell\WFCU\shell\Convert To M4A\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".m4a\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.opus\Shell\WFCU\shell\Convert To ALAC\command"  /ve /d "\"%WFCUExe%\" \"%%1\" \".alac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.opus\Shell\WFCU\shell\Convert To WAV\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".wav\""   /f >nul 2>&1
    echo OPUS  added to registry

    REM For .wav
    REG ADD "HKCR\SystemFileAssociations\.wav\Shell\WFCU\shell\Convert To OGG\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".ogg\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wav\Shell\WFCU\shell\Convert To MP3\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".mp3\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wav\Shell\WFCU\shell\Convert To AAC\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".aac\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wav\Shell\WFCU\shell\Convert To FLAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".flac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wav\Shell\WFCU\shell\Convert To WMA\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".wma\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wav\Shell\WFCU\shell\Convert To M4A\command"    /ve /d "\"%WFCUExe%\" \"%%1\" \".m4a\""   /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wav\Shell\WFCU\shell\Convert To ALAC\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".alac\""  /f >nul 2>&1
    REG ADD "HKCR\SystemFileAssociations\.wav\Shell\WFCU\shell\Convert To OPUS\command"   /ve /d "\"%WFCUExe%\" \"%%1\" \".opus\""  /f >nul 2>&1
    echo WAV   added to registry

    echo ========== WFCU successfully added to registry ===========
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