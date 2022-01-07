#########################################
#                                       #
#              CMD - Manage             #
#                                       #
#########################################

register_command('manage', array(
    'description': '관리자의 유저 설정값 관리 명령어입니다.',
    'aliases':array('관리'),
    'executor': closure(@alias, @sender, @args) {
        @cmd1 = array('테스트', '미친', '빌드')
        @cmd2 = array('테스트', '미친', '빌드')
        if(array_size(@args) == 0) {
            msg('§f')
            msg('§c  !  §f잘못된 명령어입니다.')
            msg('    §7사용법: /manage <기능> <값>')
            msg('    §7'.array_implode(@cmd1))
            msg('    §7'.array_implode(@cmd2))
            msg('§f')
	    } else {
            if(@args[0] == '끄기' || @args[0] == 'off' || @args[0] == 'ㄲㄱ' || @args[0] == 'Rmrl'){
                preset_time(@sender)
                action_msg(@sender, '§a  !  §f개인시간 기능이 꺼졌습니다.')
            } else if(@args[0] == '낮' || @args[0] == 'day' || @args[0] == 'ㄴ' || @args[0] == 'skw'){
                if(has_permission(@sender, 'user.owntime') == true){
                    set_ptime(@sender, 'day')
                    action_msg(@sender, '§a  !  §f낮으로 개인시간이 변경되었습니다.')
                } else if(acc_balance(@sender) > @amount){
                    acc_subtract(@sender, @amount)
                    action_msg(@sender, '§c  - §e'.@amount.'§f원을 냈습니다.')
                    set_ptime(@sender, 'day')
                } else {
                    action_msg(@sender, '§c  !  §f돈이 부족합니다.')
                }
            } else if(@args[0] == '밤' || @args[0] == 'night' || @args[0] == 'ㅂ' || @args[0] == 'qka'){
                if(has_permission(@sender, 'user.owntime') == true){
                    set_ptime(@sender, 'midnight')
                    action_msg(@sender, '§a  !  §f밤으로 개인시간이 변경되었습니다.')
                } else if(acc_balance(@sender) > @amount){
                    acc_subtract(@sender, @amount)
                    action_msg(@sender, '§c  - §e'.@amount.'§f원을 냈습니다.')
                    set_ptime(@sender, 'midnight')
                } else {
                    action_msg(@sender, '§c  !  §f돈이 부족합니다.')
                }
            } else {
                msg('§f')
                msg('§c  !  §f잘못된 명령어입니다.')
                msg('    §7사용법: /개인시간 <낮/밤/끄기>')
                msg('    §e1§7회당 낮/밤 전환시, §e330,000§7원이 소모됩니다.')
                msg('    §cMVP§7등급 이상부터는 무료입니다.')
                msg('§f')
            }
        }
    }
));