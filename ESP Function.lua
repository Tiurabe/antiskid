--Forked from: https://github.com/SenseiJoshy/L


function WTS(part)
	local screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
	return Vector2.new(screen.x, screen.y)
end

function ESP(part, text, color)
	local name = Drawing.new("Text")
	name.Text = text
	name.Color = color
	name.Position = WTS(part)
	name.Size = 20.0
	name.Outline = true
	name.Center = true
	name.Visible = true
	
	game:GetService("RunService").Stepped:connect(function()
		pcall(function()
			game:GetService("RunService").Heartbeat:wait()
			local destroyed = not part:IsDescendantOf(workspace)
			if destroyed and name ~= nil then
				name:Remove()
			end
			if part ~= nil then
				name.Position = WTS(part)
			end
			local _, screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
			if screen then
				name.Visible = true
			else
				name.Visible = false
			end
		end)
	end)
end
