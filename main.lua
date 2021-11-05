--//
--//  Lightning Hub Loader
--//  Written in Lua
--//
--//  Created by Marie Joker on 11/04/2021.
--//

local game = game

if not checkcaller() then
    return
end

local Games = {
    [292439477] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/pf.lua"))()
    end,
    [2377868063] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/strucid.lua"))()
    end,
    [3606833500] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/strucid_zone_wars.lua"))()
    end,
    [6125258259] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/operation_scorpion.lua"))()
    end,
    [7255828467] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/operation_scorpion.lua"))()
    end,
    [6417036614] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/operation_scorpion.lua"))()
    end,
    [2607077439] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/operation_scorpion.lua"))()
    end
}

local t, x =
    pcall(
    function()
        return Games[game.PlaceId]()
    end
)

if t then
    warn("loaded")
else
    --universal
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/universal.lua"))()
end
if identifyexecutor() == "Synapse X" then
    syn.queue_on_teleport([[
        repeat wait() until game:IsLoaded()
        wait(4)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/main.lua"))()
        end
    ]])
end
