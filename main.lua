--//
--//  Lightning Hub Loader
--//  Written in Lua
--//

local game = game

if not checkcaller() then
    return
end

local games = {
    [292439477] = "pf",
    [2377868063] = "strucid",
    [3606833500] = "strucid_zone_wars",
    [6125258259] = "operation_scorpion",
    [7255828467] = "operation_scorpion",
    [6417036614] = "operation_scorpion",
    [2607077439] = "operation_scorpion";
}

local success, result = pcall(function()
    return game:HttpGetAsync(string.format("https://github.com/MarieJoker/unknown/blob/main/games/%s.lua?raw=true", games[game.PlaceId]), true)
end)

if success then
    loadstring(result)()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/universal.lua"))()
end
if identifyexecutor() == "Synapse X" then
    syn.queue_on_teleport([[
        repeat wait() until game:IsLoaded()
        wait(2)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/main.lua"))()
        end
    ]])
end
