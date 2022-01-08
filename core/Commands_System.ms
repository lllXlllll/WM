#########################################
#                                       #
#           COMMANDS - General          #
#                                       #
#########################################

register_command('', array(
    'description': '주소를 봅니다.',
    'aliases':array('주소', '홈페이지', 'link', '카페', '추천', '가이드', 'guide', 'ㄱ', '도움말'),
    'executor': closure(@alias) {
        msg(_PM('command.link'))
    }
));

register_command('commandspy', array(
    'description': '유저들의 명령어를 봅니다.',
    'permission': 'manage.commandspy',
    'noPermMsg': '§c ▲ §f권한이 없거나, 명령어가 존재하지 않습니다.',
    'tabcompleter': closure(@alias),
    'aliases':array('cs'),
    'executor': closure(@alias, @sender, @args) {
        if(import('commandspy.'.@sender) == null){
	        export('commandspy.'.@sender, false)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('    §7이제, 유저의 명령어가 보이지 않습니다.')
			msg('§f')
		} else {
		    export('commandspy.'.@sender, null)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('    §7이제, 유저의 명령어가 보입니다.')
			msg('§f')
		}
    }
));

register_command('jqeffect', array(
    'description': '나가거나 들어올때의 효과를 설정합니다. (프리미엄 유저+)',
    'permission': 'player.jqeffect',
    'noPermMsg': '§c ▲ §f권한이 없거나, 명령어가 존재하지 않습니다.',
    'tabcompleter': closure(@alias), 
    'aliases':array('jq', 'ㅓㅂㄷㄹㄹㄷㅊㅅ'),
    'executor': closure(@alias, @sender, @args) {
        if(get_value('player.jqeffect.'.@sender) == null){
	        store_value('player.jqeffect.'.@sender, false)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('    §7이제, 참가 또는 퇴장시, 이팩트가 실행되지 않습니다.')
			msg('§f')
		} else {
		    clear_value('player.jqeffect.'.@sender)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('    §7이제, 참가 또는 퇴장시, 이팩트가 발동됩니다.')
			msg('§f')
		}
    }
));

register_command('jqsilent', array(
    'description': '참가 및 퇴장시의 효과의 여부를 설정합니다. (관리자)',
    'permission': 'manage.jqsilent',
    'noPermMsg': '§c ▲ §f권한이 없거나, 명령어가 존재하지 않습니다.',
    'tabcompleter': closure(@alias), 
    'aliases':array('jqs'),
    'executor': closure(@alias, @sender, @args) {
        if(get_value('manage.silentjq.'.@sender) == null){
	        store_value('manage.silentjq.'.@sender, true)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('    §7이제, 참가 또는 퇴장시, 이팩트가 실행되지 않습니다.')
			msg('§f')
		} else {
		    clear_value('manage.silentjq.'.@sender)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('    §7이제, 참가 또는 퇴장시, 이팩트가 발동됩니다.')
			msg('§f')
		}
    }
));

register_command('setjqmessage', array(
    'description': '나가거나 들어올때의 메세지를 설정합니다. (프리미엄 유저+)',
    'permission': 'player.custom.jqmessage',
    'noPermMsg': '§c ▲ §f권한이 없거나, 명령어가 존재하지 않습니다.',
    'tabcompleter': closure(@alias), 
    'aliases':array('sjqm', '입장메세지'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0){
			msg('§f')
			msg('§c ▲ §f잘못된 명령어입니다.')
			msg('    §7/'.@alias.' <메세지/초기화>') 
            msg('    §7현재 메세지는 §f'._JQIFNULL(colorize(get_value('player.custom.jqmessage.'.@sender))).'§7입니다.')
            msg('    §7최대 §e21§7자 까지 입력이 가능합니다.')
			msg('§f')
		} else {
            if(@args[0] == '초기화' || @args[0] == 'reset'){
                clear_value('player.custom.jqmessage.'.@sender)
                action_msg(@sender, '§a ✔ §f커스텀 메세지가 기본값으로 복원되었습니다.')
            } else {
                if(length(array_implode(@args)) > 21){
                    action_msg(@sender, '§c ▲ §f메세지의 길이가 §e21§f자를 초과했습니다.')
                    die()
                }
                store_value('player.custom.jqmessage.'.@sender, array_implode(@args))
			    msg('§f')
			    msg('§a ✔ §f설정이 완료되었습니다.')
                msg('   '.colorize(get_value('player.custom.jqmessage.'.@sender)).'§7로 메세지가 설정 되었습니다.')
			    msg('§f')
		    }
        }
    }
));

register_command('ignorenotify', array(
    'description': '서버의 알림을 차단합니다.',
    'noPermMsg': '§c ▲ §f권한이 없거나, 명령어가 존재하지 않습니다.',
    'tabcompleter': closure(@alias), 
    'aliases':array('알림', 'in'),
    'executor': closure(@alias, @sender, @args) {
        if(get_value('player.notify.'.@sender) == null){
	        store_value('player.notify.'.@sender, false)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('    §7서버의 알림을 차단했습니다.')
			msg('§f')
		} else {
		    clear_value('player.notify.'.@sender)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('    §7서버의 알림을 이제 받습니다.')
			msg('§f')
		}
    }
));

register_command('personalchatclean', array(
    'description': '개인 채팅을 청소합니다.',
    'usage': '/personalchatclean',
    'tabcompleter': closure(@alias),
    'aliases':array('pcc', '쳇청소', 'ㅊㅅ', 'ㅔㅊㅊ'),
    'executor': closure(@alias, @sender) {
        for(@i = 0, @i < 100, @i++){
            msg('');
        }
        action_msg(@sender, '§a ✔ §f채팅을 청소했습니다.')
    }
));