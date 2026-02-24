-- [[ YHEEZ HUB V25 - SERVER HUNTER ]] --
-- MINIMALIST UI, MAXIMALIST FEATURES, BABI! 🐷⚡

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezGod") then CoreGui.YheezGod:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezGod"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
local Corner = Instance.new("UICorner", Frame)

-- MODEL MINIMALIS BIAR KAGA NGABISIN LAYAR, KONTOOL! 🖕
Frame.Size = UDim2.new(0, 120, 0, 40)
Frame.Position = UDim2.new(0.5, -60, 0.05, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.3
Frame.Active = true
Frame.Draggable = true

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "HOP (SEPI) 🌪️"
Btn.TextColor3 = Color3.fromRGB(0, 255, 150) -- Ijo biar adem kayak duit, babi! 🐷
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 13

Btn.MouseButton1Click:Connect(function()
    Btn.Text = "HUNTING... 🏹"
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local LP = game.Players.LocalPlayer
    local Cursor = ""
    
    -- LOOPING 5 HALAMAN = 500 SERVER SCANNED, BABI! 🐷🔥
    for i = 1, 5 do
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. Cursor
        local s, res = pcall(function() return game:HttpGet(url) end)
        
        if s then
            local data = Http:JSONDecode(res)
            if data and data.data then
                for _, v in pairs(data.data) do
                    -- NYARI SERVER YANG ISINYA DIKIT (DI BAWAH MAX), BUKAN SERVER LU SEKARANG!
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
    Btn.Text = "HOP (SEPI) 🌪️"
end)

print("V25 SERVER HUNTER LOADED! SIKAT, BABI! 🐷🖕")
