

# ===========================================================
# WFCU (Windows File Converter Utility) V1.0
# This script converts files to different formats
# For Optimizations, Suggestions or Bugs reports, please contact me on Discord
# Made by: Blur009(Github)
#          Blur.009(Discord)
# ===========================================================


import os, sys
from PIL import Image
exe_dir = os.path.dirname(sys.executable)
ffmpeg_bin = os.path.join(exe_dir, "ffmpeg", "bin")
os.environ["PATH"] = os.pathsep.join([ffmpeg_bin, exe_dir, os.environ["PATH"]])
import ffmpeg

try:
    # ===========================================================
    # Test if the script recieves arguments
    # ===========================================================
    exe_dir = os.path.dirname(sys.executable)
    log_path = os.path.join(exe_dir, "WFCU_log.txt")
    
    if len(sys.argv) < 3:
        with open(log_path, "a", encoding="utf-8") as f:
            f.write("Not enough arguments provided. Exiting.\n")
        sys.exit(0)  # Exit silently

    # ===========================================================
    # Initiate log file
    # ===========================================================

    # Delete the log file if it exceeds 100 KiB (102,400 bytes)
    if os.path.exists(log_path) and os.path.getsize(log_path) > 102400:
        os.remove(log_path)

    def log(msg):
    # Ensure log_path is always inside exe_dir
        if not os.path.abspath(log_path).startswith(os.path.abspath(exe_dir)):
            raise Exception("Unsafe log path detected!")
        with open(log_path, "a", encoding="utf-8") as f:
            f.write(msg + "\n")

    # ===========================================================
    # Get the file path and export type from command line arguments
    # ===========================================================

    file_path = sys.argv[1]  # File Directory, Name and Extension
    file_dir = os.path.dirname(file_path)  # Get the directory of the original file
    file_name = os.path.splitext(os.path.basename(file_path))[0]  # Get the file name without extension
    file_export_type = sys.argv[2]  # Get the file export type
    file_name_with_export_extension = f"{file_name}{file_export_type}"  # Get the file name with export extension

    log(f"File path: {file_path}")        
    log(f"File directory: {file_dir}")
    log(f"File name: {file_name}")      
    log(f"File export type: {file_export_type}")
    log(f"File name with extension: {file_name_with_export_extension}")

    # ===========================================================
    # Image Conversioabout:blank#blockedn
    # ===========================================================
    if file_export_type.lower() in (".jpeg", ".jpg", ".png", ".bmp", ".tiff", ".tif", ".ico", ".jfif", ".webp"):
        log("Image file detected")
        img = Image.open(file_path)  # Open the file (to memory)
        output_path = os.path.join(file_dir, f"{file_name}{file_export_type}")

        # Convert to RGB if exporting to a format that doesn't support transparency
        if file_export_type.lower() in (".jpg", ".jpeg", ".bmp", ".tiff", ".tif"):
            img = img.convert("RGB")
            log("Converted to RGB")
            img.save(output_path)
            log(f"Saved as {output_path}")
        else:
            img.save(output_path)  
            log(f"Saved as {output_path}")

    # ===========================================================
    # Audio Conversion
    # ===========================================================
    elif file_export_type.lower() in (".mp3", ".aac", ".flac", ".ogg", ".wma", ".m4a", ".alac", ".opus", ".wav"):
        log("Audio file detected")
        output_path = os.path.join(file_dir, f"{file_name}{file_export_type}")
        try:
            ffmpeg.input(file_path).output(output_path).run(capture_stdout=True, capture_stderr=True)
        except ffmpeg.Error as e:
            log("Audio conversion failed!")
            log(e.stderr.decode() if hasattr(e, 'stderr') and e.stderr else str(e))

    with open(log_path, "a", encoding="utf-8") as f:
        f.write("========================================\n")

except Exception as e:
    log("Unexpected error occurred!")
    log(str(e))
    