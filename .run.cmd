@echo off

:: Currently stores the playlist for my downloads
set playlist_url=PL4cTJUshV2MCpGQuYti2_x0DLYkflTdNX

if [%1]==[add] (
  if [%2]==[command] ( call :add_command %3 )
)
if [%1]==[list] ( call :list_ids )

exit /b
goto :eof

:add_command
if NOT [%1]==[] ( git add %1 -f)
goto :eof

:list_ids
FOR /F "usebackq delims==" %%i IN (`_\list-playlist.cmd %playlist_url%`) DO ( @echo %%i )

goto :eof
