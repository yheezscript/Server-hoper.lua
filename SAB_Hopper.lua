local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local button = script.Parent

-- --- PENGATURAN POSISI (SESUAI KOTAK MERAH) ---
button.Name = "ServerHopButton"
button.Size = UDim2.new(0, 160, 0, 35) -- Ukuran pas untuk area atas
button.Position = UDim2.new(0.02, 0, 0.22, 0) -- Posisi di area kiri atas sesuai screenshot
button.AnchorPoint = Vector2.new(0, 0.5)
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.BorderSizePixel = 0
button.Text = "HOP SERVER"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 14
button.AutoButtonColor = false -- Kita pakai animasi custom

-- Efek Visual Tambahan
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 6)
corner.Parent = button

local stroke = Instance.new("UIStroke")
stroke.Thickness = 1.5
stroke.Color = Color3.fromRGB(255, 0, 0) -- Warna merah sesuai kotakmu
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = button

-- --- ANIMASI TOMBOL ---
button.MouseEnter:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 0, 0)}):Play()
	TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(255, 255, 255)}):Play()
end)

button.MouseLeave:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
	TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(255, 0, 0)}):Play()
end)

-- --- LOGIKA SERVER HOP (ANTI SERVER PENUH) ---
local function findNewServer()
	button.Text = "Mencari..."
	
	local success, result = pcall(function()
		local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"
		return HttpService:JSONDecode(game:HttpGet(url))
	end)

	if success and result and result.data then
		local possibleServers = {}
		
		for _, server in ipairs(result.data) do
			-- Pastikan server bukan yang sekarang DAN masih ada slot kosong (minimal sisa 2 slot biar aman)
			if server.id ~= game.JobId and server.playing <= (server.maxPlayers - 2) then
				table.insert(possibleServers, server.id)
			end
		end

		if #possibleServers > 0 then
			button.Text = "Teleporting..."
			-- Memilih server random dari daftar yang tersedia
			local targetServer = possibleServers[math.random(1, #possibleServers)]
			TeleportService:TeleportToPlaceInstance(game.PlaceId, targetServer, player)
		else
			button.Text = "Server Penuh!"
			task.wait(1)
			button.Text = "Coba Lagi"
		end
	else
		button.Text = "Error API"
	end
end

button.MouseButton1Click:Connect(findNewServer)
