@echo off
for %%X in (mp4 mkv avi mov) do (
  for %%a in ("*.%%X") do (
    mkdir "%%~na"
    ffmpeg -i "%%a" -map 0:a:0 -vn "%%~na_1.mp3"
    ffmpeg -i "%%a" -map 0:a:1 -vn "%%~na_2.mp3"
    if "%%X"=="mp4" (
      ffmpeg -i "%%a" -an -c:v copy "%%~na\%%~na_mute.mp4"
    ) else (
      ffmpeg -i "%%a" -an "%%~na\%%~na_mute.mp4"
    )
    move "%%~na_1.mp3" "%%~na\"
    move "%%~na_2.mp3" "%%~na\"
    move "%%~na\%%~na_mute.mp4" "%%~na\"
  )
)
del *.mp4 *.mkv *.avi *.mov
pause
