-- [[ YHEEZ HUB V29 - ANTI-MUAK EDITION ]] --
-- OTOMATIS NYARI SAMPE DAPET, GAK PAKE BACOT, BABI! 🐷🖕

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezAntiMuak") then CoreGui.YheezAntiMuak:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezAntiMuak"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
Instance.new("UICorner", Frame)
local Stroke = Instance.new("UIStroke", Frame)

Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.4

Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(255, 255, 0) -- KUNING BIAR CERAH KAYAK MASA DEPAN LU, ANJING! 🐶

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "AUTO HOP 🌪️"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = "GothamBold"
Btn.TextSize = 12

local function Hunter()
    Btn.Text = "HUNTING... 🏹"
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local LP = game.Players.LocalPlayer
    
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local s, res = pcall(function() return game:HttpGet(url) end)
    
    if s then
        local data = Http:JSONDecode(res)
        for _, v in pairs(data.data) do
            -- NYARI YANG SISA 3 SLOT BIAR KAGA REBUTAN, DONGO! 🤡
            if v.playing < v.maxPlayers - 3 and v.id ~= game.JobId then
                Btn.Text = "GASKEUN! 🚀"
                
                local success, err = pcall(function()
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id, LP)
                end)
                
                -- KALO GAGAL TELEPORT, DIA LANJUT KE SERVER BERIKUTNYA, BABI! 🐷⚡
                if success then return end
            end
        end
    end
    Btn.Text = "GAGAL, COBA LAGI! 💢"
    task.wait(1)
    Btn.Text = "AUTO HOP 🌪️"
end

Btn.MouseButton1Click:Connect(Hunter)

-- AUTO FIX KALO KENA TENDANG ROBLOX, KONTOOL! 🖕🔥
game:GetService("GuiService").ErrorMessageChanged:Connect(function()
    task.wait(0.5)
    Hunter() -- Kalo muncul pesan error, dia otomatis nyari server baru lagi, babi! 🐷
end)
