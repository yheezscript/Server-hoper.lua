-- [[ YHEEZ HUB V34 - AUTO RELOAD ELITE ]] --
-- KHUSUS CODEX, BIAR KAGA USAH EXECUTE ULANG, BABI! 🐷🖕

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezElite") then CoreGui.YheezElite:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezElite"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
local Stroke = Instance.new("UIStroke", Frame)

-- POSISI TETEP DI KOTAK HITAM LU, ANJING! 🐶⚡
Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.4
Instance.new("UICorner", Frame)

Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(0, 255, 255) -- Warna Cyan biar keliatan pro!

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "HUNT NEXT 🌪️"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 11

-- FUNGSI PINDAH SERVER + AUTO LOAD, KONTOOOL! 🖕💥
Btn.MouseButton1Click:Connect(function()
    Btn.Text = "SCANNING... 🏹"
    
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    
    local s, res = pcall(function() return game:HttpGet(Api) end)
    
    if s then
        local data = Http:JSONDecode(res)
        for _, v in pairs(data.data) do
            if v.playing < v.maxPlayers - 5 and v.id ~= game.JobId then
                Btn.Text = "RELOADING... 🚀"
                
                -- [[ INI RAHASIANYA, BABI! 🐷👇 ]]
                -- Ganti link di bawah ini pake link RAW GitHub lu yang asli, dongo! 🤡
                local scriptLink = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/yheezscript/Server-hoper.lua/main/SAB_Hopper.lua"))()'
                
                local queue = syn and syn.queue_on_teleport or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
                if queue then
                    queue(scriptLink)
                end
                
                local success, err = pcall(function()
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                end)
                if success then return end
            end
        end
    end
    
    Btn.Text = "FAILED! 💢"
    task.wait(1)
    Btn.Text = "HUNT NEXT 🌪️"
end)

print("V34 AUTO-RELOAD LOADED! SIKAT, BABI! 🐷🖕")
