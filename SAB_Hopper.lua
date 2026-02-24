-- [[ YHEEZ HUB V26.2 - THE FORCE HOPPER ]] --
-- KALO INI KAGA JALAN, FIX HP LU AMPAS, ANJING! 🐶🖕

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezCustom") then CoreGui.YheezCustom:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezCustom"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
Instance.new("UICorner", Frame)
Instance.new("UIStroke", Frame).Color = Color3.fromRGB(255, 0, 0)

Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.4

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "FORCE HOP 🌪️"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = "GothamBold"
Btn.TextSize = 12

-- FUNGSI TELEPORT PALING GALAK, KONTOOL! 🖕🔥
Btn.MouseButton1Click:Connect(function()
    Btn.Text = "MENCARI... 🏹"
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local LP = game.Players.LocalPlayer
    
    -- Ambil list server terbaru, babi! 🐷
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local s, res = pcall(function() return game:HttpGet(url) end)
    
    if s then
        local data = Http:JSONDecode(res)
        for _, v in pairs(data.data) do
            -- Cari yang orangnya dikit tapi bukan server sendiri, dongo! 🤡
            if v.playing < v.maxPlayers - 2 and v.id ~= game.JobId then
                Btn.Text = "PINDAH! 🚀"
                
                -- FORCE TELEPORT TANPA BACOT! 🖕💥
                queue_on_teleport([[
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/yheezscript/Server-hoper.lua/main/SAB_Hopper.lua"))()
                ]]) -- Biar script lu auto-load lagi pas pindah server, anjing! 🐶
                
                local success, err = pcall(function()
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id, LP)
                end)
                
                if success then return end
            end
        end
    end
    Btn.Text = "GAGAL! 💢"
    task.wait(1)
    Btn.Text = "FORCE HOP 🌪️"
end)
