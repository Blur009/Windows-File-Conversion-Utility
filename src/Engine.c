/*
 * Windows File Conversion Utility (WFCU) - Engine
 * Copyright (C) 2026  [Blur009]
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <wininet.h>
#pragma comment(lib, "wininet.lib")

#define CURRENT_VERSION "v1.0.0"
#define REPO_URL "https://api.github.com/repos/YOUR_USERNAME/WFCU/releases/latest"

void check_for_updates() {
    HINTERNET hInternet = InternetOpen("WFCU-Updater", INTERNET_OPEN_TYPE_DIRECT, NULL, NULL, 0);
    if (hInternet) {
        HINTERNET hConnect = InternetOpenUrl(hInternet, REPO_URL, NULL, 0, INTERNET_FLAG_RELOAD, 0);
        if (hConnect) {
            char buffer[2048];
            DWORD bytesRead;
            if (InternetReadFile(hConnect, buffer, sizeof(buffer) - 1, &bytesRead)) {
                buffer[bytesRead] = '\0';
                
                // GitHub API returns a JSON. We look for "tag_name":"vX.X.X"
                char *tag_pos = strstr(buffer, "\"tag_name\":\"");
                if (tag_pos) {
                    tag_pos += 12; // Move past "tag_name":"
                    char *end_quote = strchr(tag_pos, '\"');
                    if (end_quote) {
                        *end_quote = '\0';
                        
                        if (_stricmp(tag_pos, CURRENT_VERSION) != 0) {
                            int msgboxID = MessageBox(
                                NULL,
                                "A new version of WFCU is available! Would you like to visit the download page?",
                                "Update Available",
                                MB_ICONINFORMATION | MB_YESNO | MB_DEFBUTTON1
                            );

                            if (msgboxID == IDYES) {
                                ShellExecute(NULL, "open", "https://github.com/YOUR_USERNAME/WFCU/releases", NULL, NULL, SW_SHOWNORMAL);
                            }
                        }
                    }
                }
            }
            InternetCloseHandle(hConnect);
        }
        InternetCloseHandle(hInternet);
    }
}

typedef struct {
    const char *ext;
    const char *params;
} ExtensionMap;

// The Ultimate Lookup Table for Images and Audio
static const ExtensionMap format_table[] = {
    // --- Images ---
    {".png",  "-c:v png"},
    {".jpg",  "-q:v 2"},
    {".jpeg", "-q:v 2"},
    {".bmp",  "-c:v bmp"},
    {".webp", "-lossless 1"},
    {".gif",  "-vf \"split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse\""},
    {".ico",  "-vf \"scale=256:256:force_original_aspect_ratio=decrease,pad=256:256:(ow-iw)/2:(oh-ih)/2:color=black@0\""},
    {".tiff", "-c:v tiff"},
    {".tif",  "-c:v tiff"},
    {".tga",  "-c:v targa"},
    {".dds",  "-c:v dds"},
    {".avif", "-c:v libaom-av1 -crf 30"},
    {".heic", "-c:v libx265 -crf 28"},

    // --- Audio ---
    {".mp3",  "-c:a libmp3lame -q:a 0"},
    {".aac",  "-c:a aac -q:a 2"},
    {".m4a",  "-c:a aac -q:a 2"},
    {".wav",  "-c:a pcm_s16le"},
    {".flac", "-c:a flac"},
    {".opus", "-c:a libopus -b:a 128k"},
    {".ogg",  "-c:a libvorbis -q:a 5"},
    {".alac", "-c:a alac"},
    {".aiff", "-c:a pcm_s16be"}
};

const char* get_params(const char *target_ext) {
    int num_formats = sizeof(format_table) / sizeof(ExtensionMap);
    for (int i = 0; i < num_formats; i++) {
        if (_stricmp(target_ext, format_table[i].ext) == 0) {
            return format_table[i].params;
        }
    }
    return "-c copy"; // Universal fallback
}

int APIENTRY WinMain(HINSTANCE hInst, HINSTANCE hPrev, LPSTR lpCmdLine, int nCmdShow) {
    if (__argc < 3) return 1;

    char *input_file = __argv[1];
    char *target_ext = __argv[2];

    // 1. Find FFmpeg in the /bin folder relative to this exe
    char engine_path[MAX_PATH];
    GetModuleFileName(NULL, engine_path, MAX_PATH);
    char *last_backslash = strrchr(engine_path, '\\');
    if (last_backslash) *last_backslash = '\0';
    
    char ffmpeg_path[MAX_PATH];
    _snprintf(ffmpeg_path, MAX_PATH, "%s\\bin\\ffmpeg.exe", engine_path);

    // 2. Generate Output Filename (swapping extension)
    char output_file[MAX_PATH];
    strncpy(output_file, input_file, MAX_PATH);
    char *last_dot = strrchr(output_file, '.');
    if (last_dot) *last_dot = '\0';
    strncat(output_file, target_ext, MAX_PATH - strlen(output_file) - 1);

    // 3. Build Command
    const char *params = get_params(target_ext);
    char cmd_args[4096];
    _snprintf(cmd_args, sizeof(cmd_args), "-v quiet -y -i \"%s\" %s \"%s\"", 
              input_file, params, output_file);

    // 4. Execution (Hidden)
    ShellExecute(NULL, "open", ffmpeg_path, cmd_args, NULL, SW_HIDE);

    return 0;
}