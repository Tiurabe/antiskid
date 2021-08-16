repeat wait() until game:IsLoaded()

--Global table that stores detected people
_G.Skids = {""}

--Function that checks if the object is a player
function checkIfPlr(obj)

	local Players = game:GetService("Players"):GetPlayers()

    for i,v in pairs(Players) do
        if string.match(tostring(obj), tostring(v.Name)) then
            return v.Name
        end
    end

    return false
end
--Notification Function
function Notificate(clown)
    --Checks if ape is already in the list
    if table.find(_G.Skids, tostring(clown)) then
        return
    end
         
    game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "Notification";
    Text = "Clown "..'"'..tostring(clown)..'"'.." is using FE Invisible Fling";
    Icon = "rbxthumb://type=Asset&id=7153005544&w=150&h=150";
    Duration = 16})
        
    table.insert(_G.Skids,tostring(clown))
    if _G.Skids[1] == "" then
        table.remove(_G.Skids, 1)
    end
    print("A new clown has been detected!! : "..clown)
    print("Current clowns: " .. table.concat(_G.Skids," ,"))
        
end

function Verify()
    
    --Detect the clowns
    for i,v in pairs(workspace:GetChildren()) do
        if checkIfPlr(v) then
            if v:FindFirstChild("Humanoid") and tostring(v.Humanoid.RigType) == "Enum.HumanoidRigType.R6" then
                if v:FindFirstChild("HumanoidRootPart") and not v:FindFirstChild("Head") and not v:FindFirstChild("Torso") and not v:FindFirstChild("Left Arm") and not v:FindFirstChild("Right Arm") and not v:FindFirstChild("Left Leg") and not v:FindFirstChild("Right Leg") then
                    Notificate(v.Name)
                end
            end
        end
    end
    
end
--Loops the check
while wait(1) do
    Verify()
end
