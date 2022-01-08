bind('vote_received', null, null, @vote) {
   try {
      store_value('vote', get_value('vote') + 1)
      #broadcast('§b ▶ §6'.@vote[username].'§f님께서 추천하셨습니다. §b'.get_value('vote').' / 10')
      @prefix = vault_user_prefix(ploc(@vote['username'])['world'], @vote['username'])
      foreach(@player in all_players()){
         play_sound(ploc(@player), array(sound: 'ENTITY_PARROT_IMITATE_ENDERMITE', null, volume: 100, null), @player)
         action_msg(@player, colorize('§b ▶ §6'.@prefix.@vote['username'].'§f님께서 추천하셨습니다. §b'.get_value('vote').' / 21'))
      }
      #runas('~console', '/crate give to '.@vote['username'].' FoodKeyT3 1')
      if(get_value('vote') >= 21) {
		   store_value('vote', 0)
         broadcast('§f')
         broadcast('§b ▶ §f추천 §e21§f개를 달성했습니다!')
         broadcast('   §7추천 미스터리 상자의 열쇠가 지급되었습니다. §8(추후 도입되면 활성화됩니다.)')
         broadcast('   §7최근 추천기록이 없을 경우 보상은 드리지않습니다.')
         broadcast('§f')
		   foreach(@p in all_players()) {
            play_sound(ploc(@p), array(sound: 'ENTITY_FIREWORK_ROCKET_LAUNCH', null, volume: 0.7, null), @p)
            @isVoted = set_placeholders(@p, '%cmi_user_votecount%')
            if(@isVoted > 0){
			      acc_add(@isVoted, 10000)
            }
            @votetop = set_placeholders('%cmi_votetop_1%')
            title(@p, colorize('&3가장 많이 추천한 플레이어,'), colorize('§6'.@votetop.'&f, &e' .set_placeholders(@votetop, '%cmi_user_votecount%').'&f번'), 0, 0, 64)
            acc_add(@votetop, 100000)
		   }
	   }
      console(colorize('§6 ▶ §6'.@vote['username'].'&f님이 추천했습니다.'), false)
   } catch(PlayerOfflineException @e){
      store_value('vote', get_value('vote') + 1)
      foreach(@player in all_players()){
         play_sound(ploc(@player), array(sound: 'ENTITY_PARROT_IMITATE_ENDERMAN', null, volume: 100, null), @player)
         action_msg(@player, colorize('§b ▶ §6'.@vote['username'].'§7(오프라인)§f님께서 추천하셨습니다. §b'.get_value('vote').' / 21'))
      }
      if(get_value('vote') >= 21) {
		   store_value('vote', 0)
         broadcast('§f')
         broadcast('§b ▶ §f추천 §e21§f개를 달성했습니다!')
         broadcast('   §7추천 미스터리 상자의 열쇠가 지급되었습니다. §8(추후 도입되면 활성화됩니다.)')
         broadcast('   §7최근 추천기록이 없을 경우 보상은 드리지않습니다.')
         broadcast('§f')
		   foreach(@p in all_players()) {
            play_sound(ploc(@p), array(sound: 'ENTITY_FIREWORK_ROCKET_LAUNCH', null, volume: 0.7, null), @p)
            @isVoted = set_placeholders(@p, '%cmi_user_votecount%')
            if(@isVoted > 0){
			      acc_add(@isVoted, 1000)
            }
            @votetop = set_placeholders('%cmi_votetop_1%')
            title(@p, colorize('&3가장 많이 추천한 플레이어,'), colorize('§6'.@votetop.'&f, &e' .set_placeholders(@votetop, '%cmi_user_votecount%').'&f번'), 0, 0, 64)
            acc_add(@votetop, 10000)
		   }
	   }
      console(colorize('§6 ▶ §6'.@vote['username'].'&f님이 추천했습니다.'), false)
   }
}