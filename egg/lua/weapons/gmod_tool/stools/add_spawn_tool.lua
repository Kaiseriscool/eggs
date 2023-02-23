AddCSLuaFile()

print("Egg Spawn Creator Loaded")
TOOL.Category = "Construction"
TOOL.Name = "Egg Spawn Creator"
TOOL.Command = nil
local function AddSpawn(pos)
    print(pos)
    if SERVER then return end
    net.Start("EGG_AddSpawn")
    net.WriteVector(pos)
    net.SendToServer()
end
local cd__ = CurTime()
function TOOL:LeftClick(trace)
    if cd__ > CurTime() then return end
    cd__ = CurTime() + 1
	AddSpawn(trace.HitPos)
end

function TOOL:RightClick(trace)
    if cd__ > CurTime() then return end
    cd__ = CurTime() + 1
    AddSpawn(trace.HitPos)
end

function TOOL:Deploy()
end

function TOOL.BuildCPanel(CPanel)
end
