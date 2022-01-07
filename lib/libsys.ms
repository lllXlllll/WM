#########################################
#                                       #
#           Library - General           #
#                                       #
#########################################

proc _AISS(@player, @content){
    try {
        @prefix = vault_user_prefix(ploc(@player)['world'], @player)
        foreach(@p in all_players()){
            play_sound(ploc(@p), array(sound: 'ENTITY_PHANTOM_BITE', null, volume: 100, null), @p)
            title(@p, null, _PM('system.alert.title'), 0, 0, 64)
            action_msg(@p, _PM('system.alert.actionbar', array(@prefix, @player, @content)))
        }
        broadcast(_PM('system.alert.broadcast', array(@prefix, @player, @content)))
        } catch(PlayerOfflineException @e) {
            @name = to_upper(player())
            foreach(@p in all_players()){
                play_sound(ploc(@p), array(sound: 'ENTITY_PHANTOM_BITE', null, volume: 100, null), @p)
                title(@p, null, _PM('system.alert.title'), 0, 0, 64)
                action_msg(@p, _PM('system.alert.e.actionbar', array(@name, @content)))
            }
            broadcast(_PM('system.alert.e.broadcast', array(@name, @content)))
        }
}

proc _comma(@bal){
	@splitStr = split('', @bal)
	@strLen = array_size(@splitStr)
		
	@result = ''
	@count = integer((@strLen - 1) / 3)
	for(@i = 0, @i < @count, @i++){
		for(@n = 0, @n < 3, @n++){
			@strLen = _size(@splitStr) - 1
			if(@strLen <= 0){ break() }
			@result = concat(@result, @splitStr[@strLen])
			array_remove(@splitStr, @strLen)
		}
		@result = concat(@result, ',')
	}
	array_reverse(@splitStr)
	@return = @result.array_implode(@splitStr, '')
		
	@splitStr = split('', @return)
	array_reverse(@splitStr)
	return(array_implode(@splitStr, ''))
}

proc _NT(@player){
    try {
        #create_objective('Test', 'dummy')
        #create_team('nametag.'.@player)
        #set_objective_display('Admin', array(SLOT: 'BELOW_NAME'))
    } catch(ScoreboardException @e) {
        //DO NOTHING
    }
}

proc _cooldown(@player, @id, @time){
    if(!has_permission('player.cooldown.bypass')){
        @t = get_value('cooldowns.'.@id);

        if(@t == null){
            store_value('cooldowns.'.@id, time());
            return(true);
        } else {
            if((time() - @t) / 1000 <= @time){
                @display = integer(@time - ((time() - @t) / 1000))
                play_sound(ploc(@player), array(sound: 'ENTITY_VILLAGER_DEATH', null, volume: 1, null), @player)
                action_msg(@player, _PM('system.cooldown.msg', array(@display)))
                die()
            } else {
                store_value('cooldowns.'.@id, time());
            }
        }
    }
}

proc _ATS(@player, @actionbar, @subtitle){
    if(@player == null) {
        foreach(@p in all_players()){
            action_msg(@p, @actionbar)
            title(@p, null, colorize(@subtitle), 0, 0, 64)
        }
    } else {
        action_msg(@player, @actionbar)
        title(@player, null, colorize(@subtitle))
    }
}

proc _DEBUG(@content){
    broadcast(_PM('system.debug', array(@content)))
}

proc _JQIFNULL(@var1){
    if(@var1 == null){
        return(_PM('system.not.sat'))
    } else {
        return(@var1)
    }
}

proc _broadcast_sound(@sound, @volume){
    foreach(@player in all_players()){
        play_sound(ploc(@player), array(sound: @sound, null, volume: @volume, null), @player)
    }
}

proc _IsInGroup(@player, @group){
    if(array_contains(pgroup(@player), @group)){
        return(true)
    } else {
        return(false)
    }
}

proc _GetModifiedUUID(@player){
    @key = replace(puuid(@player), '-', '_') 
    return(@key)
}

proc _action_broadcast(@message){
    foreach(@p in all_players()){
        action_msg(@p, @message)
    }
}

#########################################
#                                       #
#                BUNGEE                 #
#                                       #
#########################################

proc _writeUTF(@ba, @str){
    @len = length(@str)
    if (@len > 200) {
        die(_PM('system.bungee.stl'))
    }
    ba_put_byte(@ba, 0)
    ba_put_byte(@ba, @len)
    ba_put_bytes(@ba, string_get_bytes(@str, 'ascii'))
}
 
proc _SC(@player, @server){
    @ba = byte_array()
    _writeUTF(@ba, 'Connect')
    _writeUTF(@ba, @server)
    try {
        #bind('player_quit', array(priority: 'high', id: 'pq-'.@player), array(player: @player), @event, @server){
            #modify_event('message', _PM('system.bungee.psm', array(@event['player'], @server))
            #foreach(@p in all_players()){
                #action_msg(@p, _PM('system.bungee.psm', array(@event['player'], @server)))
            #}
            #unbind('pq-'.@event['player'])
        #}
        send_plugin_message(@player, 'BungeeCord', @ba)
    } catch(BindException @e){
        send_plugin_message(@player, 'BungeeCord', @ba)
    }
}

proc _DSC(@player, @server){
    @ba = byte_array()
    _writeUTF(@ba, 'Connect')
    _writeUTF(@ba, @server)
    send_plugin_message(@player, 'BungeeCord', @ba)
}