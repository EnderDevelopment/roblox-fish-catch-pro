-- Main Menu Script for Kick for Pets

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MainMenu = {}

function MainMenu:CreateMenu(player)
    -- Create a screen GUI for the main menu
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MainMenu"
    screenGui.Parent = player:WaitForChild("PlayerGui")

    -- Create a frame for the main menu
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.5, 0)
    frame.Position = UDim2.new(0.25, 0, 0.25, 0)
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.Parent = screenGui

    -- Create a title label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Text = "Kick for Pets"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextScaled = true
    titleLabel.Parent = frame

    -- Create a play button
    local playButton = Instance.new("TextButton")
    playButton.Size = UDim2.new(0.5, 0, 0.2, 0)
    playButton.Position = UDim2.new(0.25, 0, 0.3, 0)
    playButton.Text = "Play"
    playButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    playButton.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    playButton.Parent = frame

    -- Create a settings button
    local settingsButton = Instance.new("TextButton")
    settingsButton.Size = UDim2.new(0.5, 0, 0.2, 0)
    settingsButton.Position = UDim2.new(0.25, 0, 0.55, 0)
    settingsButton.Text = "Settings"
    settingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    settingsButton.BackgroundColor3 = Color3.fromRGB(0, 0, 100)
    settingsButton.Parent = frame

    -- Create a quit button
    local quitButton = Instance.new("TextButton")
    quitButton.Size = UDim2.new(0.5, 0, 0.2, 0)
    quitButton.Position = UDim2.new(0.25, 0, 0.8, 0)
    quitButton.Text = "Quit"
    quitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    quitButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    quitButton.Parent = frame

    -- Connect the play button to start the game
    playButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        self:StartGame(player)
    end)

    -- Connect the settings button to open settings
    settingsButton.MouseButton1Click:Connect(function()
        self:OpenSettings(player)
    end)

    -- Connect the quit button to quit the game
    quitButton.MouseButton1Click:Connect(function()
        player:Kick("Quit the game")
    end)
end

function MainMenu:StartGame(player)
    -- Logic to start the game
    print("Game started for " .. player.Name)
end

function MainMenu:OpenSettings(player)
    -- Logic to open settings
    print("Settings opened for " .. player.Name)
end

-- Connect to the player added event to create the main menu for each player
Players.PlayerAdded:Connect(function(player)
    MainMenu:CreateMenu(player)
end)

return MainMenu