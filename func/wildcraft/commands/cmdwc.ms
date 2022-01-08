#########################################
#                                       #
#          COMMANDS - WildCraft         #
#                                       #
#########################################

register_command('수선', array(
    'description': '들고 있는 아이템을 수리합니다.',
    'usage': '/수선',
    'tabcompleter': closure(@alias),
    'aliases':array('고치기', 'ㅅㅅ'),
    'executor': closure(@alias) {
        _R(player(), 10000)
    }
));

register_command('추천파티', array(
    'description': '추천파티를 위한 추천 횟수를 확인합니다.',
    'usage': '/추천파티',
    'tabcompleter': closure(@alias),
    'aliases':array('cncjsvkxl', 'voteparty', 'vp'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0) {
            msg('§f')
            msg('§b ▶ §f추천파티를 위한 추천 횟수를 확인합니다.')
            msg('    §e'.get_value('vote').' §7/ §e21')
            msg('§f')
	    } else if(has_permission(player(), 'vp.set') == true) {
            store_value('vote', @args[0])
        } else {
            msg('§f')
            msg('§b ▶ §f추천파티를 위한 추천 횟수를 확인합니다.')
            msg('    §e'.get_value('vote').' §7/ §e21')
            msg('§f')
        }
    }
));

register_command('플롯', array(
    'description': '플롯(땅)에 관한 명령어입니다.',
    'tabcompleter': closure(@alias, @sender, @args),
    'aliases':array('플롯', 'Ekd', '땅', 'plot', '마인팜', 'p2', 'plotsquared'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0) {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('   §7사용법: /'.@alias.' <서비스>')
            msg('   §7서비스 §8>> §f자동구매, 정보, 구매, 추가, 신뢰, 집')
            msg('   §7자동구매, 정보를 제외한 나머지 서비스들은 땅 위에 서있어야합니다.')
            msg('§f')
	    } else {
            if(@args[0] == '자동구매' || @args[0] == 'wkehdrnao' || @args[0] == 'auto') {
                run('/2 auto')
            } else if(@args[0] == '구매' || @args[0] == 'rnao' || @args[0] == 'buy') {
                run('/2 claim')
            } else if(@args[0] == '정보' || @args[0] == 'info' || @args[0] == 'wjdqh') {
                run('/2 info')
            } else if(@args[0] == '집' || @args[0] == 'wlq' || @args[0] == 'home') {
                if(array_size(@args) == 1) {
                    run('/2 home')
                } else {
                    run('/2 home' @args[1])
                }
            } else if(@args[0] == '집설정' || @args[0] == 'sethome' || @args[0] == 'wlqtjfwjd') {
                run('/2 sethome')
            } else if(@args[0] == '추가' || @args[0] == 'cnrk' || @args[0] == 'add') {
                if(array_size(@args) == 1) {
                    msg('§f')
                    msg('§c ▲ §f잘못된 명령어입니다.')
                    msg('   §7사용법: /'.@alias.' '.@args[0].' <플레이어>')
                    msg('§f')
            } else {
                run('/2 add' @args[1])}
            } else if(@args[0] == '신뢰' || @args[0] == 'tlsfhl' || @args[0] == 'trust') {
                if(array_size(@args) == 1) {
                    msg('§f')
                    msg('§c ▲ §f잘못된 명령어입니다.')
                    msg('   §7사용법: /'.@alias.' '.@args[0].' <플레이어>')
                    msg('§f')
            } else {
                run('/2 trust' @args[1])}
            }
        }
    }
));

register_command('killcounter', array(
    'description': 'killcounter',
    'tabcompleter': closure(@alias),
    'aliases':array('킬카', 'kc'),
    'executor': closure(@alias, @sender) {
        msg('§b ▶ §f지금까지 §e'._KCIFNULL(get_value('player.killcount.'.@sender)).'§f번 플레이어를 사살했습니다.')
    }
));

register_command('deathcounter', array(
    'description': '내가 죽은 횟수를 봅니다.',
    'tabcompleter': closure(@alias),
    'aliases':array('dc', '데카'),
    'executor': closure(@alias, @sender) {
        msg('§b ▶ §f지금까지 §e'._KCIFNULL(get_value('player.deathcount.'.@sender)).'§f번 사망했습니다.')
    }
));

register_command('개인시간', array(
    'description': '자신만의 시간을 설정합니다.',
    'tabcompleter': closure(@alias),
    'aliases':array('낮', '밤', 'ㄱㅇㅅㄱ', '시간', '개시', 'rodlstlrks', 'ㅅㄱ', 'tlrks', 'time'),
    'executor': closure(@alias, @sender, @args) {
        @amount = 130000
        if(array_size(@args) == 0) {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('   §7사용법: /개인시간 <낮/밤/끄기>')
            msg('    §e1§7회당 낮/밤 전환시, §e330,000§7원이 소모됩니다.')
            msg('    §cMVP§7등급 이상부터는 무료입니다.')
            msg('§f')
	    } else {
            if(@args[0] == '끄기' || @args[0] == 'off' || @args[0] == 'ㄲㄱ' || @args[0] == 'Rmrl'){
                preset_time(@sender)
                action_msg(@sender, '§a ✔ §f개인시간 기능이 꺼졌습니다.')
            } else if(@args[0] == '낮' || @args[0] == 'day' || @args[0] == 'ㄴ' || @args[0] == 'skw'){
                if(has_permission(@sender, 'user.owntime') == true){
                    set_ptime(@sender, 'day')
                    action_msg(@sender, '§a ✔ §f낮으로 개인시간이 변경되었습니다.')
                } else if(acc_balance(@sender) > @amount){
                    acc_subtract(@sender, @amount)
                    action_msg(@sender, '§c  - §e'.@amount.'§f원을 냈습니다.')
                    set_ptime(@sender, 'day')
                } else {
                    action_msg(@sender, '§c ▲ §f돈이 부족합니다.')
                }
            } else if(@args[0] == '밤' || @args[0] == 'night' || @args[0] == 'ㅂ' || @args[0] == 'qka'){
                if(has_permission(@sender, 'user.owntime') == true){
                    set_ptime(@sender, 'midnight')
                    action_msg(@sender, '§a ✔ §f밤으로 개인시간이 변경되었습니다.')
                } else if(acc_balance(@sender) > @amount){
                    acc_subtract(@sender, @amount)
                    action_msg(@sender, '§c  - §e'.@amount.'§f원을 냈습니다.')
                    set_ptime(@sender, 'midnight')
                } else {
                    action_msg(@sender, '§c ▲ §f돈이 부족합니다.')
                }
            } else {
                msg('§f')
                msg('§c ▲ §f잘못된 명령어입니다.')
                msg('   §7사용법: /개인시간 <낮/밤/끄기>')
                msg('    §e1§7회당 낮/밤 전환시, §e330,000§7원이 소모됩니다.')
                msg('    §cMVP§7등급 이상부터는 무료입니다.')
                msg('§f')
            }
        }
    }
));

register_command('quickmenu', array(
    'description': '퀵 메뉴의 사용여부를 결정합니다.',
    'aliases':array('qm', '쉬프트Q', 'sq'),
    'executor': closure(@alias, @sender, @args) {
        if(get_value('player.quickmenu.'.@sender) == null){
	        store_value('player.quickmenu.'.@sender, false)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('   §7퀵 메뉴기능, Shift + Q가 꺼졌습니다.')
			msg('§f')
		} else {
		    clear_value('player.quickmenu.'.@sender)
			msg('§f')
			msg('§a ✔ §f설정이 완료되었습니다.')
			msg('   §7퀵 메뉴기능, Shift + Q가 다시 작동합니다.')
			msg('§f')
		}
    }
));

register_command('nightvision', array(
    'description': '야간투시를 구매합니다.',
    'tabcompleter': closure(@alias),
    'aliases':array('야투', 'nv', '야간투시', 'ㅇㄱㅌㅅ', 'ㅇㅌ'),
    'executor': closure(@alias, @sender) {
        @amount = 9000
        if(acc_balance(@sender) >= @amount){
            acc_subtract(@sender, @amount)
            set_peffect(@sender, 'NIGHT_VISION', 11, 600)
            action_msg(@sender, '§c  - §e'.@amount.'§f원을 냈습니다.')
        } else {
            action_msg(@sender, '§c ▲ §f돈이 부족합니다.')
        }
    }
));

register_command('이체', array(
    'description': '돈을 보냅니다.',
    'usage': '/이체',
    'tabcompleter': closure(@alias),
    'aliases':array('지불', 'ㅇㅊ', '페이'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0 || array_size(@args) == 1) {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('   §7사용법: /'.@alias.' <플레이어> <금액>')
            msg('§f')
	    } else {
            run('/cmi pay '.array_implode(@args))
        }      
    }
));

register_command('uprank', array(
    'description': '등급을 올립니다.',
    'tabcompleter': closure(@alias),
    'aliases':array('ㅕㅔㄱ무ㅏ', '등업', '등급', 'ㄷㅇ', '승급', '권한'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0) {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('   §7사용법: /'.@alias.' <등급>')
            msg('   §7다이아몬드 = §e10,000,000§7원, 금 = §e8,500,000§7원, 철 = §e500,000§7원')
            msg('§f')
	    } else {
            _UR(@sender, @args[0])
        }
    }
));

register_command('shout', array(
    'description': '확성기를 내보냅니다.',
    'tabcompleter': closure(@alias),
    'aliases':array('확성기', 'ㅎㅅㄱ', '놰ㅕㅅ', 'ghkrtjdrl'),
    'executor': closure(@alias, @sender, @args) {
        @price = 20000
        if(array_size(@args) == 0 ) {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('   §7사용법: /'.@alias.' <내용>')
            msg('   §7요금: §e'.@price.'§7원')
            msg('§f')
        } else {
            if(has_permission(@sender, 'player.cooltime.bypass') || has_permission(@sender, 'player.shout.cooltime.bypass')){
                _PB(@sender, @price, array_implode(@args))
            } else {
                _cooldown(@sender, 'player.broadcast.'.@sender, 10)
                _PB(@sender, @price, array_implode(@args))
            }
        }
    }
));

register_command('로그', array(
    'description': '로그를 조사합니다.',
    'usage': '/로그',
    'tabcompleter': closure(@alias),
    'aliases':array('로그조사', 'ㄺㅈㅅ', 'log'),
    'executor': closure(@alias) {
        run('/co i')
    }
));

#register_command('야생', array(
#    'description': '야생으로 이동합니다.',
#    'tabcompleter': closure(@alias),
#    'aliases':array('wild', 'ㅇ', 'ditod', 'ㅇㅅ'),
#    'executor': closure(@alias, @sender, @args) {
#        _cooldown(@sender, 'teleport.wild.'.@sender, 10)
#        sudo('/cmi rt '.@sender.' wwild')
#        #_RT(@sender, 'wwild')
#    }
#));

register_command('가방', array(
    'description': '가방에 관한 명령어입니다.',
    'usage': '/가방',
    'tabcompleter': closure(@alias),
    'aliases':array('ㄱㅂ', '엔더상자'),
    'executor': closure(@alias) {
        run('/backpack')
    }
));

register_command('난이도', array(
    'description': '월드의 난이도를 알아봅니다.',
    'tabcompleter': closure(@alias),
    'aliases':array('ㄴㅇㄷ', 'sksdleh'),
    'executor': closure(@alias, @sender) {
        msg('§b ▶ §f이 월드의 난이도는 §e'.get_difficulty(ploc(@sender)['world']).'§f입니다.')
    }
));

register_command('펫', array(
    'description': '펫에 관한 명령어입니다.',
    'tabcompleter': closure(@alias, @sender, @args),
    'aliases':array('ㅍ', 'vpt', 'pet'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0) {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('   §7사용법: /'.@alias.' <서비스>')
            msg('   §7도움말, 방생, 정보, 스킬, 재소환, 보내기, 이름, 정지')
            msg('   §7상점, 소환, 저장, 교체')
            msg('§f')
	    } else {
            if(@args[0] == '방생') {
                run('/petrelease')
            } else if(@args[0] == '스킬') {
                if(array_size(@args) == 1) {
                    msg('§f')
                    msg('§c ▲ §f잘못된 명령어입니다.')
                    msg('   §7사용법: /'.@alias.' '.@args[0].' <선택/인벤토리/신호기/타기/행동>')
                    msg('§f')
                } else if(@args[1] == '선택') {
                    run('/pcst')
                } else if(@args[1] == '인벤토리') {
                    run('/petinventory')
                } else if(@args[1] == '신호기') {
                    run('/petbeacon')
                } else if(@args[1] == '타기') {
                    run('/petpickup')
                } else if(@args[1] == '행동') {
                    if(array_size(@args) == 2) {
                        msg('§f')
                        msg('§c ▲ §f잘못된 명령어입니다.')
                        msg('   §7사용법: /'.@alias.' '.@args[0].' '.@args[1].' <행동>')
                        msg('   §7행동 &8>> &ffriendly, normal, aggressive, farm, raid, duel')
                        msg('§f')
                    } else {
                        run('/petbehavior' @args[2])
                    }
                } else {
                    msg('§f')
                    msg('§c ▲ §f잘못된 명령어입니다.')
                    msg('   §7사용법: /'.@alias.' '.@args[0].' <선택/인벤토리/신호기/타기/행동>')
                    msg('§f')
                }
            } else if(@args[0] == '정보') {
                run('/petinfo')
            } else if(@args[0] == '재소환') {
                if(array_size(@args) == 1) {
                    run('/petrespawn')
                } else {
                    run('/petrespawn' @args[1])
                }
            } else if(@args[0] == '교체') {
                run('/pswitch')
            } else if(@args[0] == '저장') {
                run('/petstore')
            } else if(@args[0] == '보내기') {
                run('/petsendaway')
            } else if(@args[0] == '이름') {
                if(array_size(@args) == 1) {
                    msg('§f')
                    msg('§c ▲ §f잘못된 명령어입니다.')
                    msg('   §7사용법: /'.@alias.' '.@args[0].' <이름>')
                    msg('§f')
                } else {
                    array_remove(@args, 0)
                    run('/petname' array_implode(@args))
                }
            } else if(@args[0] == '정지') {
                run('/petstop')
            } else if(@args[0] == '옵션') {
                if(array_size(@args) == 1 || array_size(@args) == 2) {
                    msg('§f')
                    msg('§c ▲ §f잘못된 명령어입니다.')
                    msg('   §7사용법: /'.@alias.' '.@args[0].' <옵션> <파라미터>')
                    msg('   §7healthbar(파라미터: on/off), idle-volume(파라미터: (퍼센트))')
                    msg('   §7healthbar = 체력 바를 항상 켭니다. / idle-volume = 펫이 내는 소리를 조절합니다.')
                    msg('§f')
                } else {
                    run('/petoptions' @args[1] @args[2])
                }
            } else if(@args[0] == '인벤토리') {
                run('/petinventory')
            } else if(@args[0] == '소환') {
                run('/petcall')
            } else if(@args[0] == '신호기') {
                run('/petbeacon')
            } else if(@args[0] == '상점') {
                run('/petshop')
            } else if(@args[0] == '도움말') {
                if(array_size(@args) == 1) {
                    msg('§f')
                    msg('§b ▶ §f도움이 필요하신가요?')
                    msg('   §7위키§e(https://wiki.apexsv.tk/wildcraft/pets§e)§7로 이동 하시거나')
                    msg('    §e/'.@alias.' '.@args[0].' 도우미 §7명령어로 도움을 받을 수 있습니다.')
                    msg('§f')
                } else if(@args[1] == '도우미') {
                    run('/petcapturehelper')
                } else {
                    msg('§f')
                    msg('§b ▶ §f도움이 필요하신가요?')
                    msg('   §7위키(https://wiki.apexsv.tk/wildcraft/pets§e)로 이동 하시거나')
                    msg('   §7/'.@alias.' '.@args[0].' 도우미 명령어로 도움을 받을 수 있습니다.')
                    msg('§f')
                }
            } else {
                msg('§f')
                msg('§c ▲ §f잘못된 명령어입니다.')
                msg('   §7사용법: /'.@alias.' <서비스>')
                msg('   §7도움말, 방생, 정보, 스킬, 재소환, 보내기, 이름, 정지')
                msg('   §7상점, 소환, 저장, 교체')
                msg('§f')
            }
        }
    }
));

register_command('이펙트', array(
    'description': '이펙트를 실행합니다.',
    'usage': '/이펙트',
    'tabcompleter': closure(@alias),
    'aliases':array('particle', 'ㅇㅍ'),
    'executor': closure(@alias) {
        run('/trails')
    }
));

register_command('변신', array(
    'description': '몹으로 변신합니다.',
    'tabcompleter': closure(@alias),
    'aliases':array('ㅄ', 'ㅂㅅ', 'qt', 'qustls', '병신', 'qudtls'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0) {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('   §7사용법: /'.@alias.' <몹의 영문 이름/플레이어 <플레이어의 이름>/끄기>')
            msg('§f')
        } else if(@args[0] == '끄기' || @args[0] == 'off' || @args[0] == 'ㄲㄱ') {
            run('/undis')
        } else if(@args[0] == '플레이어' || @args[0] == '사람' || @args[0] == 'player'|| @args[0] == 'PLAYER' || @args[0] == 'ㅅㄹ') {
            if(array_size(@args) == 1) {
                msg('§f')
                msg('§c ▲ §f잘못된 명령어입니다.')
                msg('   §7사용법: /'.@alias.' '.@args[0].' <플레이어의 이름>')
                msg('§f')
            } else {
                run('/dis player' @args[1])
            }
        } else {
            run('/dis' @args[0])
        }
    }
));

register_command('개인상점', array(
    'description': '개인상점에 관한 명령어입니다.',
    'tabcompleter': closure(@alias),
    'aliases':array('ㄱㅇ', '개상', 'rodlstkdwja'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0) {
            msg('§f')
            msg('§b ▶ §f개인 상점에관한 도움말을 봅니다.')
            msg('   §7사용법: /'.@alias.' <개설/이용/설정>')
            msg('§f')
        } else {
            if(@args[0] == '개설') {
                msg('§f')
                msg('§b ▶ §7|| §f개인상점 개설 §7||')
                msg('§f')
                msg('  §61. §f물건을 팔 상자를 설치합니다.')
                msg('  §62. §f팔 물건으로 상자를 왼클릭합니다.')
                msg('  §63. §f물건의 가격을 채팅창에 입력합니다.')
                msg('  §64. §f팔 물건을 상자에 넣어주세요.')
                msg('  §6* §f개설하실때 개설할때 쓴 물건만 넣어주세요.')
                msg('  §6* §f즉, 상자에 다른아이템은 판매되지 않습니다.')
                msg('  §6* §f개인상점의 종류는 구입/판매 입니다. 기본= 판매')
                msg('  §6* §f상자를 본 상태에서 /개인상점 설정 <구입/판매>로 전환이 가능합니다.')
                msg('§f')
            } else if(@args[0] == '이용') {
                msg('§f')
                msg('§b ▶ §7|| §f개인상점 이용 §7||')
                msg('§f')
                msg('  §61. §f개인상점의 상자를 왼클릭합니다')
                msg('  §62. §f채팅창에 구매/ 판매 수량을 적습니다.')
                msg('  §6* §f왼클릭하시면, 메세지가 뜹니다.')
                msg('  §6* §f재고가 없을경우, 구매가 불가합니다.')
                msg('§f')
            } else if(@args[0] == '설정') {
                if(array_size(@args) == 1) {
                    msg('§f')
                    msg('§c ▲ §f잘못된 명령어입니다.')
                    msg('   §7사용법: /'.@alias.' '.@args[0].' <구매/판매>')
                    msg('   §7개인상점의 용도를 설정합니다.')
                    msg('§f')
                } else if(@args[1] == '판매') {
                    run('/qs sell')
                } else if(@args[1] == '구매') {
                    run('/qs buy')
                }
            }
        }
    }
));

register_command('소유지', array(
    'description': '소유지에 관한 명령어입니다.',
    'tabcompleter': closure(@alias, @sender, @args),
    'aliases':array('c', 'ㅂㄷㅅ', 'qnehdtks', '부동산', 'thdbwl', '땅'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0) {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('   §7사용법: /'.@alias.' <서비스>')
            msg('   §7서비스 §8>> §f도움말/매각/블럭구매/블럭판매/신뢰§7/모두매각')
            msg('§f')
        } else if(@args[0] == '도움말' || @args[0] == 'ㄷㅇㅁ' || @args[0] == 'ehdnaakf' || @args[0] == 'help' || @args[0] == '도움' || @args[0] == 'ehdna') {
            msg('§f')
            msg('§b ▶ §7|| §f소유지 지정 §7||')
            msg('§f')
            msg('  §6 1. §e§o/부동산 블럭구매 §f명령어로 블럭을 구매합니다. §e§o블럭 = 보호할 땅의 크기')
            msg('  §6 2. §e§o금 삽§f으로 1번 지점과 2번 지점을 선택합니다. §8>> §e끝!')
            msg('  §6 * §e§o금 삽은 직접 재조해서 사용하셔도 됩니다.')
            msg('  §6 * §f부동산 기능은 야생에서만 가능합니다.')
            msg('§f')
        } else if(@args[0] == '신뢰' || @args[0] == 'ㅅㄹ' || @args[0] == 'tlsfhl' || @args[0] == 'trust') {
            if(array_size(@args) == 1 || array_size(@args) == 2) {
                msg('§f')
                msg('§c ▲ §f잘못된 명령어입니다.')
                msg('   §7사용법: /'.@alias.' '.@args[0].' <서비스> <플레이어>')
                msg('   §7서비스 §8>> §f전체, 컨테이너(상자), 제거, 권한, 접근')
                msg('§f')
            } else if(@args[1] == '전체' || @args[1] == 'all' || @args[1] == 'ㅈㅊ' || @args[0] == 'wjscp' || @args[0] == 'wc') {
                run('/trust' @args[2])
            } else if(@args[1] == '제거' || @args[0] == 'remove' || @args[0] == 'wprj' || @args[0] == 'ㅈㄱ' || @args[0] == 'wr') {
                run('/unTrust' @args[2])
            } else if(@args[1] == '컨테이너' || @args[0] == '상자' || @args[0] == '컨테이너(상자)' || @args[0] == 'tkdwk' || @args[0] == 'zjsxpdlsj') {
                run('/ContainerTrust' @args[2])
            } else if(@args[1] == '권한' || @args[0] == 'ㄱㅎ' || @args[0] == 'rnjsgks' || @args[0] == 'rg') {
                run('/PermissonTrust' @args[2])
            } else if(@args[1] == '접근' || @args[0] == 'ㅈㄱ' || @args[0] == 'wjarmq' || @args[0] == 'wr') {
                run('/AccessTrust' @args[2])
            }
        } else if(@args[0] == '매각'|| @args[0] == '혜지'|| @args[0] == '혜제' || @args[0] == '없에기' || @args[0] == '팔기' || @args[0] == 'ㅁㄱ') {
            run('/abandonclaim')
        } else if(@args[0] == '블럭구매' || @args[0] == 'ㅂㄹㄱㅁ' || @args[0] == 'ㅂㄺㅁ' || @args[0] == '구매' || @args[0] == 'rnao' || @args[0] == 'qmffjrrnao') {
            if(array_size(@args) == 1) {
                msg('§f')
                msg('§c ▲ §f잘못된 명령어입니다.')
                msg('   §7사용법: /'.@alias.' '.@args[0].' <수량>')
                msg('§f')
            } else {
                run('/buyclaimblocks' @args[1])
            }
        } else if(@args[0] == '블럭판매' || @args[0] == 'ㅂㄹㅍㅁ' || @args[0] == '판매' || @args[0] == 'qmffjrvksao' || @args[0] == 'vksao') {
            if(array_size(@args) == 1) {
                msg('§f')
                msg('§c ▲ §f잘못된 명령어입니다.')
                msg('   §7사용법: /'.@alias.' '.@args[0].' <수량>')
                msg('§f')
            } else {
                run('/sellclaimblocks' @args[1])
            }
        } else if(@args[0] == '모두매각' || @args[0] == 'ㅁㄷㅁㄱ' || @args[0] == 'ahenaorkr' || @args[0] == 'aear') {
            run('/abandonallclaims')
        } else {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('   §7사용법: /'.@alias.' <서비스>')
            msg('   §7서비스 §8>> §f도움말/매각/블럭구매/신뢰§7/모두매각')
            msg('§f')
        }
    }
));

register_command('xp', array(
    'description': '경험치를 판매하거나, 구매합니다.',
    'tabcompleter': closure(@alias),
    'aliases':array('levels', 'exp', 'level', 'rudgjacl', 'ㄱㅎㅊ', '경험치'),
    'executor': closure(@alias, @sender, @args) {
        if(array_size(@args) == 0) {
            msg(_PM('command.wu.ol', array(@alias '<구매/판매> <경험치>', '§e'.ptexp().'§7만큼의 경험치를 현재 소유중 입니다.\n   §e1 §7XP당 §e100§7원 입니다.')))
        } else if(@args[0] == '구매' || @args[0] == 'ㄱㅁ' || @args[0] == 'rnao' || @args[0] == 'buy'){
            if(array_size(@args) == 1) {
                msg(_PM('command.wu', array(@alias @args[0] '<레벨>')))
            } else {
                _XPBUY(@sender, @args[1])
            }
        } else if(@args[0] == '판매' || @args[0] == 'ㅍㅁ' || @args[0] == 'sell' || @args[0] == 'vksao'){
            if(array_size(@args) == 1) {
                msg(_PM('command.wu', array(@alias @args[0] '<레벨>')))
            } else {
                _XPSELL(@sender, @args[1])
            }
        } else {
            msg('§f')
            msg('§c ▲ §f잘못된 명령어입니다.')
            msg('   §7사용법: /'.@alias.' <구매/판매> <레벨>')
            msg('  §e'.pexp().'§7만큼의 경험치를 현재 소유중 입니다.')
            msg('   §71 XP당 §e100§7원 입니다.')
            msg('§f')
        }
    }
));

register_command('쓰레기통', array(
    'description': '쓰레기통',
    'usage': '/쓰레기통',
    'tabcompleter': closure(@alias, @sender, @args),
    'aliases':array('쓰레기', 'ㅆㄺ', 'trash', 't', '보레기통', 'Tmfprl', 'Tmfprlxhd'),
    'executor': closure(@alias, @sender, @args) {
        if(array_contains(get_virtual_inventories(), 'trash.'.@sender) == false) {
            create_virtual_inventory('trash.'.@sender, 54, colorize('&4&l&n&o쓰레기통'))
            popen_inventory('trash.'.@sender)
        } else {
            delete_virtual_inventory('trash.'.@sender)
            create_virtual_inventory('trash.'.@sender, 54, colorize('&4&l&n&o쓰레기통'))
            popen_inventory('trash.'.@sender)
        }
    }
));