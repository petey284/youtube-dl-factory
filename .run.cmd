@echo off

:: Currently stores the playlist for my downloads
set playlist_url=PL4cTJUshV2MCpGQuYti2_x0DLYkflTdNX

if [%1]==[list] (
  call :list_ids
)
goto :eof

:list_ids
:: youtube-dl -j --flat-playlist PL4cTJUshV2MCpGQuYti2_x0DLYkflTdNX | jq -r ".id" | sed 's_^_https://youtu.be/_' > batch-file.txt
:: youtube-dl -j --flat-playlist PL4cTJUshV2MCpGQuYti2_x0DLYkflTdNX | jq -r ".id" | sed 's_^_https://youtu.be/_'
youtube-dl -j --flat-playlist PL4cTJUshV2MCpGQuYti2_x0DLYkflTdNX | jq -r ".id"
goto :eof
