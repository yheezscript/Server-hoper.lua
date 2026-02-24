-- [[ YHEEZ HUB V26 REVISI - KIRI ATAS NYAWA ]] --
-- POSISI FIX DI KOTAK HITAM LU, ANJING! 🐶🖕

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezCustom") then CoreGui.YheezCustom:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezCustom"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
local Corner = Instance.new("UICorner", Frame)
local Stroke = Instance.new("UIStroke", Frame)

-- POSISI FIX DI KIRI ATAS (KOTAK HITAM), BABI! 🐷⚡
Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0) -- GESER DIKIT BIAR PAS DI KOTAK HITAM LU!
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.4
Frame.Active = true
Frame.Draggable = true 

Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(0, 255, 150)

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "FAST HOP 🌪️"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 12

-- FUNGSINYA TETEP GACOR, BABI! 🐷🚀
Btn.MouseButton1Click:Connect(function()
    Btn.Text = "HUNTING... 🏹"
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    
    local s, res = pcall(function() return game:HttpGet(Api) end)
    if s then
        local data = Http:JSONDecode(res)
        for _, v in pairs(data.data) do
            if v.playing < v.maxPlayers - 1 and v.id ~= game.JobId then
                TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                return
            end
        end
    end
    Btn.Text = "FULL! 💢"
    task.wait(1)
    Btn.Text = "FAST HOP 🌪️"
end)
