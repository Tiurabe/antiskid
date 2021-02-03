--[[
    Made By Gostrondude
--]]

--//Instances:

local grabCords = Instance.new("ScreenGui")
local drag = Instance.new("Frame")
local main = Instance.new("Frame")
local cords = Instance.new("TextLabel")
local grab = Instance.new("TextButton")
local bottom = Instance.new("TextLabel")
local copy = Instance.new("TextButton")
local bottom2 = Instance.new("TextLabel")

--//Properties:

grabCords.Parent = game.CoreGui
grabCords.Name = "grabCords"
grabCords.Enabled = true
grabCords.ResetOnSpawn = true

drag.Name = "drag"
drag.Parent = grabCords
drag.BackgroundColor3 = Color3.new(0.196078, 0.305882, 0.384314)
drag.BorderColor3 = Color3.new(0.196078, 0.305882, 0.384314)
drag.Position = UDim2.new(0.431770831, 0, 0.390663385, 0)
drag.Size = UDim2.new(0, 262, 0, 18)
drag.Active = true
drag.Draggable = true

main.Name = "main"
main.Parent = drag
main.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(0, 262, 0, 124)

cords.Name = "cords"
cords.Parent = main
cords.BackgroundColor3 = Color3.new(0.196078, 0.305882, 0.384314)
cords.BorderColor3 = Color3.new(0.196078, 0.305882, 0.384314)
cords.Position = UDim2.new(0, 0, 0.0823529437, 0)
cords.Size = UDim2.new(0, 262, 0, 47)
cords.Font = Enum.Font.SourceSans
cords.Text = ""
cords.TextColor3 = Color3.new(1, 1, 1)
cords.TextScaled = true
cords.TextSize = 14
cords.TextWrapped = true

grab.Name = "grab"
grab.Parent = main
grab.BackgroundColor3 = Color3.new(0.196078, 0.305882, 0.384314)
grab.BorderColor3 = Color3.new(0.196078, 0.305882, 0.384314)
grab.Position = UDim2.new(0.0343511403, 0, 0.533721089, 0)
grab.Size = UDim2.new(0, 119, 0, 40)
grab.Font = Enum.Font.SourceSans
grab.Text = "Grab Current Coordinates"
grab.TextColor3 = Color3.new(1, 1, 1)
grab.TextScaled = true
grab.TextSize = 20
grab.TextWrapped = true

bottom.Name = "bottom"
bottom.Parent = main
bottom.BackgroundColor3 = Color3.new(0.196078, 0.305882, 0.384314)
bottom.BorderColor3 = Color3.new(0.196078, 0.305882, 0.384314)
bottom.Position = UDim2.new(0, 0, 0.9374156, 0)
bottom.Size = UDim2.new(0, 262, 0, 19)
bottom.Font = Enum.Font.SourceSans
bottom.Text = "Open/Close Is Z"
bottom.TextColor3 = Color3.new(1, 1, 1)
bottom.TextSize = 12
bottom.TextXAlignment = Enum.TextXAlignment.Left

copy.Name = "copy"
copy.Parent = main
copy.BackgroundColor3 = Color3.new(0.196078, 0.305882, 0.384314)
copy.BorderColor3 = Color3.new(0.196078, 0.305882, 0.384314)
copy.Position = UDim2.new(0.511450291, 0, 0.533721089, 0)
copy.Size = UDim2.new(0, 119, 0, 40)
copy.Font = Enum.Font.SourceSans
copy.Text = "Copy To Clipboard"
copy.TextColor3 = Color3.new(1, 1, 1)
copy.TextScaled = true
copy.TextSize = 20
copy.TextWrapped = true

bottom2.Name = "bottom2"
bottom2.Parent = main
bottom2.BackgroundColor3 = Color3.new(0.196078, 0.305882, 0.384314)
bottom2.BorderColor3 = Color3.new(0.196078, 0.305882, 0.384314)
bottom2.Position = UDim2.new(0.652671754, 0, 0.9374156, 0)
bottom2.Size = UDim2.new(0, 91, 0, 19)
bottom2.Font = Enum.Font.SourceSans
bottom2.Text = "Made By Gostrondude"
bottom2.TextColor3 = Color3.new(1, 1, 1)
bottom2.TextSize = 12
bottom2.TextXAlignment = Enum.TextXAlignment.Left

--//Scripts:

--//Open/Close Function:

local open = true
function onKeyPress(inputObject, gameProcessedEvent)
if inputObject.KeyCode == Enum.KeyCode.Z and gameProcessedEvent == false then
if open == true then
open = false
drag:TweenPosition(UDim2.new(0.432, 0,0.391, 0), "In", "Quad", 1.5)
else
open = true
drag:TweenPosition(UDim2.new(-1, 0,0.391, 0), "Out", "Quad", 1.5)
end
end
end

--//Grabbing Function:

game:GetService("UserInputService").InputBegan:connect(onKeyPress)

grab.MouseButton1Down:Connect(function()
    cords.Text = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
    wait(0.25)
    print('Coordinates: '..tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))
end)

copy.MouseButton1Down:Connect(function()
    setclipboard("Coordinates: "..cords.Text)
end)
