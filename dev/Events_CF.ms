#bind('player_command', null, null, @e,
    #@ACL = array('/spawn', '/warp', '/home', '/bs', '/ah')
    #if(!pisop(@e['player'])){
        #if(array_contains(@ACL, @e['prefix']) == false){
            #cancel();
        #}
    #}
#)