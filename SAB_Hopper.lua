-- [[ YHEEZ HUB V36 - SILENT ASSASSIN ]] --
-- LANGSUNG PINDAH TANPA BACOT, ANJING! 🐶🖕

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezSilent") then CoreGui.YheezSilent:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezSilent"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)

Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.5
Instance.new("UICorner", Frame)

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "INSTANT HOP 🌪️"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = "GothamBold"
Btn.TextSize = 12

-- KERAHAN TENAGA PALING DALEM, BABI! 🐷👇
Btn.MouseButton1Click:Connect(function()
    Btn.Text = "BYPASSING... 🚀"
    
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    
    -- INI TRIKNYA: KITA CARI DARI SERVER PALING SEPI (ASCENDING), BABI! 🐷
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=50"
    
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success then
        local data = Http:JSONDecode(result)
        for _, server in pairs(data.data) do
            -- NYARI SERVER YANG ORANGNYA DI BAWAH 5 BIAR PASTI MASUK, DONGO! 🤡
            if server.playing < 5 and server.id ~= game.JobId then
                
                -- AUTO RELOAD BIAR KAGA RIBET
                if queue_on_teleport then
                    queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/yheezscript/Server-hoper.lua/main/SAB_Hopper.lua"))()')
                end
                
                -- LANGSUNG TEMBAK!
                TPS:TeleportToPlaceInstance(game.PlaceId, server.id, game.Players.LocalPlayer)
                return
            end
        end
    end
    
    Btn.Text = "RETRYING... 🔄"
    task.wait(0.5)
    Btn.Text = "INSTANT HOP 🌪️"
end)
