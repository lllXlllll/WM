

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