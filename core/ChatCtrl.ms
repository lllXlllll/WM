register_command('chatctrl', array(
    'description': '채팅에 관한 명령어입니다.',
    'permission': 'manage.chat.ctrl',
    'noPermMsg': '§c ▲ §f권한이 없거나, 명령어가 존재하지 않습니다.',
    'tabcompleter': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0){
            return(array('끄기', '켜기', '저속', '청소'))
        }
    },
    'aliases':array('cc', 'cctrl', 'ct'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0) {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('    §7사용법: /'.@alias.' <끄기/켜기/저속/청소>')
            msg('    §7상태: §f채팅 끄기 §7≫ §e'._NTOTF(import('offchat')).' §f저속 §7≫ §e'._NTOTF(import('slowchat')))
            msg('§f')
	    } else if(@args[0] == '끄기' || @args[0] == '끄끼' || @args[0] == 'Rmrl' || @args[0] == 'off' || @args[0] == 'ㄲㄱ') {
            export('offchat', 'true')
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('    §7이제, 유저들이 채팅을 칠 수 없습니다.')
			msg('§f')
            foreach(@player in all_players()){
                action_msg(@player, colorize('§c ▲ §f채팅이 비활성화 되었습니다.'))
            }
            broadcast('§c ▲ §f채팅이 비활성화 되었습니다.')
        } else if(@args[0] == '켜기' || @args[0] == '켜끼' || @args[0] == 'on' || @args[0] == 'zuwl' || @args[0] == 'ㅋㄱ') {
            export('offchat', null)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('    §7이제, 유저들이 채팅을 칠 수 있습니다.')
			msg('§f')
            foreach(@player in all_players()){
                action_msg(@player, colorize('§a ✔ §f이제 채팅을 할 수 있습니다.'))
            }
            broadcast('§a ✔ §f이제 채팅을 할 수 있습니다.')
        } else if(@args[0] == '저속' || @args[0] == 'slow' || @args[0] == 'ㅈㅅ' || @args[0] == 'wjthr') {
            if(array_size(@args) == 1){
                msg('§f')
                msg('§c ▲ §f잘못된 명령어입니다.')
                msg('    §7사용법: /'.@alias.' '.@args[0].' <끄기/켜기>')
                msg('§f')
            } else if(@args[1] == '끄기' || @args[1] == '끄끼' || @args[1] == 'Rmrl' || @args[1] == 'off' || @args[1] == 'ㄲㄱ') {
                export('slowchat', 'false')
			    msg('§f')
			    msg('§a ✔ §f설정이 완료되었습니다.')
			    msg('    §7이제, 저속모드가 비활성화 되었습니다.')
			    msg('§f')
                foreach(@player in all_players()){
                    action_msg(@player, colorize('§a ✔ §f채팅의 저속모드가 비활성화 되었습니다.'))
                }
                broadcast('§a ✔ §f채팅의 저속모드가 비활성화 되었습니다.')
            } else if(@args[1] == '켜기' || @args[1] == '켜끼' || @args[1] == 'on' || @args[1] == 'zuwl' || @args[1] == 'ㅋㄱ') {
                export('slowchat', 'true')
			    msg('§f')
			    msg('§a ✔ §f설정이 완료되었습니다.')
			    msg('    §7이제, 채팅이 저속모드입니다.')
			    msg('§f')
                foreach(@player in all_players()){
                    action_msg(@player, colorize('§c ▲ §f채팅의 저속모드가 활성화 되었습니다.'))
                }
                broadcast('§c ▲ §f채팅의 저속모드가 활성화되었습니다.')
            }
        } else if(@args[0] == '청소' || @args[0] == 'cc' || @args[0] == 'ㅊㅅ' || @args[0] == 'clean') {
            try {
                @prefix = vault_user_prefix(ploc(@sender)['world'], @sender)
                for(@i = 0, @i < 100, @i++){
                    broadcast('');
                }
                foreach(@player in all_players()){
                    action_msg(@player, colorize('§a ✔ §6'.@prefix.@sender.'§f님이 채팅을 청소하셨습니다.'))
                }
            } catch(PlayerOfflineException @e) {
                @name = @sender
                for(@i = 0, @i < 100, @i++){
                    broadcast('');
                }
                foreach(@player in all_players()){
                    action_msg(@player, colorize('§a ✔ §6'.@name.'§f님이 채팅을 청소하셨습니다.'))
                }
            }
        }
    }
));
