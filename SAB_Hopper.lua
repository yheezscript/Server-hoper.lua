-- [[ XYHEEZX ANTI-CRASH SMART HOPPER V22 ]] --
-- KHUSUS STEAL A BRAINROT - ANTI-EMOJI & ANTI-LAYAR ITEM! 🧠🔥

if not game:IsLoaded() then game.Loaded:Wait() end

local Market = game:GetService("MarketplaceService")
local GameInfo = Market:GetProductInfo(game.PlaceId)

-- DETEKSI KATA KUNCI "BRAINROT" (BIAR TETEP JALAN BIARPUN ADA EMOJI)
if not string.find(string.lower(GameInfo.Name), "brainrot") then
    warn("SALAH GAME, BABI! INI BUKAN STEAL A BRAINROT! 🐷🖕")
    return
end

local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local LP = game:GetService("Players").LocalPlayer

-- UI POSISI AMAN (DI BAWAH LOGO DELTA/MENU ROBLOX)
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Main)
local UICorner = Instance.new("UICorner", Main)

Main.Size = UDim2.new(0, 110, 0, 30)
Main.Position = UDim2.new(0, 15, 0, 180) -- POJOK KIRI AGA BAWAH, KAGA BAKAL KETUTUP! 🖕
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.Active = true
Main.Draggable = true

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "SAB HOP 🧠🚀"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 11

Btn.MouseButton1Click:Connect(function()
    Btn.Text = "WAIT... ⏳"
    local Cursor = ""
    
    -- SCAN 30 HALAMAN (3000 SERVER) BIAR HP KENTANG LU KAGA MELEDAK 💣
    for i = 1, 30 do 
        local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&cursor=" .. Cursor
        local s, res = pcall(function() return game:HttpGet(Api) end)
        
        if s then
            local data = Http:JSONDecode(res)
            if data and data.data then
                for _, v in pairs(data.data) do
                    -- NYARI SERVER YANG SISA SLOTNYA MINIMAL 2 (BIAR KAGA PENUH PAS MASUK)
                    if v.playing < v.maxPlayers - 2 and v.id ~= game.JobId then
                        Btn.Text = "LEAVING... 👋"
                        
                        -- SPAM REQUEST TELEPORT BIAR KAGA STUCK ITEM DOANG, ANJING! 🐶⚡
                        task.spawn(function()
                            local attempts = 0
                            while task.wait(0.3) and attempts < 10 do
                                attempts = attempts + 1
                                TPS:TeleportToPlaceInstance(game.PlaceId, v.id, LP)
                            end
                        end)
                        return
                    end
                end
                if data.nextPageCursor then Cursor = data.nextPageCursor else break end
            end
        end
        task.wait(0.1) -- BIAR DELTA LU PUNYA NAPAS, KONTOL! 🖕
    end
    Btn.Text = "COBA LAGI! 💢"
    task.wait(1)
    Btn.Text = "SAB HOP 🧠🚀"
end)

print("XyheezX V22 Loaded! Sikat otaknya, babi! 🐷🖕💥")
