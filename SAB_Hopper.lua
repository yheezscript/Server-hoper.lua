-- [[ YHEEZ HUB V26 - CUSTOM POSITION ]] --
-- POSISI DI KOTAK HITAM BIAR KAGA KETUTUP DELTA, BABI! 🐷🖕

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezCustom") then CoreGui.YheezCustom:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezCustom"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
local Corner = Instance.new("UICorner", Frame)
local Stroke = Instance.new("UIStroke", Frame)

-- SETTING POSISI DI KOTAK HITAM (TOP LEFT BAWAH MENU), KONTOOL! 🖕🔥
Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 0, 0.22, 0) -- DISINI POSISINYA, ANJING! 🐶👇
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.4
Frame.Active = true
Frame.Draggable = true -- TETEP BISA LU GESER KALO KURANG PAS, DONGO! 🤡

Stroke.Thickness = 1.5
Stroke.Color = Color3.fromRGB(0, 255, 150)

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "FAST HOP 🌪️"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 12

Btn.MouseButton1Click:Connect(function()
    Btn.Text = "HUNTING... 🏹"
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local LP = game.Players.LocalPlayer
    local Cursor = ""
    
    for i = 1, 5 do
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. Cursor
        local s, res = pcall(function() return game:HttpGet(url) end)
        
        if s then
            local data = Http:JSONDecode(res)
            if data and data.data then
                for _, v in pairs(data.data) do
                    if v.playing < v.maxPlayers - 1 and v.id ~= game.JobId then
                        Btn.Text = "FOUND! 🚀"
                        TPS:TeleportToPlaceInstance(game.PlaceId, v.id, LP)
                        return
                    end
                end
                Cursor = data.nextPageCursor or ""
                if Cursor == "" then break end
            end
        end
        task.wait(0.1)
    end
    Btn.Text = "ALL FULL! 💢"
    task.wait(1)
    Btn.Text = "FAST HOP 🌪️"
end)

print("V26 CUSTOM POSITION LOADED! SIKAT, BABI! 🐷🖕")
