--//
--//  Lightning Hub Loader
--//  Written in Lua
--//

local game = game;

if not game:IsLoaded() then
    repeat
        wait();
    until game:IsLoaded();
end;

local games = {
    [292439477] = "pf",
    [2377868063] = "strucid",
    [3606833500] = "strucid_zone_wars",
    [6125258259] = "operation_scorpion",
    [7255828467] = "operation_scorpion",
    [6417036614] = "operation_scorpion",
    [2607077439] = "operation_scorpion";
};

local success, result = pcall(function()
    return game:HttpGetAsync(string.format("https://github.com/MarieJoker/unknown/blob/main/games/%s.lua?raw=true", games[game.PlaceId]));
end);

if success then
    loadstring(result)();
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/universal.lua"))();
end;
