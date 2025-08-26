--[[

    █░█   █   █▀   █   █▀█   █▄░█ -- Earliest Stage of development
    ▀▄▀   █   ▄█   █   █▄█   █░▀█ -- Made by re_

]]
    
local function SafeGetService(name)
    local Service = (game.GetService) -- grabs the GetService function
    local Reference = (cloneref) or function(reference)
        return reference -- fallback: identity function
    end
    return Reference(Service(game, name)) -- call GetService and optionally wrap it with cloneref
end

local HttpService = SafeGetService("HttpService")
local ReplicatedStorage = SafeGetService("ReplicatedStorage")
local RunService = SafeGetService("RunService")
local StarterGui = SafeGetService("StarterGui")
local SoundService = SafeGetService("SoundService")
local Players = SafeGetService("Players")
local Player = game.Players.LocalPlayer

local PlaceId = game.PlaceId
local JobId = game.JobId

local function LoadSupportedGames()
    local jsonData

    -- Try to read local JSON
    local ok, err = pcall(function()
        if readfile and isfile and isfile("SupportedGames.json") then
            jsonData = readfile("SupportedGames.json")
        end
    end)
    if not ok then
        warn("[Loader] readfile failed:", err)
    end

    -- If not found, try pulling from web
    if not jsonData then
        local url = "https://raw.githubusercontent.com/DELETIONSs/glowing-eureka/refs/heads/main/SupportedGames.json"
        local success, result = pcall(function()
            return game:HttpGet(url)
        end)
        if success then
            jsonData = result
        else
            warn("[Loader] Could not fetch JSON from:", url)
        end
    end

    -- If still no JSON → abort
    if not jsonData then
        error("[Loader] SupportedGames.json could not be loaded. Aborting.")
    end

    -- Decode JSON
    local success, result = pcall(function()
        return HttpService:JSONDecode(jsonData)
    end)

    if not success then
        error("[Loader] Failed to decode SupportedGames.json: " .. tostring(result))
    end

    return result
end

-- // Load supported games
local SupportedGames = LoadSupportedGames()

-- // Import game scripts
local GameScripts = require(script:WaitForChild("games"))

-- // Detect current game
local placeId = tostring(game.PlaceId)
if SupportedGames[placeId] then
    local GameKey = SupportedGames[placeId]
    local ScriptToLoad = GameScripts[GameKey]

    if ScriptToLoad then
        print("[Loader] Loading script for:", GameKey)
        ScriptToLoad()
    else
        warn("[Loader] No script found for:", GameKey)
    end
else
    warn("[Loader] Game not supported. PlaceId:", placeId)
end


