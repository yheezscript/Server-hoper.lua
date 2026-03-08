-- --- KONFIGURASI ---
local URL_SCRIPT = "https://raw.githubusercontent.com/yheezscript/Server-hoper.lua/refs/heads/main/SAB_Hopper.lua"

-- --- FUNGSI AUTO LOAD ---
-- Script ini akan berjalan otomatis saat dieksekusi
local function executeHopper()
    local success, err = pcall(function()
        loadstring(game:HttpGet(URL_SCRIPT))()
    end)
    if not success then
        warn("Gagal memuat script: " .. tostring(err))
    end
end

-- --- MEMBUAT GUI (BIAR MUNCUL DI DELTA) ---
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DeltaHopGui"
screenGui.Parent = game:GetService("CoreGui") -- Menggunakan CoreGui agar tidak hilang/error
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Name = "HopButton"
button.Parent = screenGui

-- Menyesuaikan posisi ke kotak merah (Kiri Atas)
button.Size = UDim2.new(0, 140, 0, 35)
button.Position = UDim2.new(0.02, 0, 0.22, 0) -- Sesuai screenshot kamu
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.BorderSizePixel = 0
button.Text = "HOP SERVER (3x)"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 12

-- Variasi Tampilan (Corner & Stroke)
local corner = Instance.new("UICorner", button)
corner.CornerRadius = UDim.new(0, 6)

local stroke = Instance.new("UIStroke", button)
stroke.Thickness = 1.8
stroke.Color = Color3.fromRGB(255, 0, 0) -- Merah

-- --- LOGIKA KLIK (3X TRY) ---
button.MouseButton1Click:Connect(function()
    button.Text = "Searching..."
    button.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    
    for i = 1, 3 do
        button.Text = "Try " .. i .. "/3"
        executeHopper()
        task.wait(1) -- Jeda antar percobaan
    end
    
    task.wait(2)
    button.Text = "HOP SERVER"
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end)

-- --- FITUR AUTO LOAD SAAT MASUK ---
-- Karena ini script executor, kamu harus klik 'Execute' lagi di server baru 
-- ATAU masukkan script ini ke folder 'autoexec' di folder Delta kamu.
print("Server Hop UI Loaded!")
executeHopper() -- Jalankan sekali saat pertama kali execute
