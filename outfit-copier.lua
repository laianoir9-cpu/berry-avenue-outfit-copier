-- Berry Avenue Outfit Copier with Mobile UI
-- Loadstring: loadstring(game:HttpGet("https://raw.githubusercontent.com/laianoir9-cpu/berry-avenue-outfit-copier/main/outfit-copier.lua"))()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local UserGui = LocalPlayer:WaitForChild("PlayerGui")

-- Configuration
local GUI_WIDTH = 350
local GUI_HEIGHT = 400
local DRAG_SENSITIVITY = 1.5

-- Create Main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OutfitCopierGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndex = 999
screenGui.Parent = UserGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, GUI_WIDTH, 0, GUI_HEIGHT)
mainFrame.Position = UDim2.new(0.5, -GUI_WIDTH/2, 0.5, -GUI_HEIGHT/2)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Add corner radius
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

-- Title Text
local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(0.7, 0, 1, 0)
titleText.BackgroundTransparency = 1
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 18
titleText.Font = Enum.Font.GothamBold
titleText.Text = "Outfit Copier"
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Copy Button (Top Right)
local copyButton = Instance.new("TextButton")
copyButton.Name = "CopyButton"
copyButton.Size = UDim2.new(0, 70, 0, 40)
copyButton.Position = UDim2.new(1, -80, 0.5, -20)
copyButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.TextSize = 12
copyButton.Font = Enum.Font.GothamBold
copyButton.Text = "COPY"
copyButton.BorderSizePixel = 0
copyButton.Parent = titleBar

local copyButtonCorner = Instance.new("UICorner")
copyButtonCorner.CornerRadius = UDim.new(0, 8)
copyButtonCorner.Parent = copyButton

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 35, 0, 35)
closeButton.Position = UDim2.new(1, -40, 0, 7.5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 16
closeButton.Font = Enum.Font.GothamBold
closeButton.Text = "X"
closeButton.BorderSizePixel = 0
closeButton.Parent = titleBar

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 6)
closeButtonCorner.Parent = closeButton

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, 0, 1, -50)
contentFrame.Position = UDim2.new(0, 0, 0, 50)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- Player Input Label
local inputLabel = Instance.new("TextLabel")
inputLabel.Name = "InputLabel"
inputLabel.Size = UDim2.new(1, -20, 0, 30)
inputLabel.Position = UDim2.new(0, 10, 0, 15)
inputLabel.BackgroundTransparency = 1
inputLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
inputLabel.TextSize = 12
inputLabel.Font = Enum.Font.Gotham
inputLabel.Text = "Enter Player Name:"
inputLabel.TextXAlignment = Enum.TextXAlignment.Left
inputLabel.Parent = contentFrame

-- Player Name Input Box
local inputBox = Instance.new("TextBox")
inputBox.Name = "InputBox"
inputBox.Size = UDim2.new(1, -20, 0, 40)
inputBox.Position = UDim2.new(0, 10, 0, 45)
inputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.TextSize = 14
inputBox.Font = Enum.Font.Gotham
inputBox.Text = ""
inputBox.PlaceholderText = "e.g., Beth_123"
inputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
inputBox.BorderSizePixel = 0
inputBox.Parent = contentFrame

local inputBoxCorner = Instance.new("UICorner")
inputBoxCorner.CornerRadius = UDim.new(0, 8)
inputBoxCorner.Parent = inputBox

-- Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, -20, 0, 60)
statusLabel.Position = UDim2.new(0, 10, 0, 95)
statusLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 11
statusLabel.Font = Enum.Font.Gotham
statusLabel.Text = "Ready to copy outfits.\nType a player name and press COPY."
statusLabel.TextWrapped = true
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.TextYAlignment = Enum.TextYAlignment.Top
statusLabel.BorderSizePixel = 0
statusLabel.Parent = contentFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 8)
statusCorner.Parent = statusLabel

-- Info Label
local infoLabel = Instance.new("TextLabel")
infoLabel.Name = "InfoLabel"
infoLabel.Size = UDim2.new(1, -20, 0, 80)
infoLabel.Position = UDim2.new(0, 10, 0, 165)
infoLabel.BackgroundColor3 = Color3.fromRGB(35, 50, 35)
infoLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
infoLabel.TextSize = 10
infoLabel.Font = Enum.Font.Gotham
infoLabel.Text = "📋 Features:\n• Copy full avatar appearance\n• Works with offline players\n• Mobile friendly & draggable\n• Copies all accessories, clothing & body colors"
infoLabel.TextWrapped = true
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.TextYAlignment = Enum.TextYAlignment.Top
infoLabel.BorderSizePixel = 0
infoLabel.Parent = contentFrame

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 8)
infoCorner.Parent = infoLabel

-- Dragging Functionality
local dragging = false
local dragStart
local frameStart

titleBar.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        frameStart = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input, gameProcessed)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = frameStart + UDim2.new(0, delta.X * DRAG_SENSITIVITY, 0, delta.Y * DRAG_SENSITIVITY)
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Close Button Function
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Outfit Copying Functions
local function getCharacterAppearance(character)
    if not character then return nil end
    
    local appearance = {}
    
    -- Get all accessories
    appearance.Accessories = {}
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Accessory") then
            table.insert(appearance.Accessories, {
                Name = item.Name,
                Handle = item:FindFirstChild("Handle")
            })
        end
    end
    
    -- Get Shirt
    local shirt = character:FindFirstChildOfClass("Shirt")
    if shirt then
        appearance.Shirt = shirt.ShirtTemplate
    end
    
    -- Get Pants
    local pants = character:FindFirstChildOfClass("Pants")
    if pants then
        appearance.Pants = pants.PantsTemplate
    end
    
    -- Get BodyColors
    local bodyColors = character:FindFirstChildOfClass("BodyColors")
    if bodyColors then
        appearance.BodyColors = {
            HeadColor3 = bodyColors.HeadColor3,
            TorsoColor3 = bodyColors.TorsoColor3,
            LeftArmColor3 = bodyColors.LeftArmColor3,
            RightArmColor3 = bodyColors.RightArmColor3,
            LeftLegColor3 = bodyColors.LeftLegColor3,
            RightLegColor3 = bodyColors.RightLegColor3
        }
    end
    
    -- Get Character Description (for offline player copying)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid and humanoid:FindFirstChild("BodyDepthScale") then
        appearance.Description = character:FindFirstChild("Humanoid"):GetState()
    end
    
    return appearance
end

local function applyAppearance(targetCharacter, appearance)
    if not targetCharacter or not appearance then
        return false
    end
    
    -- Remove old clothing
    for _, item in pairs(targetCharacter:GetChildren()) do
        if item:IsA("Accessory") or item:IsA("Shirt") or item:IsA("Pants") or item:IsA("BodyColors") then
            item:Destroy()
        end
    end
    
    -- Apply accessories
    if appearance.Accessories then
        for _, accessoryData in pairs(appearance.Accessories) do
            pcall(function()
                local accessory = Instance.new("Accessory")
                accessory.Name = accessoryData.Name
                local handle = Instance.new("Part")
                handle.Name = "Handle"
                handle.Parent = accessory
                accessory.Parent = targetCharacter
            end)
        end
    end
    
    -- Apply Shirt
    if appearance.Shirt then
        pcall(function()
            local shirt = Instance.new("Shirt")
            shirt.ShirtTemplate = appearance.Shirt
            shirt.Parent = targetCharacter
        end)
    end
    
    -- Apply Pants
    if appearance.Pants then
        pcall(function()
            local pants = Instance.new("Pants")
            pants.PantsTemplate = appearance.Pants
            pants.Parent = targetCharacter
        end)
    end
    
    -- Apply BodyColors
    if appearance.BodyColors then
        pcall(function()
            local bodyColors = Instance.new("BodyColors")
            bodyColors.HeadColor3 = appearance.BodyColors.HeadColor3
            bodyColors.TorsoColor3 = appearance.BodyColors.TorsoColor3
            bodyColors.LeftArmColor3 = appearance.BodyColors.LeftArmColor3
            bodyColors.RightArmColor3 = appearance.BodyColors.RightArmColor3
            bodyColors.LeftLegColor3 = appearance.BodyColors.LeftLegColor3
            bodyColors.RightLegColor3 = appearance.BodyColors.RightLegColor3
            bodyColors.Parent = targetCharacter
        end)
    end
    
    return true
end

local function copyOutfitFromPlayer(playerName)
    local targetPlayer = Players:FindFirstChild(playerName)
    
    if targetPlayer and targetPlayer.Character then
        -- Player is online
        local appearance = getCharacterAppearance(targetPlayer.Character)
        if appearance and LocalPlayer.Character then
            applyAppearance(LocalPlayer.Character, appearance)
            statusLabel.Text = "✅ Successfully copied outfit from " .. playerName .. "!"
            statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            return true
        end
    else
        -- Try to fetch offline player's appearance via API
        statusLabel.Text = "⏳ Fetching " .. playerName .. "'s appearance..."
        statusLabel.TextColor3 = Color3.fromRGB(255, 255, 100)
        
        pcall(function()
            local userId = Players:GetUserIdFromNameAsync(playerName)
            local charAppearance = Players:GetCharacterAppearanceAsync(userId)
            
            if charAppearance and LocalPlayer.Character then
                -- Clone the appearance
                for _, item in pairs(charAppearance:GetChildren()) do
                    local clone = item:Clone()
                    clone.Parent = LocalPlayer.Character
                end
                
                statusLabel.Text = "✅ Successfully copied outfit from " .. playerName .. " (Offline)!"
                statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
                return true
            end
        end)
        
        if statusLabel.TextColor3 ~= Color3.fromRGB(100, 255, 100) then
            statusLabel.Text = "❌ Could not find player: " .. playerName
            statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            return false
        end
    end
    
    return false
end

-- Copy Button Functionality
copyButton.MouseButton1Click:Connect(function()
    local playerName = inputBox.Text:gsub(" ", "")
    
    if playerName == "" then
        statusLabel.Text = "❌ Please enter a player name!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    if not LocalPlayer.Character then
        statusLabel.Text = "❌ Your character doesn't exist!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    copyOutfitFromPlayer(playerName)
end)

-- Allow Enter key to copy
inputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        copyButton:FireSignal(copyButton.MouseButton1Click)
    end
end)

statusLabel.Text = "✅ Outfit Copier loaded! Ready to copy."
statusLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
