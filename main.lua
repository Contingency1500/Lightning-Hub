--//
--//  Lightning Hub Loader
--//  Written in Lua
--//

local game = game;

local Players = game:GetService("Players");

local LocalPlayer = Players.LocalPlayer;

if not game:IsLoaded() then
    repeat
        wait();
    until game:IsLoaded();
end;

local hook_meta_method = hookmetamethod;

local get_namecall_method = getnamecallmethod or get_namecall_method;

local hookfunc = hookfunction or hookfunc;

if hookfunc then
    hookfunc(error, warn);
end;

loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/Lightning-Hub/main/libs/meta.lua"))();

if hook_meta_method then
do
    local old;
        old = meta.main.__namecall.append(function(Self, ...)
            if Self == LocalPlayer and get_namecall_method() == "Kick" then
                return wait(9e9);
            end;
        return old(Self, ...);
    end);
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
end;
