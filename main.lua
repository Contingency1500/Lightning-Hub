-->
-->  Lightning Hub Loader
-->  Written in Lua
-->

local game = game;

game.Loaded:Wait();

local hook_meta_method = hookmetamethod;

local get_namecall_method = getnamecallmethod or get_namecall_method;

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
};

local success, result = pcall(function()
    return game:HttpGet(string.format("https://github.com/MarieJoker/unknown/blob/main/games/%s.lua?raw=true", games[game.PlaceId] or "universal"));
end);

if success then loadstring(result)() end;
