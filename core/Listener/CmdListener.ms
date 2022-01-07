bind('player_command', null, null, @e,
   foreach(@player in all_players()){
	   if(has_permission(@player, 'manage.commandspy') == true){
		   if(import('commandspy.'.@player) == null){
		      tmsg(@player, _PM('system.commandspy.ucd', array(@e['player'], @e['command'])))
			}
		}
	}
)