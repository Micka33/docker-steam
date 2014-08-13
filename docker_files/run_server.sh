#!/bin/sh
cd /root/mounted
# Fixes [S_API FAIL] SteamAPI_Init() failed; unable to locate a running instance of Steam, or a local steamclient.dll.
export HOME="/root"
file="/root/.steam/sdk32/steamclient.so"
if ! [ -f "$file" ]
then
	mkdir -p ~/.steam/sdk32/
	ln -s /etc/service/steamcmd/linux32/steamclient.so "$file"
fi



# Classic Casual
# exec ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active
# Classic Competitive
exec ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1
# Arms Race
# exec ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 0 +mapgroup mg_armsrace
# Demolition
# exec ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 1 +mapgroup mg_demolition
# Deathmatch
# exec ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 2 +mapgroup mg_allclassic
