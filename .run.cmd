@echo off

:: Currently stores the playlist for my downloads
set playlist_url=PL4cTJUshV2MCpGQuYti2_x0DLYkflTdNX

if [%1]==[list] ( call :list_ids )

exit /b
goto :eof

:list_ids
:: call _\list-playlist.cmd %playlist_url%
FOR /F "usebackq delims==" %%i IN (`_\list-playlist.cmd %playlist_url%`) DO ( @echo %%i )

goto :eof
