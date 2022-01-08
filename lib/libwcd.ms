#########################################
#                                       #
#             Library - Dev             #
#                                       #
#########################################

proc _TM(@player, @amount){
    if(acc_balance(player()) > @amount){
        acc_subtract(player(), @amount)
        action_msg(@player, _PM('command.paid.money', array(@amount)))
    } else {
        #msg('§c ▲ §f돈이 부족합니다.')
        action_msg(@player, _PM('command.nem'))
        runas('~console', '/lightning' @player)
    }
}

proc _NTOTF(@var1){
    if(@var1 == 'null' || @var1 == null || @var1 == 'false'){
        return('§c꺼짐')
    } else {
        if(@var1 == 'true'){
            return('§a켜짐')
        }
    }
}

proc _REPNULL(@var1, @replacement){
    if(@var1 == null){
        return(@replacement)
    } else {
        return(@var1)
    }
}

proc _KCIFNULL(@var1){
    if(@var1 == null){
        return('§7(정보 없음)')
    } else {
        return(@var1)
    }
}

proc _SBGPO(@var1){
    if(@var1 == 'Unclaimed'){
        return('§7(없음)')
    } else {
        return(@var1)
    }
}