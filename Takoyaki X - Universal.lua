-- Takoyaki X - Universal
local TakoyakiXLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Takoyaki/master/Ui%20Takoyaki.lua"))()
local TakoyakiX = TakoyakiXLibrary.new("Takoyaki X", 0)

-- Settings. Local
local ALLPLAYER = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(ALLPLAYER, v.Name)
    end

WalkSpeedSettings = {
    NSpeed = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed
}

JumpPowerSettings = {
    NJump = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
}

FullBrightSettings = {
    NAmbient = game:GetService("Lighting").Ambient,
    NOutdoorAmbient = game:GetService("Lighting").OutdoorAmbient,
    NBrightness = game:GetService("Lighting").Brightness,
    NClockTime = game:GetService("Lighting").ClockTime,
    NFogEnd = game:GetService("Lighting").FogEnd,
    NFogStart = game:GetService("Lighting").FogStart, 
    NGlobalShadows = game:GetService("Lighting").GlobalShadows
}

-- LocalPlayerPage
local LocalPlayerPage = TakoyakiX:addPage("LocalPlayer", 4384401919)
local WalkSpeedSection = LocalPlayerPage:addSection("WalkSpeed")

WalkSpeedSection:addSlider("Speed", WalkSpeedSettings.NSpeed, 0, 300, function(Value)
    _G.Speed = Value
end)
WalkSpeedSection:addToggle("WalkSpeed", false, function(Value)
    _G.WalkSpeed = Value
    while _G.WalkSpeed do wait()
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
    end
    if _G.WalkSpeed == false then
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedSettings.NSpeed
    end
end)

local JumpPowerSection = LocalPlayerPage:addSection("JumpPower")
JumpPowerSection:addSlider("Jump", JumpPowerSettings.NJump, 0, 300, function(Value)
    _G.Jump = Value
end)
JumpPowerSection:addToggle("JumpPower", false, function(Value)
    _G.JumpPower = Value
    while _G.JumpPower do wait()
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = _G.Jump
    end
    if _G.JumpPower == false then
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = JumpPowerSettings.NJump
    end
end)

-- MiscPage
local MiscPage = TakoyakiX:addPage("Misc", 3944704135)
local TeleportSection = MiscPage:addSection("Teleport")

TeleportSection:addDropdown("Player Name", ALLPLAYER, function(Value)
    _G.PlayerName = Value
end)

TeleportSection:addButton("Teleport To Player", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[_G.PlayerName].Character.HumanoidRootPart.CFrame
end)

local FullBrightSection = MiscPage:addSection("FullBright")

FullBrightSection:addToggle("FullBright", false, function(Value)
    _G.FullBright = Value
    if _G.FullBright then
    game:GetService("Lighting").Brightness = 2
	game:GetService("Lighting").ClockTime = 14
	game:GetService("Lighting").FogEnd = 100000
	game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
else
    game:GetService("Lighting").Brightness = FullBrightSettings.NBrightness
	game:GetService("Lighting").ClockTime = FullBrightSettings.NClockTime
	game:GetService("Lighting").FogEnd = FullBrightSettings.NFogEnd
	game:GetService("Lighting").GlobalShadows = FullBrightSettings.NGlobalShadows
    game:GetService("Lighting").OutdoorAmbient = FullBrightSettings.NOutdoorAmbient
    end
end)

-- SettingsPage
local SettingsPage = TakoyakiX:addPage("Settings", 4483345737)
local TakoyakiXSection = SettingsPage:addSection("Takoyaki X")

TakoyakiXSection:addButton("Destroy Takoyaki X", function()
game:GetService("CoreGui")["Takoyaki X"]:Destroy()
end)

TakoyakiX:SelectPage(TakoyakiX.pages[1], true)