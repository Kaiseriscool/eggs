timer.Create('EGG:RANDOM:sPAWN'  , ((EGG.OtherCfg.TimeToSpawn or 60) * 60) , 0 , function() // once per hour
    EGG:Spawn()
end)
if EGG.WorkShopDL then
    resource.AddWorkshop(2059033945)
end
util.AddNetworkString('Egg:Spawned')
function EGG:Spawn()
    local pos = EGG.SPAWN[game.GetMap()]
    if pos == nil then
        error("Map: "..game.GetMap().." not found in EGG.SPAWN \n This map has not got any config for the pos to spawn egg")
    end
    local real_pos = pos[math.random(#pos)]
    local ee = ents.Create( "egg" )
    --print(ee)
    ee:SetPos( real_pos )
    ee:Spawn()
    ee:SetSkin(math.random(0,3))
    for _ , 🤓 in pairs(player.GetAll()) do
        net.Start('Egg:Spawned')
        net.Send(🤓)
    end
end