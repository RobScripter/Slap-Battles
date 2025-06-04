local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobScripter/Orion/refs/heads/main/source"))()
local Player = game.Players.LocalPlayer

local Window = OrionLib:MakeWindow({
    Name = "Key System | Slap Aura Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "MyScript",
    IntroIcon = "rbxassetid://17368155868",
    IntroText = "Key System"
})

-- 🔑 Replace with your actual key
_G.Key = "7gdu@P8E"
_G.KeyInput = ""

function loadMainScript()
    OrionLib:MakeNotification({
        Name = "Key Verified",
        Content = "Access Granted. Loading script...",
        Image = "rbxassetid://13311697780",
        Time = 5
    })
    
    wait(3)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RobScripter/Slap-Battles/refs/heads/main/SlapAuraHub.lua"))()
    OrionLib:Destroy()
end

-- 🔐 Key Tab
local Tab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://128953625656358",
    PremiumOnly = false
})

-- 📝 Key Input
Tab:AddTextbox({
    Name = "Enter your key",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        _G.KeyInput = Value
    end
})

-- ✅ Verify Key Button
Tab:AddButton({
    Name = "✅ Verify Key",
    Callback = function()
        if _G.KeyInput == _G.Key then
            loadMainScript()
        else
            OrionLib:MakeNotification({
                Name = "Invalid Key",
                Content = "The key you entered is incorrect.",
                Image = "rbxassetid://13369776137",
                Time = 5
            })
        end
    end
})

-- 🔗 Get Key Button (copies link to clipboard)
Tab:AddButton({
    Name = "🔗 Get Key",
    Callback = function()
        setclipboard("https://lootdest.org/s?cweeOvTq") -- 👈 Your lootlink
        OrionLib:MakeNotification({
            Name = "Link Copied",
            Content = "The key link has been copied. Paste it into your browser.",
            Image = "rbxassetid://18209599964",
            Time = 6
        })
    end
})
