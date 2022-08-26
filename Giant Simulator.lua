if game.PlaceId == 2986677229 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "v1.2 Giant Simulator", HidePremium = false, IntroEnabled = true,IntroText = "Welcome!", SaveConfig = true, ConfigFolder = "GiantSimulatorTest"})

    --Values
    getgenv().autoClick = true
    getgenv().autoQuest = true	
    
    --Functions
    function autoClick()
        while getgenv().autoClick == true 
        game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.WeaponAttackStart:FireServer()
        wait(0.1)    
        game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.WeaponAnimComplete:FireServer()
     end 
    end
    --Functions
    function autoQuest()
        while getgenv().autoQuest == true 
        for i=1, 100 do
            game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.StartQuestRequest:InvokeServer()
            wait(0.1)
            game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.EndQuestRequest:InvokeServer()
        end
    end
    
    -- Tabs
    local ScriptsTab = Window:MakeTab({
        Name = "Script",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Tabs
    local FarmTab = Window:MakeTab({
        Name = "AutoFarm",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    -- Toggle 
    ScriptsTab:AddButton({
        Name = "Auto Clicker",
        Callback = function()
            getgenv().Settings = {
                ["Auto Click Keybind"] = "V", -- Use an UpperCase letter or KeyCode Enum. Ex: Enum.KeyCode.Semicolon
                ["Lock Mouse Position Keybind"] = "B",
                ["Right Click"] = false,
                ["GUI"] = true, -- A drawing gui that tells you what is going on with the autoclicker.
                ["Delay"] = 0 -- 0 for RenderStepped, other numbers go to regular wait timings.
            }
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BimbusCoder/Script/main/Auto%20Clicker.lua"))() 
        end    
    })
    
    -- Toggle 
    FarmTab:AddButton({
        Name = "Auto Quest",
        Callback = function(Value)
            getgenv().autoQuest = Value
            autoQuest()
        end
    })
    -- Toggle
    FarmTab:AddToggle({
        Name = "Auto Click",
        Default = false,
        Callback = function(Value)
            getgenv().autoClick = Value
            autoClick()
        end
    })


    OrionLib:MakeNotification({
        Name = "Ty for using the my script",
        Content = "You Executed me "..Player.Name..".",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
    end
    OrionLib:Init()-- End of this script
end   

function CorrectKeyNotification()
    orionLib:MakeNotification({
        Name = "Correct Key",
        Content = "You have entered the correct key!",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

function incorrectKeyNotification()
    OrionLib:MakeNotification({
        Name = "InCorrect Key",
        Content = "You have entered the Incorrect key!",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end
    
local KeyTab = Window:MakeTab({
    Name = "Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
    
KeyTab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        getgenv().Keyinput = Value
    end	  
})
    
KeyTab:AddButton({
    Name = "Ceack Key",
    Callback = function()
        if getgenv().Keyinput == getgenv().Key then
        MakeScriptHub()
        CorrectKeyNotification()
        else
            incorrectKeyNotification()
        end	
    end    
})
