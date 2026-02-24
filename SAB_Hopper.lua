-- [[ YHEEZ HUB V35 - GOD MODE BRUTE FORCE ]] --
-- KAGA ADA KATA GAGAL, CUMA ADA KATA GAS, ANJING! 🐶🖕

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezGodMode") then CoreGui.YheezGodMode:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezGodMode"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
local Stroke = Instance.new("UIStroke", Frame)

Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.2
Instance.new("UICorner", Frame)

Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(255, 0, 0) -- MERAH DARAH, BIAR KERAS! 🖕

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "BRUTE FORCE HOP 🌪️"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 10

-- INI KERAHAN TENAGA GUE, BABI! 🐷⚡
Btn.MouseButton1Click:Connect(function()
    Btn.Text = "PENETRATING... 😈"
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    
    -- AMBIL DATA SERVER PALING SEPI (ASCENDING), DONGO! 🤡
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local s, res = pcall(function() return game:HttpGet(url) end)
    
    if s then
        local data = Http:JSONDecode(res)
        for _, v in pairs(data.data) do
            -- NYARI YANG ISINYA DI BAWAH 10 ORANG BIAR PASTI MASUK, KONTOOOL! 🖕💥
            if v.playing < v.maxPlayers - 4 and v.id ~= game.JobId then
                
                -- AUTO-LOAD LAGI PAS PINDAH (KHUSUS CODEX)
                local scriptLink = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/yheezscript/Server-hoper.lua/main/SAB_Hopper.lua"))()'
                if queue_on_teleport then
                    queue_on_teleport(scriptLink)
                end
                
                -- COBA TERUS SAMPE MAMPUS!
                task.spawn(function()
                    while task.wait(0.5) do
                        Btn.Text = "FORCING... 🚀"
                        local success = pcall(function()
                            TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                        end)
                        if success then break end
                    end
                end)
                return
            end
        end
    end
    Btn.Text = "ALL FULL? IMPOSSIBLE! 💢"
    task.wait(1)
    Btn.Text = "BRUTE FORCE HOP 🌪️"
end)
