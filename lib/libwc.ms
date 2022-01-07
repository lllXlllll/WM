#########################################
#                                       #
#           Library - WildCraft         #
#                                       #
#########################################

proc _RT(@player, @World){
    @X = @Z = rand(-5000, 5000)
    @Y1 = get_highest_block_at(@X, @Z, @World)['y']
    @Y = @Y1 + 1
    @Block = get_block(array(@X, @Y1, @Z, @World))
    @Biome = get_biome(@X, @Z, @World)
    if(@Biome == 'DEEP_OCEAN' || @Biome == 'OCEAN' || @Biome == 'STONE_BEACH'){
        _RT(@player, @World)
    } else if(@Block == 'WATER' || @Block == 'LAVA'){
        _RT(@player, @World)
    } else if(@X <= 211){
        _RT(@player, @World)
    } else {
        set_ploc(@player, array(@X, @Y, @Z, @World))
        play_sound(ploc(@player), array(sound: 'BLOCK_PORTAL_TRAVEL', null, volume: 0.3, null), @player)
        msg(_PM('command.wild.warp', array(@X, @Y, @Z)))
    }
}

proc _XPBUY(@player, @xp){
    @price = multiply(10, @xp)
    if(acc_balance(@player) >= @price) {
        acc_subtract(@player, @price)
        give_pexp(@player, @xp)
        action_msg(@player, _PM('command.xpbuy.bought', array(@price, @xp)))
    } else {
        action_msg(@player, _PM('command.nem'))
    }
}

proc _XPSELL(@player, @xp){
    @price = multiply(0.2, @xp)
    if(ptexp(@player) >= @xp) {
        acc_add(@player, @price)
        @final = ptexp(@player) - @xp
        set_ptexp(@player, @final)
        action_msg(@player, _PM('command.xpsell.sold', array(@xp, @price)))
    } else {
        action_msg(@player, _PM('command.nexp'))
    }
}

proc _R(@player, @price){
    @rand = rand(100)
    if (@rand >= 50) {
        if(acc_balance(@player) > @price){
            acc_subtract(@player, @price)
            action_msg(@player, _PM('command.paid.money', array(@price)))
            sudo('/cmi repair hand' @player)
        } else {
            action_msg(@player, _PM('command.nem'))
        }
    } else {
        action_msg(@player, _PM('command.paid.money', array(@price)))
        msg(_PM('command.repair.failed'))
    }
}

proc _UR(@player, @rank){
    if(array_contains(pgroup(@player), 'vip')){
        action_msg(@player, _PM('command.uprank.puser'))
        die()
    }
    if(@rank == 'Diamond' || @rank == 'diamond' || @rank == 'dia' || @rank == '다이아몬드') {
        @price = 10000000
        if(array_contains(pgroup(@player), 'gold') == false){
            msg(_PM('command.uprank.pdrup'))
            die()
        }
        if(acc_balance(player()) > @price){
            acc_subtract(player(), @price)
            runas('~console', '/lp user '.@player.' parent set Diamond')
            broadcast(_PM('command.uprank.rankup', array(@player, @rank)))
            action_msg(@player, _PM('command.paid.money', array(@price)))
        } else {
            action_msg(@player, _PM('command.nem'))
        }
    } else if(@rank == 'Gold' || @rank == 'gold' || @rank == '금') {
            @price = 85000000
            if(array_contains(pgroup(@player), 'iron') == false){
                msg(_PM('command.uprank.pdrup'))
                die()
            }
            if(acc_balance(player()) > @price){
                acc_subtract(player(), @price)
                runas('~console', '/lp user '.@player.' parent set Gold')
                broadcast(_PM('command.uprank.rankup', array(@player, @rank)))
                action_msg(@player, _PM('command.paid.money', array(@price)))
        } else {
            action_msg(@player, _PM('command.nem'))
        }
    } else if(@rank == 'Iron' || @rank == 'iron' || @rank == '철') {
            @price = 500000
            if(acc_balance(player()) > @price){
                acc_subtract(player(), @price)
                runas('~console', '/lp user '.@player.' parent set Iron')
                broadcast(_PM('command.uprank.rankup', array(@player, @rank)))
                action_msg(@player, _PM('command.paid.money', array(@price)))
        } else {
            action_msg(@player, _PM('command.nem'))
        }
    } else {
        msg(_PM('command.uprank.invaild'))
    }
}

proc _PB(@player, @price, @content){
    @prefix = vault_user_prefix(ploc(@player)['world'], @player)
    if(import('offchat') == 'true'){
        if(!has_permission('player.offchat.bypass')){
            action_msg(@player, _PM('system.chat.na'))
            die()
        }
    }
    if(has_permission(@player, 'player.shout.unlimited')){
        foreach(@p in all_players()){
            play_sound(ploc(@p), array(sound: 'ENTITY_PHANTOM_BITE', null, volume: 0.3, null), @p)
            title(@p, null, _PM('command.shout.title', array(@player)), 0, 0, 64)
            action_msg(@p, _PM('command.shout.actionbar', array(@prefix, display_name(@player), @content)))
        }
        broadcast(_PM('command.shout.broadcast', array(@prefix, display_name(@player), @content)))
    } else if(acc_balance(player()) >= @price){
        acc_subtract(player(), @price)
        foreach(@p in all_players()){
            play_sound(ploc(@p), array(sound: 'ENTITY_PHANTOM_BITE', null, volume: 0.3, null), @p)
            title(@p, null, _PM('command.shout.title', array(@player)), 0, 0, 64)
            action_msg(@p, _PM('command.shout.actionbar', array(@prefix, display_name(@player), @content)))
        }
        broadcast(_PM('command.shout.broadcast', array(@prefix, display_name(@player), @content)))
        msg(_PM('command.paid.money', array(@price)))
    } else {
        action_msg(@player, _PM('command.nem'))
    }
}