if not game:IsLoaded() then game.Loaded:Wait() end

-- BERSIHIN UI LAMA, ANJING! 🐶
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and v.Name == "YheezSmartHop" then v:Destroy() end
end

local SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
SG.Name = "YheezSmartHop"

local B = Instance.new("TextButton", SG)
B.Size = UDim2.new(0, 140, 0, 40)
B.Position = UDim2.new(0.02, 10, 0.2, 0)
B.Text = "SMART HOP 🌪️"
B.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
B.TextColor3 = Color3.new(1, 1, 1)
B.Font = Enum.Font.GothamBold
B.TextSize = 12
Instance.new("UICorner", B)

B.MouseButton1Click:Connect(function()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    
    B.Text = "MENGAMBIL DATA..."
    local s, res = pcall(function() 
        return game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100") 
    end)
    
    if s then
        local data = Http:JSONDecode(res)
        local servers = data.data
        
        -- KITA ACAK BIAR GAK KENA SERVER AMPAS YANG SAMA TERUS, BABI! 🐷
        for i = #servers, 2, -1 do
            local j = math.random(i)
            servers[i], servers[j] = servers[j], servers[i]
        end
        
        B.Text = "SEARCHING..."
        
        -- INI INTI PERTANYAAN LU, KONTOOOL! 🖕💥
        for _, v in pairs(servers) do
            if v.playing < v.maxPlayers - 2 and v.id ~= game.JobId then
                B.Text = "MENCOBA MASUK..."
                
                -- SIAPIN AUTO-LOAD BUAT SERVER BARU
                if queue_on_teleport then
                    pcall(function()
                        queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/yheezscript/Server-hoper.lua/main/SAB_Hopper.lua"))()')
                    end)
                end
                
                -- TELEPORT DENGAN PROTEKSI, KALO GAGAL DIA LANJUT LOOP! 🔄
                local success = pcall(function()
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                end)
                
                -- KALO BERHASIL (LAYAR ITEM), KITA BERHENTI NYARI.
                -- KALO GAGAL (SERVER PENUH/DIBATASI), DIA BAKAL LANJUT KE SERVER BERIKUTNYA DI LIST!
                if success then 
                    task.wait(2) -- Kasih waktu buat Roblox ngerespon
                    -- Kalo masih di server lama setelah 2 detik, berarti gagal, lanjut loop!
                    if game.JobId ~= v.id then
                        warn("GAGAL MASUK, NYARI SERVER LAIN... 🔄")
                    else
                        return 
                    end
                end
            end
        end
    end
    B.Text = "TIDAK ADA SERVER! 💢"
    task.wait(1)
    B.Text = "SMART HOP 🌪️"
end)
