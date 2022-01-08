bind('player_join', null, null, @e,

    @prefix = vault_user_prefix(ploc(@e['player'])['world'], player())
    @name = display_name(@e['player'])
    @sv = import('version')
    #_DEBUG(@e['player'])

    set_list_name(@e['player'], colorize(@prefix.display_name(@e['player']))) #TABLIST PREFIX EDIT
    _NT(@e['player'])

    if(get_value('manage.silentjq.'.@e['player']) == true && _IsInGroup(@e['player'], 'police') == true){
        modify_event('message', null)
        die()
    }

    if(get_value('player.jqeffect.'.@e['player']) == null){
        #_DEBUG(get_value('player.joineffect.'.@e['player']))
        #_DEBUG(get_value('player.jqeffect.'.@e['player']))
        foreach(@player in all_players()){
            action_msg(@player, _PM('system.player.join', array(@prefix, @e['player']))) #GENERAL JOIN MESSAGE
        }
        if(_IsInGroup(@e['player'], 'admin') || _IsInGroup(@e['player'], 'staff') || _IsInGroup(@e['player'], 'police')){
            modify_event('message', _PM('system.player.join', array(@prefix, @e['player'])))
            _broadcast_sound('BLOCK_END_PORTAL_SPAWN', 0.5)
            if(get_value('player.custom.jqmessage.'.@e['player']) == null){
                foreach(@player in all_players()){
                    title(@player, null, _PM('system.player.join', array(@prefix, @e['player'])), 0, 0, 60)
                }
            } else {
                foreach(@player in all_players()){
                    title(@player, null, colorize(get_value('player.custom.jqmessage.'.@e['player'])), 0, 0, 60)
                }
            }
        } else if(_IsInGroup(@e['player'], 'mvp') || _IsInGroup(@e['player'], 'vip')){
            modify_event('message', _PM('system.player.join', array(@prefix, @e['player'])))
            _broadcast_sound('ENTITY_PARROT_IMITATE_ENDER_DRAGON', 0.4)
            if(get_value('player.custom.jqmessage.'.@e['player']) == null){
                foreach(@player in all_players()){
                    title(@player, null, _PM('system.player.join', array(@prefix, @e['player'])), 0, 0, 60)
                }
            } else {
                foreach(@player in all_players()){
                    title(@player, null, colorize(get_value('player.custom.jqmessage.'.@e['player'])), 0, 0, 60)
                }
            }
        } else if(@e['first_login'] == true){
            modify_event('message', _PM('system.player.firstjoin', array(@prefix, @e['player'])))
            foreach(@player in all_players()){
                action_msg(@player, _PM('system.player.firstjoin', array(@prefix, @e['player'])))
                #title(@player, null, _PM('system.player.join', array(@prefix, @e['player'])), 0, 0, 60)
                play_sound(ploc(@player), array(sound: 'BLOCK_ANVIL_PLACE', null, volume: 0.2, null), @player)
            }
        } else {
            modify_event('message', _PM('system.player.join', array(@prefix, @e['player'])))
            foreach(@player in all_players()){
                play_sound(ploc(@player), array(sound: 'ENTITY_CHICKEN_EGG', null, volume: 67, null), @player)
            }
        }
    } else {
        modify_event('message', null)
        foreach(@player in all_players()){
            action_msg(@player, _PM('system.player.join', array(@prefix, @e['player']))) #GENERAL JOIN MESSAGE
        }
    }

    #General
    title(@e['player'], _PM('system.player.join.title'), _PM('system.player.join.subtitle'), 0, 0, 64)
    if(get_protocol_version(@e['player']) != @sv){
        play_sound(ploc(@e['player']), array(sound: 'BLOCK_ANVIL_USE', null, volume: 0.3, null), @e['player'])
        title(@e['player'], _PM('system.notice.title'), _PM('system.notice.mcv.subtitle', array(@sv)), 0, 0, 64)
        action_msg(@e['player'], _PM('system.notice.mcv.actionbar'))
        msg(_PM('system.notice.mcv.msg', array(_PM('system.notice.mcv.actionbar'), @sv, get_protocol_version(@e['player']))))
    }

)

bind('player_quit', null, null, @e,

    @prefix = vault_user_prefix(ploc(@e['player'])['world'], player())
    @name = display_name(@e['player'])

    if(get_value('manage.silentjq.'.@e['player']) == true && _IsInGroup(@e['player'], 'police') == true){
        modify_event('message', null)
        die()
    }

    #if(get_value('player.jqeffect.'.@e['player']) == null || get_value('player.quiteffect.'.@e['player']) == null){
    if(get_value('player.jqeffect.'.@e['player']) == null){
        #General Group
        foreach(@player in all_players()){
            action_msg(@player, _PM('system.player.quit', array(@prefix, @e['player'])))
        }
        if(_IsInGroup(@e['player'], 'admin') || _IsInGroup(@e['player'], 'staff') || _IsInGroup(@e['player'], 'police')){
            modify_event('message', _PM('system.player.quit', array(@prefix, @e['player'])))
            _broadcast_sound('BLOCK_END_PORTAL_SPAWN', 0.5)
            if(get_value('player.custom.jqmessage.'.@e['player']) == null){
                foreach(@player in all_players()){
                    title(@player, null, _PM('system.player.quit', array(@prefix, @e['player'])), 0, 0, 60)
                }
            } else {
                foreach(@player in all_players()){
                    title(@player, null, colorize(get_value('player.custom.jqmessage.'.@e['player'])), 0, 0, 60)
                }
            }
        } else if(_IsInGroup(@e['player'], 'mvp') || _IsInGroup(@e['player'], 'vip')){
            modify_event('message', _PM('system.player.quit', array(@prefix, @e['player'])))
            _broadcast_sound('ENTITY_PARROT_IMITATE_ENDER_DRAGON', 0.4)
            if(get_value('player.custom.jqmessage.'.@e['player']) == null){
                foreach(@player in all_players()){
                    title(@player, null, _PM('system.player.quit', array(@prefix, @e['player'])), 0, 0, 60)
                }
            } else {
                foreach(@player in all_players()){
                    title(@player, null, colorize(get_value('player.custom.jqmessage.'.@e['player'])), 0, 0, 60)
                }
            }
        } else {
            modify_event('message', null)
            foreach(@player in all_players()){
                play_sound(ploc(@player), array(sound: 'ENTITY_CHICKEN_EGG', null, volume: 67, null), @player)
            }
        }
    } else {
        modify_event('message', null)
        foreach(@player in all_players()){
            action_msg(@player, _PM('system.player.quit', array(@prefix, @e['player'])))
        }
    }
)