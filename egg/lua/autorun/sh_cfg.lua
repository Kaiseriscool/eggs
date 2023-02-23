EGG = EGG || {}
EGG.SPAWN = EGG.SPAWN || {}
EGG.Rewards = EGG.Rewards || {}
EGG.OtherCfg = EGG.OtherCfg || {}
EGG.WorkShopDL = true
EGG.SPAWN['rp_gumrak'] = {
    Vector( 0, 0, 0 ),
    Vector( 0, 0, 0 ),
    Vector( 0, 0, 0 ),
}
EGG.SPAWN['gm_construct'] = {
    Vector( -3019.214355 , -1256.838379 , -28.928856 ),
    Vector( -1835.575195 , -1725.468872 , -335.968750),
}


EGG.OtherCfg = {
    OnTouch = function(pp) // player
        pp:ChatPrint('You touched the egg!')
        local reward = nil
        if allDisabled then error("None of the rewards are enabled! Please enable at least one reward!") return end
        while not reward or not reward.Enabled do
            reward = table.Random(EGG.Rewards)
        end
        --print(reward)
        --pp:ChatPrint("You got the reward")
        reward.Function(pp)
    end,
    TimeToSpawn = 60, // this is in mins
}



 -- END OF CONFIG --

hook.Add("Think" , "Real:EGG" , function()
    hook.Remove("Think" , "Real:EGG")
    local allDisabled = true
    for k, reward in pairs(EGG.Rewards) do
    --print(k , reward)
    if reward.Enabled then
        allDisabled = false
        break
    end
end

if allDisabled then
    error("None of the rewards are enabled! Please enable at least one reward!")
end
end)




function EGG:GetSpawns()
    return EGG.SPAWN[game.GetMap()]
end
