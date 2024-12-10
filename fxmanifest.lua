fx_version 'cerulean'
game 'rdr3'
lua54 'yes'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 'asfallen'
description 'weapon menu for players'
version '1.0.0'



server_script 'asfallen-weaponmenu-server.lua'

client_script 'asfallen-weaponmenu-client.lua'

dependencies {
    'vorp_core',
    'vorp_inventory',
    'vorp_utils'
}

