-- Configuración de webhook
local HttpService = game:GetService("HttpService")
local webhookUrl = "TU_WEBHOOK_URL"  -- Reemplaza con la URL de tu webhook de Discord

-- Variables de seguimiento
local StartCash = Player.DataFolder.Currency.Value
local farmedCash = 0  -- Variable para acumular el cash farmeado
local lastWebhookSent = os.time()  -- Marca de tiempo de la última vez que se envió un webhook
local startTime = os.time()  -- Tiempo de inicio para calcular la duración

-- Función para formatear el tiempo transcurrido en HH:MM:SS
local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local seconds = seconds % 60
    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

-- Función para enviar el webhook con el dinero farmeado y otra información
local function sendWebhook()
    local elapsedTime = os.time() - startTime  -- Tiempo transcurrido desde el inicio
    local bounty = Player.leaderstats.Bounty.Value  -- Suponiendo que la "Bounty" está en los stats del jugador
    local wallet = Player.DataFolder.Currency.Value

    local data = {
        ["embeds"] = {{
            ["title"] = "AutoFarm V1.2 Log",
            ["fields"] = {
                {
                    ["name"] = "Server info:",
                    ["value"] = "Players in Server: " .. #game.Players:GetPlayers(),
                    ["inline"] = false
                },
                {
                    ["name"] = "Player info:",
                    ["value"] = "Username: " .. Player.Name .. "\nDisplayName: " .. Player.DisplayName,
                    ["inline"] = false
                },
                {
                    ["name"] = "Auto Farm info:",
                    ["value"] = "Profit: $" .. tostring(farmedCash) .. "\nRobed: 0",  -- Puedes ajustar el valor de "Robed" si es aplicable
                    ["inline"] = false
                },
                {
                    ["name"] = "Wallet: $" .. tostring(wallet),
                    ["value"] = "Bounty: $" .. tostring(bounty) .. "\nElapsed: " .. formatTime(elapsedTime),
                    ["inline"] = false
                }
            },
            ["color"] = 3447003  -- Color del embed (opcional, en hexadecimal)
        }}
    }
    
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local body = HttpService:JSONEncode(data)
    
    local success, err = pcall(function()
        HttpService:PostAsync(webhookUrl, body, Enum.HttpContentType.ApplicationJson)
    end)
    
    if success then
        print("Webhook enviado correctamente con el dinero farmeado.")
    else
        warn("Error al enviar el webhook: " .. tostring(err))
    end
end

-- Ajustar el farming para incluir el envío de webhook
function startfarm()
	task.spawn(function()
		while true and task.wait() do
			pcall(function()
				for _, v in pairs(Player.Character:FindFirstChildWhichIsA("Humanoid"):GetPlayingAnimationTracks()) do
					if (v.Name == "Block") then
						v:Stop();
					end
				end
				repeat
					task.wait();
				until Player.Character and Player.Character:FindFirstChild("Humanoid") and (Player.Character.Humanoid.Health > 0) 
				repeat
					task.wait();
				until not hasProtectionShield(game:GetService("Players").LocalPlayer) 
				repeat
					task.wait();
				until game.Players.LocalPlayer.Character.BodyEffects["K.O"].Value == false 
				if ((Player.Character == nil) or (Player.Character:FindFirstChild("FULLY_LOADED_CHAR") == nil) or (Dis == true)) then
					return;
				end
				if Player.Character.BodyEffects:FindFirstChild("Block") then
					Player.Character.BodyEffects.Block:Destroy();
				end
		pcall(function()
			Jail = Player.Character.BodyEffects.Cuff.Value
			if (Jail == nil) then 
				Jail = false
			end
		end)
			if Jail then
                         Status:Set("Status: UnJail")
				UnJail();
			end
				local Cashier = nil;
				repeat
					task.wait();
					Cashier = GetCashier();
					To(CFrame.new(math.random(-1000, 1000), -650.0717163085938, math.random(-1000, 1000)));
                                        Status:Set("Status: Waiting Cashier")
				until Cashier ~= nil
				repeat
                                Status:Set("Status: Attack Cashier")
					To(Cashier.Head.CFrame * CFrame.new(0, -1, 2));
					task.wait();
					Attack()
					position = Cashier.Head.CFrame * CFrame.new(0, -8, 1);
				until Cashier.Humanoid.Health <= 0 
				Broken += 1
				for i, v in pairs(Player.Character:GetChildren()) do
					if (v:IsA("Tool")) then
						v.Parent = Player.Backpack;
					end
				end
    local Cash = GetCash()
        task.spawn(function()
        repeat task.wait()
        To(position)
        until #Cash <= 0
        end)
    repeat
        for i, v in pairs(Cash) do
            if v:FindFirstChildOfClass("ClickDetector") then
                fireclickdetector(v:FindFirstChildOfClass("ClickDetector"))
            end
        end
        
        Status:Set("Status: Collect Cash")
        
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
        local waitTime = math.clamp(ping / 250, 0.35, 0.5)
        task.wait(waitTime)
        Cash = GetCash()
    until #Cash <= 0
			end);
            
            -- Actualizar estadísticas de dinero y enviar el webhook cada minuto
            farmedCash = Player.DataFolder.Currency.Value - StartCash
            if os.time() - lastWebhookSent >= 60 then
                sendWebhook()
                lastWebhookSent = os.time()
            end
		end
	end);
end

-- Iniciar el farming
startfarm()

-- Tarea de actualización de etiquetas
task.spawn(function()
	while task.wait(1) do
		Money:Set("Start Money: "..StartCash)
		Profit:Set("Profit: "..Player.DataFolder.Currency.Value - StartCash)
		AtmBreak:Set("Atm Break: "..Broken)
	end
end)
