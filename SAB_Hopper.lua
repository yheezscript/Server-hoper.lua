-- [[ YHEEZ HUB V37 - THE REALITY BYPASS ]] --
-- FIX ANTI-RESTRICTED / TEMPAT DIBATASI, BABI! 🐷🖕

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezBypass") then CoreGui.YheezBypass:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezBypass"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
Instance.new("UICorner", Frame)

Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.4

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "FORCE BYPASS 🌪️"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = "GothamBold"
Btn.TextSize = 11

-- INI KERAHAN TENAGA TERAKHIR GUE, KONTOOOL! 🖕⚡
Btn.MouseButton1Click:Connect(function()
    Btn.Text = "CLEANING CACHE..."
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    
    -- KITA ACAK LISTNYA BIAR KAGA NEMBAK SERVER "DIBATASI" YANG SAMA, BABI! 🐷
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local s, res = pcall(function() return game:HttpGet(url) end)
    
    if s then
        local data = Http:JSONDecode(res)
        local servers = data.data
        
        -- KITA ACAK BIAR GAK KENA SERVER YANG LAGI BUG, DONGO! 🤡
        for i = #servers, 2, -1 do
            local j = math.random(i)
            servers[i], servers[j] = servers[j], servers[i]
        end

        for _, v in pairs(servers) do
            -- CARI YANG BENER-BENER SEPI TAPI BUKAN SERVER LU SEKARANG!
            if v.playing < v.maxPlayers - 5 and v.id ~= game.JobId then
                Btn.Text = "PENETRATING..."
                
                -- AUTO RELOAD BIAR TETEP GACOR!
                if queue_on_teleport then
                    queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/yheezscript/Server-hoper.lua/main/SAB_Hopper.lua"))()')
                end
                
                -- PAKSA TELEPORT PAKE PCALL AGAR KALO "DIBATASI" DIA LANJUT NYARI LAGI!
                local success, err = pcall(function()
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                end)
                
                -- KALO BERHASIL, STOP LOOP. KALO GAGAL (DIBATASI), DIA BAKAL LANJUT KE SERVER BERIKUTNYA!
                if success then return end
                task.wait(0.1) -- JEDA DIKIT BIAR KAGA CRASH, KONTOL! 🖕
            end
        end
    end
    Btn.Text = "RETRYING... 🔄"
    task.wait(1)
    Btn.Text = "FORCE BYPASS 🌪️"
end)
