AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua") 
include("shared.lua")


function ENT:Initialize()
    self:SetModel("models/wos/lct/props/pisanka.mdl") -- replace with the model you want to use
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
    end
end

function ENT:Touch(🤓)
    if 🤓:IsPlayer() then
        self:Remove()
        EGG.OtherCfg.OnTouch(🤓)
    end
end
