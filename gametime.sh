#!/bin/bash

#pgrep is a more reliable way to get if a process is running.
#Tried using $(ps aux | grep steam | awk '{print $2}')
#But was running in to ghost processes.

steamProcess=$(pgrep steam)
discordProcess=$(pgrep Discord)

#if steamProcess and discordProcess are not running, launch. Else, close both (kill)
if [[ -n $steamProcess || -n $discordProcess ]]; then
    echo "Closing Steam [$steamProcess] and Discord [$discordProcess]."
    killall steam
    killall Discord
else
    steam &
    discord &
fi
