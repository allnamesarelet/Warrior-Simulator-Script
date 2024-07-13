local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local AutoRebirth = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Exit = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local AutoGrind = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local AutoPoints = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0708898976, 0, 0.0989795923, 0)
Frame.Size = UDim2.new(0, 463, 0, 416)

UICorner.Parent = Frame

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 200, 0, 50)
Title.Font = Enum.Font.Unknown
Title.Text = "Warrior Simulator"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

AutoRebirth.Name = "AutoRebirth"
AutoRebirth.Parent = Frame
AutoRebirth.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
AutoRebirth.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutoRebirth.BorderSizePixel = 0
AutoRebirth.Position = UDim2.new(0, 0, 0.331730783, 0)
AutoRebirth.Size = UDim2.new(0, 200, 0, 50)
AutoRebirth.Font = Enum.Font.Unknown
AutoRebirth.Text = "Auto Rebirth"
AutoRebirth.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoRebirth.TextScaled = true
AutoRebirth.TextSize = 14.000
AutoRebirth.TextWrapped = true

UICorner_2.Parent = AutoRebirth

Exit.Name = "Exit"
Exit.Parent = Frame
Exit.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
Exit.BorderSizePixel = 0
Exit.Position = UDim2.new(0.872570217, 0, 0, 0)
Exit.Size = UDim2.new(0, 58, 0, 40)
Exit.Font = Enum.Font.Unknown
Exit.Text = "X"
Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
Exit.TextScaled = true
Exit.TextSize = 14.000
Exit.TextWrapped = true

UICorner_3.Parent = Exit

AutoGrind.Name = "Auto Grind"
AutoGrind.Parent = Frame
AutoGrind.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
AutoGrind.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutoGrind.BorderSizePixel = 0
AutoGrind.Position = UDim2.new(0, 0, 0.538461566, 0)
AutoGrind.Size = UDim2.new(0, 200, 0, 50)
AutoGrind.Font = Enum.Font.Unknown
AutoGrind.Text = "Auto Grind"
AutoGrind.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoGrind.TextScaled = true
AutoGrind.TextSize = 14.000
AutoGrind.TextWrapped = true

UICorner_4.Parent = AutoGrind

AutoPoints.Name = "AutoPoints"
AutoPoints.Parent = Frame
AutoPoints.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
AutoPoints.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutoPoints.BorderSizePixel = 0
AutoPoints.Position = UDim2.new(0, 0, 0.774038434, 0)
AutoPoints.Size = UDim2.new(0, 200, 0, 50)
AutoPoints.Font = Enum.Font.Unknown
AutoPoints.Text = "Auto Points"
AutoPoints.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoPoints.TextScaled = true
AutoPoints.TextSize = 14.000
AutoPoints.TextWrapped = true

UICorner_5.Parent = AutoPoints

-- Scripts:

local function CJBS_fake_script() -- ScreenGui.Core 
	local script = Instance.new('LocalScript', ScreenGui)

	local tweenService = game:GetService("TweenService")
	
	local player = game.Players.LocalPlayer
	
	local screenGui = script.Parent
	local frame = screenGui.Frame
	local exitButton = frame.Exit
	local AutoRebirth = frame.AutoRebirth
	local autoGrindButton = frame["Auto Grind"]
	local autoPointsButton = frame.AutoPoints
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	
	frame.Active = true
	frame.Archivable = true
	frame.Draggable = true
	
	local autoRebirthEnabled = false
	local autoPointsEnabled = false
	local AutoGrindEnabled = false
	
	exitButton.MouseButton1Down:Connect(function()
		screenGui:Destroy()
	end)
	
	
	AutoRebirth.MouseButton1Down:Connect(function()
		autoRebirthEnabled = not autoRebirthEnabled
		
		repeat
			local a = game:GetService("Players").LocalPlayer.PlayerGui.Main.HomePage.Left.Button.Rebirth.Process
				
			if string.len(a.Text) == 4 and game:GetService("Players").LocalPlayer.leaderstats["\240\159\151\161\239\184\143 Level"].Value >= 5 * tonumber(game:GetService("Players").LocalPlayer.PlayerGui.Main.Func.Rebirth.Frame.Main.CurrentRebirth.Text) then 
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Profile"):WaitForChild("RebirthRequest"):InvokeServer()
				print("ran remote")
			end
			
			task.wait(.5)
		until autoRebirthEnabled == false
	end)
	
	local debounce = false
	local attackCooldown = 0.1 
	
	local function waitForBattle()
		while not workspace:FindFirstChild("Battle") or not workspace.Battle:FindFirstChild("1") do
			task.wait()
		end
	end
	
	autoGrindButton.MouseButton1Down:Connect(function()
		AutoGrindEnabled = not AutoGrindEnabled
	
		repeat
			local args = {
				[1] = 1
			}
	
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Match"):WaitForChild("Join"):InvokeServer(unpack(args))
	
			-- Wait for 8 seconds (8 iterations, 1 second each)
			for i = 1, 8 do
				if not AutoGrindEnabled then
					break
				end
				wait(1)
			end
	
			-- Simulate mouse clicks 100 times, waiting 1 second between each click
			for i = 1, 100 do
				if not AutoGrindEnabled then
					break
				end
				mouse1click()
				wait(1)
			end
		until not AutoGrindEnabled
	end)
	
	
	autoPointsButton.MouseButton1Down:Connect(function()
		autoPointsEnabled = not autoPointsEnabled
	
		repeat
			local args = {
				[1] = "Speed", -- or "Speed", "Defense", "Luck"
				[2] = 1
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Profile"):WaitForChild("AddPoint"):FireServer(unpack(args))
			
			local args2 = {
				[1] = "Damage", -- or "Speed", "Defense", "Luck"
				[2] = 1
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Profile"):WaitForChild("AddPoint"):FireServer(unpack(args))
			
			local args3 = {
				[1] = "Defense", -- or "Speed", "Defense", "Luck"
				[2] = 1
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Profile"):WaitForChild("AddPoint"):FireServer(unpack(args))
			
			local args4 = {
				[1] = "Luck", -- or "Speed", "Defense", "Luck"
				[2] = 1
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Profile"):WaitForChild("AddPoint"):FireServer(unpack(args))	
			task.wait(3)
		until autoPointsEnabled == false
	end)
end
coroutine.wrap(CJBS_fake_script)()
