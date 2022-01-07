bind('player_chat', null, null, @e,
   if(import('offchat') == 'true'){
	   if(has_permission(@e['player'], 'manage.chat.bypass') == false){
         cancel()
         action_msg(@e['player'], _PM('system.chat.na'))
		}
	}
)

bind('player_chat', null, null, @e,
   if(import('slowchat') == 'true'){
      if(has_permission(@e['player'], 'manage.chat.bypass') == false){
	      if(import('cc.'.@e['player']) == null){
	         export('cc.'.@e['player'], true)
	         set_timeout(3000, closure(){
		         export('cc.'.@e['player'], null)
			      if(ponline(@e['player']) == true){
                  action_msg(@e['player'], _PM('system.schat.able'))
			      } 
	         })
	      } else {
	         cancel();
            msg(_PM('system.schat.wait'))
	      }
      }
   }
)
bind('async_player_chat', null, null, @f,
   @downcase = to_lower(@f['message'])
   if(string_contains(@f['message'], '렉') || string_contains(@downcase, 'tps')){
      _action_broadcast(_PM('system.chat.tps', array(tps())))
   }
)

bind('async_player_chat', null, null, @f,
   @downcase = to_lower(@f['message'])
   if(string_contains(@f['message'], '핑') || string_contains(@downcase, 'ping')){
      _action_broadcast(_PM('system.chat.plpi', array(@f['player'], ping(@f['player']))))
   }
)

bind('async_player_chat', null, null, @f,
   @blocked = 'Chat'
   if(string_contains(@f['message'], @blocked)){
      cancel();
   }
)