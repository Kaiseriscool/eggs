include("shared.lua")
print("Really?")
for i=20, 40 do
	surface.CreateFont( "REAL."..i, { font = "Arial", size = i })
end
function ENT:Draw()
    self:DrawModel()
    local pos = self:GetPos() + Vector(0, 0, 10) -- adjust the offset as needed
    local ang = self:GetAngles()
    if LocalPlayer():GetPos():Distance( self:GetPos() ) > 400 then return end
    local Pos = self:GetPos() + self:GetUp() * (57.5 / 2)
	Pos = Pos + self:GetUp() * math.abs( math.sin( CurTime() ) * 1.25 )
	local Ang = Angle( 0, LocalPlayer():EyeAngles().y - 90, 90 )
	cam.Start3D2D( Pos, Ang, 0.1 )
		draw.RoundedBox( 22, -125, 30, 250, 60, Color( 0, 0, 0, 200 ) )
		draw.SimpleTextOutlined( "EGG", "REAL.33", 0, 58, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, Color( 59, 210, 39, 25) )
		draw.NoTexture()
	cam.End3D2D()
end
