#########################################
#                                       #
#            Rand - WildCraft           #
#                                       #
#########################################

bind('player_death', null, null, @e,
   if(get_value('player.headdrop.'.@e['player']) == true){
      @head = array(data: 3, qty: 1, type: 397, meta: array(owner: @e['player'], flags: array('HIDE_ENCHANTS')))
      drop_item(@e['location'], @head)
   }
)

bind('block_break', null, null, @e,
   @rand = rand()
   @amount = rand(1, 4)
   #broadcast('§b  !  §cDEBUG: §f'@e['block'])
   if(@rand >= 0.99999 && @e['block'] == 'STONE') {
      foreach(@player in all_players()){
         action_msg(@player, _PM('rand.block.break.broadcast', array(@e['player'], '다이아몬드', @amount)))
      }
      runas('~console', '/cmi give '.@e['player'].' diamond_ingot' @amount)
   } else if(@rand >= 0.999 && @e['block'] == 'STONE') {
      runas('~console', '/cmi give '.@e['player'].' rotten_flesh' @amount)
      action_msg(@e['player'], _PM('rand.block.break', array('썩은고기', @amount)))
   } else if(@rand >= 0.9999 && @e['block'] == 'STONE') {
      runas('~console', '/cmi give '.@e['player'].' rotten_flesh' @amount)
      action_msg(@e['player'], _PM('rand.block.break', array('철', @amount)))
   }
)

#bind('entity_explode', null, array(world: 'World_Wild', type: 'PRIMED_TNT'), @tm,
#   try {
#      @explodedby = players_in_radius(@tm['location'], 11)
#      if(array_size(@explodedby) > 1 || array_size(@explodedby) == 0){
#         die()
#      }
#      #broadcast('§c  !  DEBUG: §r'.@tm['type'] @explodedby)
#      @rand = rand()
#      @amount = rand(1, 4)
#      if(@rand >= 0.5 && @rand < 0.51) {
#         foreach(@player in all_players()){
#            action_msg(@player, _PM('rand.tnt.got', array(@explodedby[0], '철', @amount)))
#         }
#         runas('~console', '/cmi give '.@explodedby[0].' iron '.@amount)
#      } else if(@rand >= 0.1 && @rand < 0.3) {
#         set_peffect(@explodedby[0], 'NAUSEA', 11, 11)
#      } else if(@rand >= 0.1 && @rand < 0.31) {
#         pkill(@explodedby[0])
#         foreach(@player in all_players()){
#            action_msg(@player, _PM('rand.tnt.dead', array(@explodedby[0])))
#         }
#      } else {
#         acc_add(@explodedby[0], 2)
#         action_msg(@explodedby[0], _PM('rand.tnt.got.money'))
#      }
#   } catch(NotFoundException @e){
#      cancel();
#   } catch(PlayerOfflineException @ex){
#      cancel();
#   }
#)
