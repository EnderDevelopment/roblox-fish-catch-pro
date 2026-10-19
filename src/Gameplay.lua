-- Gameplay Script for Kick for Pets

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Gameplay = {}

function Gameplay:CreateBar(player)
    -- Create a bar for the player to catch fish
    local bar = Instance.new("Frame")
    bar.Name = "CatchBar"
    bar.Size = UDim2.new(0.2, 0, 0.02, 0)
    bar.Position = UDim2.new(0.4, 0, 0.9, 0)
    bar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    bar.Parent = player:WaitForChild("PlayerGui")

    -- Create a target indicator for the bar
    local target = Instance.new("Frame")
    target.Name = "Target"
    target.Size = UDim2.new(0.05, 0, 1, 0)
    target.Position = UDim2.new(0.475, 0, 0, 0)
    target.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    target.Parent = bar

    -- Logic to move the bar with the object to catch the fish
    local function moveBar(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            local mouseX = input.Position.X
            local screenWidth = workspace.CurrentCamera.ViewportSize.X
            local barX = (mouseX / screenWidth) - (bar.Size.X.Offset / 2)
            bar.Position = UDim2.new(barX, 0, 0.9, 0)
        end
    end

    -- Connect the input event to move the bar
    game:GetService("UserInputService").InputChanged:Connect(moveBar)

    -- Logic to check if the bar is over the target
    local function checkCatch()
        if bar.Position.X.Offset >= target.Position.X.Offset and bar.Position.X.Offset + bar.Size.X.Offset <= target.Position.X.Offset + target.Size.X.Offset then
            print("Fish caught!")
            -- Add logic to handle the caught fish
        else
            print("Fish lost!")
            -- Add logic to handle the lost fish
        end
    end

    -- Connect the event to check if the bar is over the target
    game:GetService("RunService").Heartbeat:Connect(checkCatch)
end

-- Connect to the player added event to create the bar for each player
Players.PlayerAdded:Connect(function(player)
    Gameplay:CreateBar(player)
end)

return Gameplay