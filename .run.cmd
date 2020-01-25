@echo off

:: Currently stores the playlist for my downloads
set playlist_url=PL4cTJUshV2MCpGQuYti2_x0DLYkflTdNX

if [%1]==[list] ( call :list_ids
) else if [%1]==[add] (
  if [%2]==[command] ( call :add_command %3 )

) else if [%1]==[count] (
  call :count_vids
) else if [%1]==[set] (
  call :set_count
) else if [%1]==[run] (
  call :download
) else if [%1]==[download] (
  echo Downloading...
  youtube-dl --yes-playlist --playlist-start 21 --playlist-end 30 %playlist_url%
)

exit /b

:add_command
if NOT [%1]==[] ( git add %1 -f)
goto :eof

:count_vids
call _\count-vids.cmd
goto :eof

:set_count
@setlocal enableextensions enabledelayedexpansion
FOR /F "usebackq delims==" %%i IN (`_\count-vids`) DO (
    @echo %%i
    set count=%%i
) & set current_count=!count!

echo !current_count!
ENDLOCAL
goto :eof

:list_ids
FOR /F "usebackq delims==" %%i IN (`_\list-playlist.cmd %playlist_url%`) DO ( @echo %%i )
goto :eof

