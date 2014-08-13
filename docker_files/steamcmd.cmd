// This is an example script
// see https://developer.valvesoftware.com/wiki/SteamCMD#Automating_SteamCMD
// for more info

// anonymous login is required in order to download CS:GO
login anonymous
// Where all the files will be stored
// Don't change, unless you know what you are doing
force_install_dir /root/mounted/
// See https://developer.valvesoftware.com/wiki/Dedicated_Servers_List#Linux_Dedicated_Servers
// to find your dedicated server ID
// 740: Counter-Strike: Global Offensive Dedicated Server
app_update 740


//It should always end by quit
//This script contains only the instructions to download the dedicated server
quit
