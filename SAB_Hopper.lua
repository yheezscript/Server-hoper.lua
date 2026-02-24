-- [[ YHEEZ HUB V30 - SMOOTH AUTO HOP ]] --
-- BIAR LU KAGA PANIK PAS LAYAR ITEM, BABI! 🐷🖕

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezV30") then CoreGui.YheezV30:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezV30"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
local Corner = Instance.new("UICorner", Frame)

Frame.Size = UDim2.new(0, 140, 0, 40)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0) -- TETEP DI KOTAK HITAM LU, ANJING! 🐶
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BackgroundTransparency = 0.3
Corner.CornerRadius = UDim.new(0, 8)

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "AUTO HOP: ON 🌪️"
Btn.TextColor3 = Color3.fromRGB(0, 255, 255)
Btn.Font = "GothamBold"
Btn.TextSize = 12

local function Hunter()
    Btn.Text = "LAGI PINDAH, SABAR! ⏳"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    
    local s, res = pcall(function() return game:HttpGet(Api) end)
    if s then
        local data = Http:JSONDecode(res)
        for _, v in pairs(data.data) do
            if v.playing < v.maxPlayers - 3 and v.id ~= game.JobId then
                -- BIAR KAGA KAGET PAS ITEM, GUE KASIH NOTIF!
                print("GASKEUN KE SERVER: " .. v.id)
                local success = pcall(function()
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                end)
                if success then return end
            end
        end
    end
    Btn.Text = "CARI ULANG... 🔄"
    task.wait(2)
    Hunter() -- Loop terus sampe mampus dapet server, babi! 🐷
end

Btn.MouseButton1Click:Connect(Hunter)

-- SENSOR ERROR BIAR KAGA BERHENTI, KONTOOL! 🖕🔥
game:GetService("GuiService").ErrorMessageChanged:Connect(function()
    task.wait(1)
    Hunter()
end)
