print("--------------------------- Devil Fruit Watcher Loaded --------------------------")
print("By: Tiurabe")
local bCounter = 0
for i, v in pairs(workspace:GetChildren()) do
	if v:IsA("Tool") or v:IsA("Model") and v.Name == "Fruit" or v.ClassName == "TouchTransmitter" and v.Parent.Name == "Handle" then
		if v.Fruit then
			local BillboardGui = Instance.new("BillboardGui")
			local TextLabel = Instance.new("TextLabel")
			BillboardGui.Parent = v.Handle
			BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			BillboardGui.Active = true
			BillboardGui.AlwaysOnTop = true
			BillboardGui.LightInfluence = 1
			BillboardGui.Size = UDim2.new(0, 100, 0, 25)
			BillboardGui.Name = "Billboard " .. bCounter
			bCounter += 1
			TextLabel.Parent = BillboardGui
			TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.Size = UDim2.new(0, 100, 0, 25)
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.Text = v.Name .. " - Fruit Here!!"
			TextLabel.TextColor3 = v.Fruit.Color
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14
			TextLabel.TextWrapped = true
		end
	end
end

function notificate()
	game.StarterGui:SetCore("SendNotification", {
	Title = "Fruit Notifier"; -- the title (ofc)
	Text = "Warning: Devil Fruit Found!!!"; -- what the text says (ofc)
	Icon = "rbxassetid://57254792"; -- the image if u want. 
	Duration = 3;}) -- how long the notification should in secounds
end

function deleter()
	for i,v in pairs(game.Workspace:GetDescendants()) do
		if v.ClassName == "BillboardGui" and v.Parent.Name == "Handle" then
			if string.match(v.Name, "Billboard ") and not string.match(v.Name, "Billboard 0") then
				v:Destroy()
			end
		end
	end
end

_G.t = true
while _G.t do
	wait(3)
	for i,v in pairs(game.Workspace:GetDescendants()) do
		if v.ClassName == "TouchTransmitter" and v.Parent.Name == "Handle" then
			wait(0.01)
			notificate()
			wait()
			deleter()
			wait()
		end
	end
end
