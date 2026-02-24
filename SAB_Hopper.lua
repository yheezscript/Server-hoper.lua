if not game:IsLoaded() then game.Loaded:Wait() end

-- BERSIHIN SAMPAH UI LAMA, KONTOL! 🖕
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and v.Name == "YheezMediumHop" then v:Destroy() end
end

local SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
SG.Name = "YheezMediumHop"

local B = Instance.new("TextButton", SG)
B.Size = UDim2.new(0, 160, 0, 40)
B.Position = UDim2.new(0.02, 10, 0.2, 0)
B.Text = "CARI 3-5 ORANG 👤"
B.BackgroundColor3 = Color3.fromRGB(0, 120, 0) -- Ijo gelap biar tenang
B.TextColor3 = Color3.new(1, 1, 1)
B.Font = Enum.Font.GothamBold
B.TextSize = 11
Instance.new("UICorner", B)

B.MouseButton1Click:Connect(function()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    
    B.Text = "NYARING SERVER... 🔍"
    
    -- Ambil data server, kita acak biar kaga dapet yang "Dibatasi" mulu!
    local s, res = pcall(function() 
        return game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100") 
    end)
    
    if s then
        local data = Http:JSONDecode(res)
        local servers = data.data
        
        -- SHUFFLE LISTNYA, BABI! 🐷🎲
        for i = #servers, 2, -1 do
            local j = math.random(i)
            servers[i], servers[j] = servers[j], servers[i]
        end
        
        for _, v in pairs(servers) do
            -- FILTER KHUSUS: MINIMAL 3, MAKSIMAL 5 ORANG, ANJING! 🐶🖕
            if v.playing >= 3 and v.playing <= 5 and v.id ~= game.JobId then
                B.Text = "TARGET FOUND! 🚀"
                
                -- Auto-reload buat Codex lu
                if queue_on_teleport then
                    pcall(function()
                        queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/yheezscript/Server-hoper.lua/main/SAB_Hopper.lua"))()')
                    end)
                end
                
                -- Tembak dengan pcall biar kalo gagal dia lanjut nyari lagi otomatis
                local success = pcall(function()
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                end)
                
                if success then return end
            end
        end
    end
    B.Text = "3-5 GAK ADA! 💀"
    task.wait(1.5)
    B.Text = "CARI 3-5 ORANG 👤"
end)
