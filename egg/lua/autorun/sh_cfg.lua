EGG = EGG || {}
EGG.SPAWN = EGG.SPAWN || {}
EGG.OtherCfg = EGG.OtherCfg || {}
EGG.SPAWN['rp_gumrak'] = {
    Vector( 0, 0, 0 ),
    Vector( 0, 0, 0 ),
    Vector( 0, 0, 0 ),
}
EGG.SPAWN['gm_construct'] = {
    Vector( -3019.214355 , -1256.838379 , -28.928856 ),
    Vector( -1835.575195 , -1725.468872 , -335.968750),
}
EGG.WorkShopDL = true
EGG.OtherCfg = {
    OnTouch = function(pp) // player
        pp:ChatPrint('You touched the egg!')
        pp:addMoney(math.random(200,500))
    end,
    TimeToSpawn = 60, // this is in mins
}
