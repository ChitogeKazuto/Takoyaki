-- Takoyaki X - Universal
local TakoyakiXLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Takoyaki/master/Ui%20Takoyaki.lua"))()
local TakoyakiX = TakoyakiXLibrary.new("Takoyaki X", 0)

-- LocalPlayerPage
local LocalPlayerPage = TakoyakiX:addPage("LocalPlayer", 4384401919)
local WalkSpeedSection = LocalPlayerPage:addSection("WalkSpeed")

WalkSpeedSection:addSlider("Speed", 16, 0, 300, function(Value)
    _G.Speed = Value
end)
WalkSpeedSection:addToggle("WalkSpeed", false, function(Value)
    _G.WalkSpeed = Value
    while _G.WalkSpeed do wait()
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
    end
    if _G.WalkSpeed == false then
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

local JumpPowerSection = LocalPlayerPage:addSection("JumpPower")
JumpPowerSection:addSlider("Jump", 50, 0, 300, function(Value)
    _G.Jump = Value
end)
JumpPowerSection:addToggle("JumpPower", false, function(Value)
    _G.JumpPower = Value
    while _G.JumpPower do wait()
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = _G.Jump
    end
    if _G.JumpPower == false then
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

TakoyakiX:SelectPage(TakoyakiX.pages[1], true)