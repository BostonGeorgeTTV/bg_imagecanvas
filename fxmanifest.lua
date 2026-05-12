fx_version 'cerulean'
game 'gta5'

description 'Image Canvas'
author 'BostonGeorgeTTV'

lua54 'yes'

shared_script '@ox_lib/init.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

files {
    'nui/index.html',
    'nui/style.css'
}

ui_page 'nui/index.html'
