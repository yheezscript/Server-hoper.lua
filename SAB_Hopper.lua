-- [[ YHEEZ HUB V26.1 - ANTI RESTRICTED ]] --
-- BIAR KAGA GAGAL TELEPORT LAGI, KONTOL! 🖕💥

if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YheezCustom") then CoreGui.YheezCustom:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "YheezCustom"

local Frame = Instance.new("Frame", ScreenGui)
local Btn = Instance.new("TextButton", Frame)
local Stroke = Instance.new("UIStroke", Frame)

Frame.Size = UDim2.new(0, 130, 0, 35)
Frame.Position = UDim2.new(0.02, 10, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.4
Instance.new("UICorner", Frame)

Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(255, 0, 0) -- MERAH BIAR GALAK, ANJING! 🐶

Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundTransparency = 1
Btn.Text = "FAST HOP 🌪️"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 12

Btn.MouseButton1Click:Connect(function()
    Btn.Text = "SCANNING... 🏹"
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local LP = game.Players.LocalPlayer
    
    -- GUE BIKIN NYARI SAMPE 100 SERVER, BABI! 🐷
    local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"
    local s, res = pcall(function() return game:HttpGet(Api) end)
    
    if s then
        local data = Http:JSONDecode(res)
        for _, v in pairs(data.data) do
            if v.playing < v.maxPlayers - 2 and v.id ~= game.JobId then
                Btn.Text = "TELEPORTING..."
                -- PAKE PCALL BIAR KALO "RESTRICTED" KAGA ERROR, DONGO! 🤡👇
                local success, err = pcall(function()
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id, LP)
                end)
                
                if success then return end -- Kalo jalan, ya udah kelar!
            end
        end
    end
    Btn.Text = "RETRYING... 💢"
    task.wait(1)
    Btn.Text = "FAST HOP 🌪️"
end)
