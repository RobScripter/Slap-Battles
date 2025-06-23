local RequireService = cloneref or function(clone) return clone end
local BlockInstance = function(ez)
    ez.Name = "BlockedInstance_"..math.random(0,500000)
    ez.Parent = RequireService(game:GetService("LogService"))
    ez:Destroy()
end

local game = game or Ugc
local Players = RequireService(game:GetService("Players"))
local Player = Players.LocalPlayer
local PlayerScripts = Player:WaitForChild("PlayerScripts")
local StarterPlayer = RequireService(game:GetService("StarterPlayer"))
local StarterPlayerScripts = StarterPlayer:WaitForChild("StarterPlayerScripts")
local ReplicatedStorage = RequireService(game:GetService("ReplicatedStorage"))
local ReplicatedFirst = RequireService(game:GetService("ReplicatedFirst"))

local function notify(text, iconId)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Bypass",
        Text = text,
        Duration = 999999,
        Button1 = "OK",
        Icon = iconId
    })
end

local function DestroyGrabLocalScript()
    if ReplicatedFirst and ReplicatedFirst:FindFirstChild("Client") and ReplicatedFirst.Client:FindFirstChild("GrabLocal") then
        BlockInstance(ReplicatedFirst.Client.GrabLocal)
        notify("✅ Bypassed Grab Client!", "rbxassetid://14793431068")
    end
end

local function BypassMobileClientAntiCheat()
    if StarterPlayerScripts and StarterPlayerScripts:FindFirstChild("ClientAnticheat") and StarterPlayerScripts.ClientAnticheat:FindFirstChild("AntiMobileExploits") then
        BlockInstance(StarterPlayerScripts.ClientAnticheat.AntiMobileExploits)
        BlockInstance(StarterPlayerScripts.ClientAnticheat)
        notify("✅ Bypassed Mobile Client Anti-Cheat!", "rbxassetid://14793431068")
    end
end

local function isBypassed(remotes)
    for _, remote in pairs(remotes) do
        if remote and remote.Parent then
            return false
        end
    end
    return true 
end

local function blockRemotes(remotes)
    for _, remote in pairs(remotes) do
        if remote and remote.Parent then
            BlockInstance(remote)
        end
    end
end

local placeId = game.PlaceId
local remotesToBlock = {}

if placeId == 9431156611 then -- Slap Royale
    remotesToBlock = {
        ReplicatedStorage.Events:FindFirstChild("Ban"),
        ReplicatedStorage.Events:FindFirstChild("WS"),
        ReplicatedStorage.Events:FindFirstChild("AdminGUI"),
        ReplicatedStorage.Events:FindFirstChild("WS2")
    }
elseif placeId == 11520107397 or placeId == 9015014224 or placeId == 6403373529 or placeId == 124596094333302 then
    remotesToBlock = {
        ReplicatedStorage:FindFirstChild("Ban"),
        ReplicatedStorage:FindFirstChild("WalkSpeedChanged"),
        ReplicatedStorage:FindFirstChild("AdminGUI"),
        ReplicatedStorage:FindFirstChild("GRAB"),
        ReplicatedStorage:FindFirstChild("SpecialGloveAccess")
    }
else
    notify("✖️ Game not supported.", "rbxassetid://6035047387")
    return
end


local filteredRemotes = {}
for _, remote in pairs(remotesToBlock) do
    if remote then table.insert(filteredRemotes, remote) end
end

if #filteredRemotes == 0 then
    notify("✅ Already bypassed! Total blocked: "..#filteredRemotes, "rbxassetid://14793431068")
    return
end

if isBypassed(filteredRemotes) then
    notify("✅ Already bypassed! Total blocked: "..#filteredRemotes, "rbxassetid://14793431068")
else
    blockRemotes(filteredRemotes)
    notify("✅ Bypass successful! Total blocked: "..#filteredRemotes, "rbxassetid://14793431068")
end


DestroyGrabLocalScript()
BypassMobileClientAntiCheat()
