if SAM_LOADED then return end
local sam, command, language = sam, sam.command, sam.language

command.set_category( "EGG System" )

command.new( "Spawn Egg" )
	:SetPermission( "Spawn Egg", "admin" )
	:Help( "Spawns a egg" )
	:OnExecute(function(ply)
        EGG:Spawn()
		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} has spawned a egg!", {
			A = ply
		})
	end)
:End()