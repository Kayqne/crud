@echo off
setlocal enabledelayedexpansion

:: Pergunta o link da playlist ou vídeo
set /p URL=Digite a URL do video ou playlist do YouTube: 

:: Pergunta a pasta de destino (padrão C:\Minhas Musicas)
set /p DESTINO=Digite a pasta onde quer salvar (pressione Enter para padrão C:\Minhas Musicas): 
if "!DESTINO!"=="" set DESTINO=C:\Minhas Musicas

:: Caminho do FFmpeg (ajuste se precisar)
set FFMPEG_PATH=C:\ffmpeg\bin

echo.
echo Baixando para: !DESTINO!
echo Da URL: !URL!
echo.

yt-dlp -x --audio-format mp3 --audio-quality 0 --ffmpeg-location "!FFMPEG_PATH!" --continue --ignore-errors -o "!DESTINO!\%%(playlist_index)s - %%(title)s.%%(ext)s" "!URL!"

pause
