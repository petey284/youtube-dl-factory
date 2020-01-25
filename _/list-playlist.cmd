@echo off
if NOT [%1]==[] (
  youtube-dl -j --flat-playlist %1 | jq -r ".id"
)

