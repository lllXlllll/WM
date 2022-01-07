#########################################
#                                       #
#             DEV - WildCraft           #
#                                       #
#########################################

bind('async_player_chat', null, null, @f,
   if(string_contains(@f['message'], '[총]')){
      #@gun = array('/̵̿̿/̿̿ ̿̿ ̿̿ ', '︻╦̵̵͇╤───', '=ε︻╦̵̵͇ ╤───', '︻╦╤─', '╾━╤デ╦︻', '︻デ═一')
      #array_implode(array_rand(@gun, 1, false).'§r ')
      modify_event('message', replace(@f['message'], '[총]', '§7§l︻╦╤─§r'))
   } 
   if(string_contains(@f['message'], '[검]')){
      modify_event('message', replace(@f['message'], '[검]', '§8§m§l▬▬ι§f§m═══════ﺤ§r'))
   } 
   if(string_contains(@f['message'], '[하트]')){
      #@heart = array('▂▃▄▅▆▇█▓▒░§cI Love You§r░▒▓█▇▆▅▄▃▂', '§c❤', '§cᶫᵒᵛᵉᵧₒᵤ', '§c♥§7‿§c♥')
      modify_event('message', replace(@f['message'], '[하트]', '§c❤§r'))
   } 
   if(string_contains(@f['message'], '[해골]')){
      modify_event('message', replace(@f['message'], '[해골]', '§a☠§r'))
   } 
   if(string_contains(@f['message'], '[테스트]')){
      modify_event('message', replace(@f['message'], '[테스트]', '▂▃▄▅▆▇█▓▒░§cI Love You§r░▒▓█▇▆▅▄▃▂'))
   }
   if(string_contains(@f['message'], '[구글]')){
      modify_event('message', replace(@f['message'], '[구글]', '§3§lG§c§lo§6§lo§3§lg§2§ll§c§le§r'))
   }
   if(string_starts_with(@f['message'], './')){
      modify_event('message', replace(@f['message'], './', '/'))
   }
   #_DEBUG(@f['message'])
)

bind('async_player_chat', null, null, @e,
   foreach(@p in all_players()){
      if(import('chat.user.hide.'.@p) == true){
         #_DEBUG(@e['recipients'])
         #modify_event('recipients', array_remove(@e['recipients'], @p))
      }
      if(array_size(get_values('chat.user.spam.'.@p)) > 0){

      }
   }
)