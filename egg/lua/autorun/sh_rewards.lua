EGG.Rewards['money'] = {
    Enabled = true,
    Function = function(pp) // player
        pp:addMoney(math.random(200,500))
    end,
}

local reward_weapons = {
    'weapon_ak47',
}

EGG.Rewards['item'] = {
    Enabled = true,
    Function = function(pp) // player
        local ii = math.random(#reward_weapons)
        pp:Give(items[ii])
    end,
}

EGG.Rewards['voidcases'] = {
    Enabled = false,
    Function = function(pp) // player
        local id = 1 // voidcases id
        local amt = 1
        VoidCases.AddItem(pp:SteamID64(), id, amt)
        VoidCases.NetworkItem(pp, id, amt)
    end,
}

EGG.Rewards['mtokens'] = {
    Enabled = false,
    Function = function(pp) // player
        local amt = math.random(250,500)
        RunConsoleCommand('mtokens_givetokens' , pp:SteamID64(), amt )
    end,
}

EGG.Rewards['rank'] = {
    Enabled = false,
    Function = function(pp) // player
        ply:SetUserGroup('vip')
    end,
}