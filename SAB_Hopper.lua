-- [[ OBFUSCATED BY YHEEZ ]] --
local _0x536162 = "SAB_HOPPER_V23"
local _0x4c = game:GetService("HttpService")
local _0x54 = game:GetService("TeleportService")
local _0x50 = game:GetService("Players").LocalPlayer

-- INI KODE UTAMA LU YANG UDAH GUE SULAP BIAR KAGA GAMPANG DIBACA BOCIL, BABI! 🐷⚡
local function _0x52756e()
    local s = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local m = Instance.new("Frame", s)
    local b = Instance.new("TextButton", m)
    m.Size = UDim2.new(0, 150, 0, 50)
    m.Position = UDim2.new(0.5, -75, 0.5, -25)
    m.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    b.Size = UDim2.new(1, 0, 1, 0)
    b.Text = "YHEEZ HUB 🧠"
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = "GothamBold"
    b.MouseButton1Click:Connect(function()
        b.Text = "SCANNING..."
        local c = ""
        for i = 1, 5 do
            local r = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&cursor=" .. c)
            local d = _0x4c:JSONDecode(r)
            for _, v in pairs(d.data) do
                if v.playing < v.maxPlayers - 2 and v.id ~= game.JobId then
                    _0x54:TeleportToPlaceInstance(game.PlaceId, v.id, _0x50)
                    return
                end
            end
            c = d.nextPageCursor or ""
        end
    end)
end

pcall(_0x52756e)
print("YHEEZ SCRIPT INJECTED! 🖕🚀")
