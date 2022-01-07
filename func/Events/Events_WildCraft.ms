#########################################
#                                       #
#           Evnets - WildCraft          #
#                                       #
#########################################

bind('player_enter_bed', null, null, @e,
   action_msg(@e['player'], _PM('other.goodnight'))
)

bind('world_changed', null, null, @w,
   if(@w['to'] == 'World_Combat'){
      if(!has_permission(@w['player'], 'world.fly.bypass')){
         set_pflight(@w['player'], false)
      }
   }
)

bind('item_drop', null, null, @e,
   if(psneaking(@e['player']) == true){
      if(get_value('player.quickmenu.'.@e['player']) == null){
         cancel()
         run('/bs warp')
      }
   }
)

bind('player_death', null, null, @e,
   modify_event('death_message', null)
   foreach(@player in all_players()){
      action_msg(@player, '§b ▶ §f'@e['death_message'])
   }
)

bind('player_command', null, null, @e,

   @location = ploc(@e['player'])['world']
   @c = @e['command']
   @pw = 'World_Combat'

   #LIMIT COMMAND USAGE
   if(has_permission('world.command.bypass') == false || pisop(@e['player']) == false){
      if(@location == @pw){
         if(@c == '/sethome' || @c == '/fly' || @c == '/셋홈'){
            cancel();
            action_msg(_PM('command.na'))
         }
      }
   }

)

bind('player_death', null, null, @e,
   if(get_value('player.deathcount.'.@e['player']) == null){
      store_value('player.deathcount.'.@e['player'], 1)
   } else {
      @count = get_value('player.deathcount.'.@e['player']) + 1
      store_value('player.deathcount.'.@e['player'], @count)
   }
)

bind('player_death', null, null, @e,
   if(@e['killer'] == null){
      die()
   }
   if(get_value('player.killcount.'.@e['killer']) == null){
      store_value('player.killcount.'.@e['killer'], 1)
   } else {
      @finalcount = get_value('player.killcount.'.@e['killer']) + 1
      store_value('player.killcount.'.@e['killer'], @finalcount)
   }
   @prefix = vault_user_prefix(ploc(@e['player'])['world'], @e['player'])
   @steak = array(qty: 1, name: 'PORKCHOP', meta: array(display: colorize(@prefix.@e['player'].'§7님의 살점'), 
   lore: colorize('&7살 냄새가 많이나는 것 같다.')))
   #@rand = rand(1, 3)

   #if(@rand <= 1){
      drop_item(@e['location'], @steak)
   #}

)