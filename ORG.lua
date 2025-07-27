local player = game.Players.LocalPlayer

-- Remove previous instance
local oldGui = player:FindFirstChild("PlayerGui"):FindFirstChild("ORG_UI")
if oldGui then oldGui:Destroy() end

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "ORG_UI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ORG Button (movable)
local openButton = Instance.new("TextButton")
openButton.Name = "OpenORG"
openButton.Parent = gui
openButton.Size = UDim2.new(0, 40, 0, 40)
openButton.Position = UDim2.new(0, 10, 0, 50)
openButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
openButton.BorderSizePixel = 0
openButton.AutoButtonColor = false
openButton.Text = "ORG"
openButton.TextColor3 = Color3.fromRGB(255, 0, 0)
openButton.TextSize = 16
openButton.Font = Enum.Font.SourceSansItalic
openButton.TextStrokeTransparency = 0.8

local corner = Instance.new("UICorner", openButton)
corner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", openButton)
stroke.Color = Color3.fromRGB(204, 0, 255)
stroke.Thickness = 1
stroke.Transparency = 0.3
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Dragging support for openButton
local dragging = false
local dragInput, mousePos, framePos

openButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		mousePos = input.Position
		framePos = openButton.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
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

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.Visible = false
mainFrame.Parent = gui

local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 8)

local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(192, 192, 192) -- silver light color
mainStroke.Thickness = 1
mainStroke.Transparency = 0.6
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Add tiny white dots as starry background
for i = 1, 80 do
	local dot = Instance.new("Frame")
	dot.Size = UDim2.new(0, 2, 0, 2)
	dot.Position = UDim2.new(math.random(), 0, math.random(), 0)
	dot.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
	dot.BorderSizePixel = 0
	dot.BackgroundTransparency = 0.7
	dot.Parent = mainFrame
end

-- Draggable main frame
mainFrame.Active = true
mainFrame.Draggable = true

-- Close Button (X)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 22, 0, 22)
closeButton.Position = UDim2.new(1, -28, 0, 6)
closeButton.BackgroundTransparency = 1 -- transparent background
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- white X
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 16
closeButton.Parent = mainFrame

local closeStroke = Instance.new("UIStroke", closeButton)
closeStroke.Color = Color3.fromRGB(255, 255, 255) -- white border
closeStroke.Thickness = 1
closeStroke.Transparency = 0
closeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Label: Made by Developer RAGNAROK (top left corner of mainFrame)
local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(0, 200, 0, 15)
creditLabel.Position = UDim2.new(0, 5, 0, 3)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "Made by Developer RAGNAROK"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.Font = Enum.Font.SourceSansItalic
creditLabel.TextSize = 11
creditLabel.TextXAlignment = Enum.TextXAlignment.Left
creditLabel.Parent = mainFrame

-- Confirmation Frame (gray background)
local confirmFrame = Instance.new("Frame")
confirmFrame.Size = UDim2.new(0, 240, 0, 100)
confirmFrame.Position = UDim2.new(0.5, -120, 0.5, -50)
confirmFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80) -- gray color
confirmFrame.Visible = false
confirmFrame.Parent = gui

local confirmCorner = Instance.new("UICorner", confirmFrame)
confirmCorner.CornerRadius = UDim.new(0, 10)

local confirmLabel = Instance.new("TextLabel")
confirmLabel.Size = UDim2.new(1, -20, 0, 40)
confirmLabel.Position = UDim2.new(0, 10, 0, 10)
confirmLabel.BackgroundTransparency = 1
confirmLabel.Text = "Are you sure you want to close ORG?"
confirmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmLabel.Font = Enum.Font.SourceSansBold
confirmLabel.TextSize = 16
confirmLabel.TextStrokeTransparency = 0.3
confirmLabel.Parent = confirmFrame

-- Buttons container (black rectangle)
local buttonsContainer = Instance.new("Frame")
buttonsContainer.Size = UDim2.new(1, -20, 0, 35)
buttonsContainer.Position = UDim2.new(0, 10, 1, -45)
buttonsContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
buttonsContainer.Parent = confirmFrame

local yesButton = Instance.new("TextButton")
yesButton.Size = UDim2.new(0, 100, 1, 0)
yesButton.Position = UDim2.new(0, 0, 0, 0)
yesButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
yesButton.Text = "Yes"
yesButton.TextColor3 = Color3.fromRGB(0, 0, 0)
yesButton.Font = Enum.Font.SourceSansBold
yesButton.TextSize = 14
yesButton.Parent = buttonsContainer

local cancelButton = Instance.new("TextButton")
cancelButton.Size = UDim2.new(0, 100, 1, 0)
cancelButton.Position = UDim2.new(1, -100, 0, 0)
cancelButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
cancelButton.Text = "Cancel"
cancelButton.TextColor3 = Color3.fromRGB(0, 0, 0)
cancelButton.Font = Enum.Font.SourceSansBold
cancelButton.TextSize = 14
cancelButton.Parent = buttonsContainer

-- Toggle Visibility
local isOpen = false
openButton.MouseButton1Click:Connect(function()
	isOpen = not isOpen
	mainFrame.Visible = isOpen
end)

-- Close Button Logic
closeButton.MouseButton1Click:Connect(function()
	confirmFrame.Visible = true
end)

yesButton.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

cancelButton.MouseButton1Click:Connect(function()
	confirmFrame.Visible = false
end)
