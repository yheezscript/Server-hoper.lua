-- [[ YHEEZ HUB V28 - BRAINROT HUNTER 10M+ ]] --
-- NYARI TARGET YANG PRODUKSI BRAINROT-NYA GILA, BABI! 🐷🖕

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezElite") then CoreGui.YheezElite:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezElite"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0) -- TETEP DI KOTAK HITAM LU!
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.4
Instance.new("UICorner", Frame)

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "TARGET: 10M+ 🧠"
Btn.TextColor3 = Color3.fromRGB(255, 100, 255) -- Warna ungu brainrot biar elit!
Btn.Font = "GothamBold"
Btn.TextSize = 11

local function ServerHop()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local s, res = pcall(function() return game:HttpGet(Api) end)
    if s then
        local data = Http:JSONDecode(res)
        for _, v in pairs(data.data) do
            if v.playing < v.maxPlayers - 1 and v.id ~= game.JobId then
                TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                return
            end
        end
    end
end

-- FUNGSI SCAN TARGET 10JT PER DETIK, ANJING! 🐶💰
local function CheckRichProduction()
    local targetFound = false
    for _, player in pairs(game.Players:GetPlayers()) do
        -- CEK LEADERSTATS (Cek namanya: "Brainrot", "Production", atau "Per Second")
        local l = player:FindFirstChild("leaderstats")
        if l then
            -- Gue masukin pengecekan buat Brainrot atau Production, dongo! 🤡
            local stat = l:FindFirstChild("Brainrot") or l:FindFirstChild("Production") or l:FindFirstChild("Total Brainrot")
            if stat and stat.Value >= 10000000 then -- 10.000.000 (10 Juta)
                targetFound = true
                break
            end
        end
    end
    
    if not targetFound then
        print("SERVER AMPAS, KAGA ADA TARGET 10JT! HOP... 🌪️")
        ServerHop()
    else
        print("GILA! ADA TARGET 10JT+ DI SINI! SIKAT, BABI! 🐷🔥")
        Btn.Text = "TARGET FOUND! ✅"
    end
end

Btn.MouseButton1Click:Connect(function()
    Btn.Text = "CHECKING... 🧐"
    CheckRichProduction()
end)

-- AUTO RUN PAS MASUK, JANGAN MALES, BABI! 🐷⚡
task.wait(6) 
CheckRichProduction()
