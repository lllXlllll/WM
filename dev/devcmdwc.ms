#########################################
#                                       #
#             DEV - WildCraft           #
#                                       #
#########################################

register_command('ploc', array(
    'permission': 'manage.devfunction.use',
    'noPermMsg': '§c ▲ §f권한이 없거나, 명령어가 존재하지 않습니다.',
    'executor': closure(@alias, @sender, @args) {
        msg('§6 ▶ §f'.ploc(@sender))
    }
));

register_command('채팅', array(
    'description': '채팅에 관해 설정합니다. (개인)',
    'tabcompleter': closure(@alias),
    'aliases':array('coxld', 'chat', 'ㅊㅌ'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0) {
            msg('§f');
            msg('§c ▲ §f잘못된 명령어입니다.');
            msg('   §7사용법: /'.@alias.' <스팸/끄기/켜기/청소>');
            msg('   §7채팅 끄기는 채팅이 보이지 않습니다.');
            msg('   §7스팸 처리하시면, 해당 플레이어의 채팅내용은 보이지 않습니다.');
            msg('§f');
        } else {
            if(@args[0] == '스팸' || @args[0] == 'ㅅㅍ' || @args[0] == 'spam'){
                if(array_size(@args) == 1){
                    msg('§f');
                    msg('§c ▲ §f잘못된 명령어입니다.');
                    msg('   §7사용법: /'.@alias.' '.@args[0].' <제거/추가/모두제거> <플레이어>');
                    msg('   §7스팸 처리된 플레이어: §6'.array_implode(get_values('chat.user.spam.'.@sender)));
                    msg('§f');
                } else if(@args[1] == '추가' || @args[1] == 'ㅊㄱ' || @args[1] == 'add') {
                    if(array_size(@args) == 2){
                        msg('§f');
                        msg('§c ▲ §f잘못된 명령어입니다.');
                        msg('   §7사용법: /'.@alias.' '.@args[0].' <플레이어>');
                        msg('   §7스팸 처리된 플레이어: §6'.array_implode(get_values('chat.user.spam.'.@sender)));
                        msg('§f');
                    } else {
                        store_value('chat.user.spam.'.@sender, @args[2])
                    }
                } else if(@args[1] == '모두제거' || @args[1] == 'removeall' || @args[1] == 'ㅁㅊㅈㄱ'){
                    clear_value('chat.user.spam.'.@sender)
                } else if(@args[1] == '제거' || @args[1] == 'ㅈㄱ' || @args[1] == 'remove'){
                    if(array_size(@args) == 2){
                        msg('§f');
                        msg('§c ▲ §f잘못된 명령어입니다.');
                        msg('   §7사용법: /'.@alias.' '.@args[0].' <플레이어>');
                        msg('   §7스팸 처리된 플레이어: §6'.array_implode(get_values('chat.user.spam.'.@sender)));
                        msg('§f');
                    } else {

                        


                    }
                } else {
                    msg('§f');
                    msg('§c ▲ §f잘못된 명령어입니다.');
                    msg('   §7사용법: /'.@alias.' '.@args[0].' <제거/추가/모두제거> <플레이어>');
                    msg('   §7스팸 처리된 플레이어: §6'.array_implode(get_values('chat.user.spam.'.@sender)));
                    msg('§f');  
                }
            } else if(@args[0] == '끄기' || @args[0] == 'Rmrl' || @args[0] == 'ㄲㄱ'){
                export('chat.user.hide.'.@sender, true)
                action_msg(@sender, '§a ✔ §f채팅이 이제 보이지 않습니다.')
            } else if(@args[0] == '켜기' || @args[0] == 'zurl' || @args[0] == 'ㅋㄱ'){
                export('chat.user.hide.'.@sender, null)
                action_msg(@sender, '§a ✔ §f채팅이 이제 보입니다.')
            } else if(@args[0] == '청소' || @args[0] == 'ㅊㅅ' || @args[0] == 'clean'){
                for(@i = 0, @i < 200, @i++){
                    msg('');
                }
                action_msg(@sender, '§a ✔ §f채팅을 청소했습니다.')
            }
        }
    }
));