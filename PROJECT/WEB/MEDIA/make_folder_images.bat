call ..\define_tool.bat
if not exist "..\CODE\static\image\%1" mkdir "..\CODE\static\image\%1"
for %%f in (static\image\%1\*.*) do %TOOL%\IMAGE_MAGICK\convert "%%f" -background white -alpha remove -alpha off -resize %2@ -interlace Plane -quality 70 -strip "..\CODE\static\image\%1\%%~nf.jpg"
for %%f in (static\image\%1\*.*) do %TOOL%\IMAGE_MAGICK\convert "%%f" -background white -alpha remove -alpha off -resize %3@ -interlace Plane -quality 70 -strip "..\CODE\static\image\%1\%%~nf.jpg.medium.jpg"
for %%f in (static\image\%1\*.*) do %TOOL%\IMAGE_MAGICK\convert "%%f" -background white -alpha remove -alpha off -resize %4@ -interlace Plane -quality 70 -strip "..\CODE\static\image\%1\%%~nf.jpg.small.jpg"
for %%f in (static\image\%1\*.*) do %TOOL%\IMAGE_MAGICK\convert "%%f" -background white -alpha remove -alpha off -resize %5@ -interlace Plane -quality 50 -strip "..\CODE\static\image\%1\%%~nf.jpg.preload.jpg"
