local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "ROX_UI"
gui.Parent = player:WaitForChild("PlayerGui")

-- زر ROX
local openButton = Instance.new("TextButton")
openButton.Name = "OpenROX"
openButton.Parent = gui
openButton.Size = UDim2.new(0, 70, 0, 35)
openButton.Position = UDim2.new(0, 10, 0.5, -20)
openButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- أسود
openButton.BorderSizePixel = 0
openButton.AutoButtonColor = false
openButton.Text = "ROX"
openButton.TextColor3 = Color3.fromRGB(170, 0, 255) -- بنفسجي
openButton.TextSize = 18
openButton.Font = Enum.Font.GothamBold
openButton.TextStrokeTransparency = 0.5

-- تأثير ناري وهمي (Glow أحمر خارجي)
local glow = Instance.new("UIStroke")
glow.Thickness = 2
glow.Color = Color3.fromRGB(255, 0, 0) -- أحمر ناري
glow.Transparency = 0.2
glow.Parent = openButton

-- ظل خلفي لتقوية الإحساس بالنيران
local shadow = Instance.new("UIGradient")
shadow.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
})
shadow.Parent = glow

-- حدث الضغط
openButton.MouseButton1Click:Connect(function()
	print("ROX Menu Opened (تابع قريبًا...)")
end)