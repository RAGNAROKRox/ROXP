local player = game.Players.LocalPlayer

-- Remove previous instance
local oldGui = player:FindFirstChild("PlayerGui"):FindFirstChild("ROX_UI")
if oldGui then oldGui:Destroy() end

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "ROX_UI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Create ROX Button
local openButton = Instance.new("TextButton")
openButton.Name = "OpenROX"
openButton.Parent = gui
openButton.Size = UDim2.new(0, 40, 0, 40)
openButton.Position = UDim2.new(0, 10, 0, 50) -- Initial top-left position
openButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
openButton.BorderSizePixel = 0
openButton.AutoButtonColor = false
openButton.Text = "ROX"
openButton.TextColor3 = Color3.fromRGB(204, 0, 255)
openButton.TextSize = 16
openButton.Font = Enum.Font.SourceSansItalic
openButton.TextStrokeTransparency = 0.8

-- Corner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = openButton

-- Stroke
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(204, 0, 255)
stroke.Thickness = 1
stroke.Transparency = 0.3
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = openButton

-- Dragging Support
local dragging = false
local dragInput, mousePos, framePos

openButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		mousePos = input.Position
		framePos = openButton.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)

openButton.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - mousePos
		openButton.Position = UDim2.new(
			framePos.X.Scale,
			framePos.X.Offset + delta.X,
			framePos.Y.Scale,
			framePos.Y.Offset + delta.Y
		)
	end
end)

-- On click action
openButton.MouseButton1Click:Connect(function()
	print("ROX Clicked")
end)
