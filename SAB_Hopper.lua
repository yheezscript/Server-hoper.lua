-- [[ YHEEZ HUB V32 - DARK ELITE ]] --
-- TAMPILAN BERSIH, KAGA ALAY, KONTOL! 🖕🔥

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezElite") then CoreGui.YheezElite:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezElite"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
local Stroke = Instance.new("UIStroke", Frame)

-- POSISI TETEP DI KOTAK HITAM LU, BABI! 🐷⚡
Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Hitam pekat biar sangar!
Frame.BackgroundTransparency = 0.2
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)

Stroke.Thickness = 1.5
Stroke.Color = Color3.fromRGB(0, 255, 150) -- Ijo Neon biar keliatan mahal!

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "HUNT NEW 🌪️" -- TULISAN ELIT, KAGA ALAY! 🖕
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 12

local function StartHop()
    Btn.Text = "SCANNING... 🏹" -- Biar keliatan lagi nyari mangsa, dongo! 🤡
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local s, res = pcall(function() return game:HttpGet(url) end)
    
    if s then
        local data = Http:JSONDecode(res)
        for _, v in pairs(data.data) do
            -- NYARI SERVER YANG MASIH ADA SLOT (SISA 3), BABI! 🐷
            if v.playing < v.maxPlayers - 3 and v.id ~= game.JobId then
                Btn.Text = "TELEPORTING..."
                pcall(function()
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                end)
                return
            end
        end
    end
    Btn.Text = "FAILED! 💢"
    task.wait(1)
    Btn.Text = "HUNT NEW 🌪️"
end

Btn.MouseButton1Click:Connect(StartHop)

-- AUTO-RETRY KALO ERROR, BIAR LU KAGA MUAK LAGI, ANJING! 🐶🔥
game:GetService("GuiService").ErrorMessageChanged:Connect(function()
    task.wait(2)
    StartHop()
end)
