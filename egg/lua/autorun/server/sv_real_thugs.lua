
util.AddNetworkString("EGG_AddSpawn")
local mapName = game.GetMap()
file.CreateDir("eggs_data")
function EGG.SaveSpawnData()
    local data = util.TableToJSON(EGG.SPAWN)
    file.Write("eggs_data/spawns.json", data)
    EGG.LoadSpawnData()
end
function EGG.LoadSpawnData()
    local data = file.Read("eggs_data/spawns.json", "DATA")
    if data then
        EGG.SPAWN = util.JSONToTable(data)
    end
end
net.Receive("EGG_AddSpawn", function(_, ply)
    local _cd = CurTime()
    if _cd > CurTime() then return end
    _cd = CurTime() + 2
    local pos = net.ReadVector()
    if not ply:IsSuperAdmin() then return end
    EGG.SPAWN[mapName] = EGG.SPAWN[mapName] || {}
    table.insert(EGG.SPAWN[mapName], pos)
    EGG.SaveSpawnData()
end)
local _real = false
if _real then return end
hook.Add('Think' , 'EGG_Think' , function()
    hook.Remove('Think' , 'EGG_Think')
    EGG.LoadSpawnData()
    _real = true
end)
