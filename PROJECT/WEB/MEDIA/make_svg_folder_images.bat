if not exist "..\CODE\%1" mkdir "..\CODE\%1"
for %%f in (..\CODE\%1\*.svg) do %TOOL%\IMAGE_MAGICK\convert -background none -alpha set -size 2048x -resize 288x -strip "%%f" "..\CODE\%1\%%~nf.svg.288.png"
for %%f in (..\CODE\%1\*.svg) do %TOOL%\IMAGE_MAGICK\convert -background none -alpha set -size 2048x -resize 192x -strip "%%f" "..\CODE\%1\%%~nf.svg.192.png"
for %%f in (..\CODE\%1\*.svg) do %TOOL%\IMAGE_MAGICK\convert -background none -alpha set -size 2048x -resize 96x -strip "%%f" "..\CODE\%1\%%~nf.svg.96.png"
