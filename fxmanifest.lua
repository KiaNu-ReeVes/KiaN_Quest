fx_version 'cerulean'
game 'gta5'

version '1.0.0'

server_script "@KiaN_Lib/server/def.lua"
client_script "@KiaN_Lib/client/def.lua"
client_scripts{
  'client.lua'
}
server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server.lua'
}

ui_page 'ui/index.html'
files {
	'ui/index.html',
	'ui/script.js',
	'ui/css/*',
	'ui/fonts/*',
	'ui/img/*',
}

client_script '@HaQ-AC/injection.lua'