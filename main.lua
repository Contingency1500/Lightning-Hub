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

loadstring(game:HttpGet("https://raw.githubusercontent.com/MarieJoker/unknown/main/libs/meta.lua"))()

if hook_meta_method then
do
    local old;
        old = meta.main.__namecall.append(function(...)
            if get_namecall_method() == "Kick" then
                return wait(9e9);
            end;
        return old(...);
    end);
end;

local games = {
    [2625195454] = "ep",
    [3200010305] = "ep";
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
