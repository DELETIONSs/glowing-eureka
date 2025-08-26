local function SafeGetService(name)
    local Service = (game.GetService)  -- grabs the GetService function
    local Reference = (cloneref) or function(reference)
        return reference          -- fallback: identity function
    end
    return Reference(Service(game, name))  -- call GetService and optionally wrap it with cloneref
end

local ReplicatedStorage = SafeGetService("ReplicatedStorage")
local RunService = SafeGetService("RunService")
local Players = SafeGetService("Players")
local RunService2 = game:FindService("RunService")
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local animate = character:WaitForChild("Animate")
local Animate = game.Players.LocalPlayer.Character.Animate
PlaceId, JobId = game.PlaceId, game.JobId

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/drillygzzly/Other/main/1"))()

library:init() -- Initalizes Library Do Not Delete This

local Window = library.NewWindow({
	title = "Informant.Wtf",
	size = UDim2.new(0, 525, 0, 650)
})
local tabs = {
    Tab1 = Window:AddTab("Tab1"),
	Settings = library:CreateSettingsTab(Window),
}

-- Animation sets (only IDs, not assignments)
local AnimationTable = {
    Astronaut = {
        Idle1 = "rbxassetid://891621366",
        Idle2 = "rbxassetid://891633237",
        Walk = "rbxassetid://891667138",
        Run = "rbxassetid://891636393",
        Jump = "rbxassetid://891627522",
        Climb = "rbxassetid://891609353",
        Fall = "rbxassetid://891617961"
    },
    Bubbly = {
        Idle1 = "rbxassetid://910004836",
        Idle2 = "rbxassetid://910009958",
        Walk = "rbxassetid://910034870",
        Run = "rbxassetid://910025107",
        Jump = "rbxassetid://910016857",
        Fall = "rbxassetid://910001910",
        SwimIdle = "rbxassetid://910030921",
        Swim = "rbxassetid://910028158"
    },
    Cartoony = {
        Idle1 = "rbxassetid://742637544",
        Idle2 = "rbxassetid://742638445",
        Walk = "rbxassetid://742640026",
        Run = "rbxassetid://742638842",
        Jump = "rbxassetid://742637942",
        Climb = "rbxassetid://742636889",
        Fall = "rbxassetid://742637151"
    },
    Elder = {
        Idle1 = "rbxassetid://845397899",
        Idle2 = "rbxassetid://845400520",
        Walk = "rbxassetid://845403856",
        Run = "rbxassetid://845386501",
        Jump = "rbxassetid://845398858",
        Climb = "rbxassetid://845392038",
        Fall = "rbxassetid://845396048"
    },
    Knight = {
        Idle1 = "rbxassetid://657595757",
        Idle2 = "rbxassetid://657568135",
        Walk = "rbxassetid://657552124",
        Run = "rbxassetid://657564596",
        Jump = "rbxassetid://658409194",
        Climb = "rbxassetid://658360781",
        Fall = "rbxassetid://657600338"
    },
    Levitation = {
        Idle1 = "rbxassetid://616006778",
        Idle2 = "rbxassetid://616008087",
        Walk = "rbxassetid://616013216",
        Run = "rbxassetid://616010382",
        Jump = "rbxassetid://616008936",
        Climb = "rbxassetid://616003713",
        Fall = "rbxassetid://616005863"
    },
    Mage = {
        Idle1 = "rbxassetid://707742142",
        Idle2 = "rbxassetid://707855907",
        Walk = "rbxassetid://707897309",
        Run = "rbxassetid://707861613",
        Jump = "rbxassetid://707853694",
        Climb = "rbxassetid://707826056",
        Fall = "rbxassetid://707829716"
    },
    Ninja = {
        Idle1 = "rbxassetid://656117400",
        Idle2 = "rbxassetid://656118341",
        Walk = "rbxassetid://656121766",
        Run = "rbxassetid://656118852",
        Jump = "rbxassetid://656117878",
        Climb = "rbxassetid://656114359",
        Fall = "rbxassetid://656115606"
    },
    Pirate = {
        Idle1 = "rbxassetid://750781874",
        Idle2 = "rbxassetid://750782770",
        Walk = "rbxassetid://750785693",
        Run = "rbxassetid://750783738",
        Jump = "rbxassetid://750782230",
        Climb = "rbxassetid://750779899",
        Fall = "rbxassetid://750780242"
    },
    Robot = {
        Idle1 = "rbxassetid://616088211",
        Idle2 = "rbxassetid://616089559",
        Walk = "rbxassetid://616095330",
        Run = "rbxassetid://616091570",
        Jump = "rbxassetid://616090535",
        Climb = "rbxassetid://616086039",
        Fall = "rbxassetid://616087089"
    },
    Stylish = {
        Idle1 = "rbxassetid://616136790",
        Idle2 = "rbxassetid://616138447",
        Walk = "rbxassetid://616146177",
        Run = "rbxassetid://616140816",
        Jump = "rbxassetid://616139451",
        Climb = "rbxassetid://616133594",
        Fall = "rbxassetid://616134815"
    },
    Superhero = {
        Idle1 = "rbxassetid://616111295",
        Idle2 = "rbxassetid://616113536",
        Walk = "rbxassetid://616122287",
        Run = "rbxassetid://616117076",
        Jump = "rbxassetid://616115533",
        Climb = "rbxassetid://616104706",
        Fall = "rbxassetid://616108001"
    },
    Toy = {
        Idle1 = "rbxassetid://782841498",
        Idle2 = "rbxassetid://782845736",
        Walk = "rbxassetid://782843345",
        Run = "rbxassetid://782842708",
        Jump = "rbxassetid://782847020",
        Climb = "rbxassetid://782843869",
        Fall = "rbxassetid://782846423"
    },
    Vampire = {
        Idle1 = "rbxassetid://1083445855",
        Idle2 = "rbxassetid://1083450166",
        Walk = "rbxassetid://1083473930",
        Run = "rbxassetid://1083462077",
        Jump = "rbxassetid://1083455352",
        Climb = "rbxassetid://1083439238",
        Fall = "rbxassetid://1083443587"
    },
    Werewolf = {
        Idle1 = "rbxassetid://1083195517",
        Idle2 = "rbxassetid://1083214717",
        Walk = "rbxassetid://1083178339",
        Run = "rbxassetid://1083216690",
        Jump = "rbxassetid://1083218792",
        Climb = "rbxassetid://1083182000",
        Fall = "rbxassetid://1083189019"
    },
    Zombie = {
        Idle1 = "rbxassetid://616158929",
        Idle2 = "rbxassetid://616160636",
        Walk = "rbxassetid://616168032",
        Run = "rbxassetid://616163682",
        Jump = "rbxassetid://616161997",
        Climb = "rbxassetid://616156119",
        Fall = "rbxassetid://616157476"
    },
    Patrol = {
        Idle1 = "http://www.roblox.com/asset/?id=1149612882",
        Idle2 = "http://www.roblox.com/asset/?id=1150842221",
        Walk = "http://www.roblox.com/asset/?id=1151231493",
        Run = "http://www.roblox.com/asset/?id=1150967949",
        Jump = "http://www.roblox.com/asset/?id=1148811837",
        Climb = "http://www.roblox.com/asset/?id=1148811837",
        Fall = "http://www.roblox.com/asset/?id=1148863382"
    },
    Confident = {
        Idle1 = "http://www.roblox.com/asset/?id=1069977950",
        Idle2 = "http://www.roblox.com/asset/?id=1069987858",
        Walk = "http://www.roblox.com/asset/?id=1070017263",
        Run = "http://www.roblox.com/asset/?id=1070001516",
        Jump = "http://www.roblox.com/asset/?id=1069984524",
        Climb = "http://www.roblox.com/asset/?id=1069946257",
        Fall = "http://www.roblox.com/asset/?id=1069973677"
    },
    Popstar = {
        Idle1 = "http://www.roblox.com/asset/?id=1212900985",
        Idle2 = "http://www.roblox.com/asset/?id=1150842221",
        Walk = "http://www.roblox.com/asset/?id=1212980338",
        Run = "http://www.roblox.com/asset/?id=1212980348",
        Jump = "http://www.roblox.com/asset/?id=1212954642",
        Climb = "http://www.roblox.com/asset/?id=1213044953",
        Fall = "http://www.roblox.com/asset/?id=1212900995"
    },
    Cowboy = {
        Idle1 = "http://www.roblox.com/asset/?id=1014390418",
        Idle2 = "http://www.roblox.com/asset/?id=1014398616",
        Run = "http://www.roblox.com/asset/?id=1014401683",
        Jump = "http://www.roblox.com/asset/?id=1014394726",
        Climb = "http://www.roblox.com/asset/?id=1014380606",
        Fall = "http://www.roblox.com/asset/?id=1014384571"
    },
    Ghost = {
        Idle1 = "http://www.roblox.com/asset/?id=616006778",
        Idle2 = "http://www.roblox.com/asset/?id=616008087",
        Run = "http://www.roblox.com/asset/?id=616013216",
        Jump = "http://www.roblox.com/asset/?id=616008936",
        Fall = "http://www.roblox.com/asset/?id=616005863",
        SwimIdle = "http://www.roblox.com/asset/?id=616012453",
        Swim = "http://www.roblox.com/asset/?id=616011509"
    },
    Sneaky = {
        Idle1 = "http://www.roblox.com/asset/?id=1132473842",
        Idle2 = "http://www.roblox.com/asset/?id=1132477671",
        Run = "http://www.roblox.com/asset/?id=1132494274",
        Jump = "http://www.roblox.com/asset/?id=1132489853",
        Climb = "http://www.roblox.com/asset/?id=1132461372",
        Fall = "http://www.roblox.com/asset/?id=1132469004"
    },
    Princess = {
        Idle1 = "http://www.roblox.com/asset/?id=941003647",
        Idle2 = "http://www.roblox.com/asset/?id=941013098",
        Run = "http://www.roblox.com/asset/?id=941015281",
        Jump = "http://www.roblox.com/asset/?id=941008832",
        Climb = "http://www.roblox.com/asset/?id=940996062",
        Fall = "http://www.roblox.com/asset/?id=941000007"
    }
}

-- Function to apply a set
local function applyAnimations(setName)
    local set = AnimationTable[setName]
    if not set then return end

    if set.Idle1 then animate.idle.Animation1.AnimationId = set.Idle1 end
    if set.Idle2 then animate.idle.Animation2.AnimationId = set.Idle2 end
    if set.Walk then animate.walk.WalkAnim.AnimationId = set.Walk end
    if set.Run then animate.run.RunAnim.AnimationId = set.Run end
    if set.Jump then animate.jump.JumpAnim.AnimationId = set.Jump end
    if set.Climb then animate.climb.ClimbAnim.AnimationId = set.Climb end
    if set.Fall then animate.fall.FallAnim.AnimationId = set.Fall end
    if set.SwimIdle and animate:FindFirstChild("swimidle") then
        animate.swimidle.SwimIdle.AnimationId = set.SwimIdle
    end
    if set.Swim and animate:FindFirstChild("swim") then
        animate.swim.Swim.AnimationId = set.Swim
    end
end
-- Dropdown to choose which pack
local chosenSet = "Astronaut" -- default
local Idle1Choice = AnimsTab:Dropdown({
    Title = "Choose Animation Pack",
    Values = {"Astronaut", "Bubbly", "Cartoony", "Elder", "Knight", "Levitation", "Mage", "Ninja", "Pirate", "Robot",
              "Stylish", "Superhero", "Toy", "Vampire", "Werewolf", "Zombie", "Patrol", "Confident", "Popstar", "Cowboy", "Ghost", "Sneaky", "Princess"},
    Value = "Astronaut",
    Callback = function(option)
        chosenSet = option
        print("Animation pack selected: " .. option)
    end
})

-- Apply button
AnimsTab:Button({
    Title = "Apply Animations",
    Desc = "Applies the selected animation pack",
    Icon = "zap",
    Callback = function()
        applyAnimations(chosenSet)
    end
})

-- Reset button (goes back to Astronaut default)
AnimsTab:Button({
    Title = "Reset Animations",
    Desc = "Resets back to Astronaut animations",
    Icon = "zap",
    Callback = function()
        applyAnimations("Astronaut")
    end
})

--[[ 
	
	Server Tab
	
]]

--[[

    Config Tab

]]
ConfigTab:Button({
    Title = "Vision",
    Desc = "Custom Theme",
    Icon = "zap",
    Callback = function()
    WindUI:SetTheme("Vision")
    end
})
ConfigTab:Button({
    Title = "Rose",
    Desc = "Custom Red",
    Icon = "zap",
    Callback = function()
    WindUI:SetTheme("Rose")
    end
})
ConfigTab:Button({
    Title = "Cerulean",
    Desc = "Custom Blue",
    Icon = "zap",
    Callback = function()
    WindUI:SetTheme("Cerulean")
    end
})