--[[
blud bla blud
]]

if not fireclickdetector then
    game.Players.LocalPlayer:Kick("not support fireclickdetector")
    return
    end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zxrorocks/test-repo2/refs/heads/main/utils"))()
    local bb = game:service("VirtualUser");
    game:service("Players").LocalPlayer.Idled:connect(function()
        bb:CaptureController();
        bb:ClickButton2(Vector2.new());
    end);
    function hasProtectionShield(player)
        local forceField = player.Character:FindFirstChildOfClass("ForceField");
        if forceField then
            return true;
        else
            return false;
        end
    end
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "Da Hood", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
    local Tab = Window:MakeTab({
        Name = "Info",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    local Status = Tab:AddLabel("Status :")
    local Money = Tab:AddLabel("Money: ")
    local Profit = Tab:AddLabel("Profit: ")
    local AtmBreak = Tab:AddLabel("Atm Break: ")
    local Macro = Tab:AddLabel("Macro Status: ")
    Tab:AddLabel("Vault Fix")
    repeat
            Status:Set("Status: Waiting ForceField")
        task.wait();
    until not hasProtectionShield(game:GetService("Players").LocalPlayer) 
    task.spawn(function()
        while true do
            wait();
            _G.rejoin151 = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
                if not _G.Rejoin151 then
                    if ((Kick.Name == "ErrorPrompt") and Kick:FindFirstChild("MessageArea") and Kick.MessageArea:FindFirstChild("ErrorFrame")) then
                        game:GetService("TeleportService"):Teleport(game.PlaceId);
                        wait();
                    end
                end
            end);
        end
    end);
    repeat
        task.wait(0.1);
    until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character 
        if (game.PlaceId == 2788229376) then
    Macro:Set("Macro Status: true")        
            return
    Macro:Set("Macro Status: true")
    end
    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
    game.Workspace.CurrentCamera.FieldOfView = 110;
    local Player = game:GetService("Players").LocalPlayer;
    local Cashiers = workspace.Cashiers;
    local Drop = workspace.Ignored.Drop;
    local Dis = false;
    local Jail = false
    local Broken = 0;
    local StartTick = os.time();
    local RunService = game:GetService("RunService");
    Player.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam;
    Player.CameraMaxZoomDistance = 6;
    Player.CameraMinZoomDistance = 6;
    pcall(function()
        local a = game:GetService("ReplicatedStorage").MainEvent;
        local b = {"CHECKER_1","TeleportDetect","OneMoreTime"};
        local c;
        c = hookmetamethod(game, "__namecall", function(...)
            local d = {...};
            local self = d[1];
            local e = getnamecallmethod();
            if ((e == "FireServer") and (self == a) and table.find(b, d[2])) then
                return;
            end
            return c(...);
        end);
    end);
    local player = game.Players.LocalPlayer;
    function UnJail()
            local Players = game:GetService("Players");
            local Player = Players.LocalPlayer;
            local Key = workspace.Ignored.Shop["[Key] - $133"];
            Player.Character.HumanoidRootPart.CFrame = Key.Head.CFrame + Vector3.new(0, 1, 0);
            task.wait(0.5);
            fireclickdetector(Key.ClickDetector);
            task.wait(0.5);
            if (Player.Backpack:FindFirstChild("[Key]")) then
                pcall(function()
                    Player.Backpack["[Key]"].Parent = Player.Character;
                end);
            end
            task.wait();
    end
    local GetCash = function()
        local Found = {}
        
        for i,v in pairs(Drop:GetChildren()) do 
            if (v.Name == "MoneyDrop") then 
                local Pos = nil 
                
                if (v:GetAttribute("OriginalPos") ~= nil) then 
                    Pos = v:GetAttribute("OriginalPos")
                else 
                    Pos = v.Position
                end
                if (Pos - Player.Character.HumanoidRootPart.Position).Magnitude <= 17 then 
                    Found[#Found+1] = v 
                end
            end
        end
        return Found
    end
    local AntiSit = function(Char)
        task.wait(1);
        local Hum = Char:WaitForChild("Humanoid");
        Hum.Seated:Connect(function()
            Hum.Sit = false;
            Hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false);
            task.wait(0.3);
            Hum.Jump = true;
        end);
    end;
    local function InAttack()
        local forbidden = {"[RPG]","[SMG]","[TacticalShotgun]","[AK47]","[AUG]","[Glock]","[Shotgun]","[Flamethrower]","[Silencer]","[AR]","[Revolver]","[SilencerAR]","[LMG]","[P90]","[DrumGun]","[Double-Barrel SG]","[Hamburger]","[Chicken]","[Pizza]","[Cranberry]","[Donut]","[Taco]","[Starblox Latte]","[BrownBag]","[Weights]","[HeavyWeights]"};
        local MaxDistance = 15;
        for _, v in pairs(game.Workspace.Players:GetChildren()) do
            if (v:FindFirstChild("UpperTorso") and player.Character:FindFirstChild("HumanoidRootPart")) then
                if ((v.UpperTorso.Position - player.Character.HumanoidRootPart.Position).Magnitude <= MaxDistance) then
                    local tool = v:FindFirstChildWhichIsA("Tool");
                    if ((v.BodyEffects.Attacking.Value == true) and tool and not table.find(forbidden, tool.Name) and (v.Name ~= player.Name)) then
                        return true;
                    end
                end
            end
        end
        return false;
    end
    local GetCashier = function()
        for i, v in pairs(Cashiers:GetChildren()) do
            if v.Name == "VAULT" then
                continue
            end
            
            if ((i == 15) and ((Vector3.new(-625, 10, -286) - v.Head.Position).Magnitude <= 20)) then
                v:MoveTo(Vector3.new(-622.948, 24, -286.52));
                for x, z in pairs(v:GetChildren()) do
                    if ((z:IsA("Part")) or (z:IsA("BasePart"))) then
                        z.CanCollide = false;
                    end
                end
            elseif ((i == 16) and ((Vector3.new(-625, 10, -286) - v.Head.Position).Magnitude <= 20)) then
                v:MoveTo(Vector3.new(-629.948, 24, -286.52));
                for x, z in pairs(v:GetChildren()) do
                    if ((z:IsA("Part")) or (z:IsA("BasePart"))) then
                        z.CanCollide = false;
                    end
                end
            end
            if (v.Humanoid.Health > 0) then
                return v;
            end
        end
        return nil;
    end;
    local To = function(CF)
        Player.Character.HumanoidRootPart.CFrame = CF;
        Player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0);
    end;
    
    local function HasCombatTool()
        local toolName = "Combat";
        local inBackpack = Player.Backpack:FindFirstChild(toolName);
        local inCharacter = Player.Character and Player.Character:FindFirstChild(toolName);
        if (inBackpack or inCharacter) then
            return true;
        else
            return false;
        end
    end
    function Attack()
        local currency = Player.DataFolder.Currency.Value
        if currency < 200 then
            local combatTool = Player.Backpack:FindFirstChild("Combat")
            if combatTool then
                combatTool.Parent = Player.Character
                Player.Character.Combat:Activate()
                return
            end
        end
    
        local knifeInBackpack = Player.Backpack:FindFirstChild("[Knife]")
        local knifeInCharacter = Player.Character:FindFirstChild("[Knife]")
    
        if not (knifeInBackpack or knifeInCharacter) then
            repeat
                local KnifeBuy = workspace.Ignored.Shop["[Knife] - $159"]
                if KnifeBuy and KnifeBuy.Head and KnifeBuy.ClickDetector then
                    Player.Character.HumanoidRootPart.CFrame = KnifeBuy.Head.CFrame + Vector3.new(0, 3.2, 0)
                    task.wait(0.2)
                    fireclickdetector(KnifeBuy.ClickDetector)
                    Status:Set("Status: Buy Knife")
                end
                task.wait()
            until Player.Backpack:FindFirstChild("[Knife]") or Player.Character:FindFirstChild("[Knife]")
        end
    
        local Knife = Player.Character:FindFirstChild("[Knife]")
            pcall(function()
                if Player.Backpack:FindFirstChild("[Knife]") then
                    Player.Backpack["[Knife]"].Parent = Player.Character
                end
            end)
            Knife:Activate()
    end
    
    game.Workspace.FallenPartsDestroyHeight = -math.huge;
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
            end
        end);
    end
    task.spawn(function()
        while task.wait() do
            if (game.Players.LocalPlayer.Character.BodyEffects["K.O"].Value == true) then
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if (v:IsA("MeshPart") or v:IsA("Part")) then
                        v:Destroy();
                    end
                end
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Accessory") then
                        v.Handle:Destroy();
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health = 0;
            end
        end
    end);
    local StartCash = Player.DataFolder.Currency.Value;
    pcall(function()
        settings().Rendering.QualityLevel = "Level01";
    end);
    Player.CharacterAdded:Connect(AntiSit);
    task.spawn(function()
        task.wait(3);
        AntiSit(Player.Character);
    end);
    
    local noclip = true
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    
    startfarm();
    
    task.spawn(function()
    while task.wait(1) do
    Money:Set("Start Money: "..StartCash)
    Profit:Set("Profit: "..Player.DataFolder.Currency.Value - StartCash)
    AtmBreak:Set("Atm Break: "..Broken)
    end
    end)