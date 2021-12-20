-->
-->  Lightning Hub Loader
-->  Written in Lua
-->

local game = game;

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

if hook_meta_method then
do
    local old;
    old = hookmetamethod(game, "__namecall", function(...)
        if getnamecallmethod() == "Kick" then
            return nil;
        end;
        return old(...);
    end);
end;

local games = {
    [2625195454] = "ep",
    [3200010305] = "ep",
    [2797881676] = "ep",
    [2951213182] = "ep",
    [3590667014] = "ep",
    [4518266946] = "ep",
    [4661507759] = "ep",
    [4768829954] = "ep";
};

local success, result = pcall(function()
    return game:HttpGetAsync(string.format("https://github.com/MarieJoker/unknown/blob/main/games/%s.lua?raw=true", games[game.PlaceId]));
end);

if success then
        loadstring(result)();
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/games/universal.lua", true))();
    end;
end;
