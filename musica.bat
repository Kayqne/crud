@echo off
setlocal enabledelayedexpansion

set /p URL=Digite a URL do video ou playlist do YouTube: 

set /p DESTINO=Digite a pasta onde quer salvar (pressione Enter para padrão C:\Minhas Musicas): 
if "!DESTINO!"=="" set DESTINO=C:\Minhas Musicas

set FFMPEG_PATH=C:\ffmpeg\bin

echo.
echo Baixando para: !DESTINO!
echo Da URL: !URL!
echo.

yt-dlp -x --audio-format mp3 --audio-quality 0 --ffmpeg-location "!FFMPEG_PATH!" --continue --ignore-errors -o "!DESTINO!\%%(playlist_index)s - %%(title)s.%%(ext)s" "!URL!"

pause

