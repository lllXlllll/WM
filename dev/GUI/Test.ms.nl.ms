register_command('tg', array(
    'executor': closure(@alias, @sender) {
        popen_inventory(@sender, 'test')
    }
));

bind('inventory_click', null, array('virtual': true), @e) {
    @id = pinventory_holder();
    if (@id != 'test') {
        die();
    }
    cancel();
    @clickedSlot = @e['rawslot']
    switch (@clickedSlot) {
        case 12:
            pkill();
            action_msg(player(), '§6 ▶ §Fucked up!');
            break();
        case 14:
            close_pinv();
            msg('§6 ▶ §GUI 를 종료했습니다.');
            break();
    }
}

@id = 'test'
delete_virtual_inventory(@id) //Renew
@items = array(
	12: array(
		type: 1,
		data: 0,
		qty: 1,
		meta: array(
			'display': '스폰으로 이동',
			'lore': array(
				'클릭 시', 
				'스폰으로 이동'
			)
		)
	),
	14: array(
		type: 3,
		data: 0,
		qty: 1,
		meta: array(
			'display': 'GUI 종료',
			'lore': array(
				'클릭 시',
				'GUI 종료'
			)
		)
	)
)

create_virtual_inventory(@id, 27, '§kTest GUI', @items)