local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local button = script.Parent

-- --- TAMPILAN (Tetap di posisi merah) ---
button.Size = UDim2.new(0, 160, 0, 35)
button.Position = UDim2.new(0.02, 0, 0.22, 0)
button.AnchorPoint = Vector2.new(0, 0.5)
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.Text = "HOP SERVER (3x)"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 14

local stroke = Instance.new("UIStroke", button)
stroke.Thickness = 1.5
stroke.Color = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

-- --- LOGIKA MULTI-HOP (3 KALI PERCOBAAN) ---
local function startMultiHop()
	button.Text = "Mencoba 3 Server..."
	button.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
	
	-- Menjalankan script eksternal dari GitHub yang kamu berikan
	-- Script SAB_Hopper biasanya sudah punya sistem antrian sendiri
	local function exec()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yheezscript/Server-hoper.lua/refs/heads/main/SAB_Hopper.lua"))()
	end

	-- Melakukan loop 3 kali
	for i = 1, 3 do
		button.Text = "Percobaan ke-" .. i
		local success, err = pcall(exec)
		
		if success then
			button.Text = "Teleporting..."
			break -- Berhenti jika sudah berhasil eksekusi
		else
			warn("Gagal percobaan ke-" .. i .. ": " .. tostring(err))
			task.wait(0.5) -- Tunggu sebentar sebelum coba server lain
		end
	end
	
	task.wait(3)
	button.Text = "HOP SERVER"
	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end

button.MouseButton1Click:Connect(startMultiHop)
