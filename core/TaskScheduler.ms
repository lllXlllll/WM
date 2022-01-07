set_interval(30000, closure(
   if(tps()[0] <= '16'){
      _action_broadcast(_PM('system.notice.tps'))
      #foreach(@p in all_players()){
         #title(@p, _PM('system.notice.title'), colorize('&fTPS가 평소보다 낮습니다. &7#TOO_LOW_TPS'), 0, 0, 64)
      #}
      runas('~console', '/cmi unloadchunks')
      runas('~console', '/cmi killall')
   }
))

set_interval(30000, closure(
   foreach(@p in all_players()){
      if(get_value('player.notify.'.@p) == null){
         if(ping(@p) >= 128){
            title(@p, _PM('system.notice.title'), _PM('system.notice.ping.subtitle', array(ping(@p))), 0, 0, 64)
            action_msg(@p, _PM('system.notice.ping.ab', array(ping(@p))))
            play_sound(ploc(@p), array(sound: 'BLOCK_ANVIL_USE', null, volume: 0.7, null), @p)
         }
      }
   }
))

set_interval(1000, closure( #모두 로비로 이동, 로비는 재시작하지 않음
   if(simple_date('h mm ss a') == '4 59 50 AM'){
      foreach(@player in all_players()){
         action_msg(@player, '§c ▲ §c서버 재시작 시간입니다.')
         title(@player, '§c서버 재시작', '§f매일 오전 5시는 서버 재시작 시간입니다.', 0, 0, 60)
         play_sound(ploc(@player), array(sound: 'BLOCK_END_PORTAL_SPAWN', null, volume: 67, null), @player)
      }
      broadcast(_PM('system.server.restart.cd'))
      runas('~console', '/save-all')
      sleep(5)
      foreach(@p in all_players()){
         _DSC(@p, 'Lobby')
      }
      sleep(5)
      broadcast(_PM('system.server.restart'))
      runas('~console', '/restart')
   }
))

set_interval(7000, closure(
   foreach(@player in all_players()){
      @prefix = vault_user_prefix(ploc(@player)['world'], @player)
      set_list_name(@player, colorize(@prefix.display_name(@player)))
   }
))

set_timeout(7000, closure(
	if(!has_value('aliaseslist')) {
		store_value('aliaseslist', get_aliases())
	}
	@alist = get_value('aliaseslist')
	@calist = get_aliases()

	#최신 판에 존재하는 명령어는 전부 추가
	foreach(@calias in @calist) {
		@casplited = substr(split(' ', split(':', @calias)[1])[0], 1)
		register_command(@casplited, array(
			tabcompleter: closure(
				@players = array()
				@name = @arguments[2][length(@arguments[2]) - 1]
				foreach(@player in all_players()){
					if(string_position(to_lower(@player), to_lower(@name)) == 0){
						@players[] = @player;
					}
				}
			return(@players)
			))
		)
	}

	#과거 판에만 존재하는 명령어는 전부 삭제
	foreach(@alias in @alist) {
		if(array_contains(@calist, @alias)) {
			@asplited = substr(split(' ', split(':', @alias)[1])[0], 1)
			register_command(@asplited, array(
				tabcompleter: closure(
					@players = array()
					@name = @arguments[2][length(@arguments[2]) - 1]
					foreach(@player in all_players()){
						if(string_position(to_lower(@player), to_lower(@name)) == 0){
							@players[] = @player;
						}
					}
				return(@players)
				))
			)
		} else {
			@asplited = substr(split(' ', split(':', @alias)[1])[0], 1)
			try {
				unregister_command(@asplited)
			} catch(NotFoundException @exception){
				
			}
		}
	}
))