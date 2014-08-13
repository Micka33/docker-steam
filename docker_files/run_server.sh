#!/bin/sh
cd /root/mounted

# Classic Casual
# exec ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active
# Classic Competitive
exec ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_bomb_se
# Arms Race
# exec ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 0 +mapgroup mg_armsrace
# Demolition
# exec ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 1 +mapgroup mg_demolition
# Deathmatch
# exec ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 2 +mapgroup mg_allclassic
