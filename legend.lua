--Do not bind anything to E as it is the glove's main ability and might interfere.
--I and O are the Roblox zoom in and zoom outs so do not use too.

--Known universal remotes that are working
--game:GetService("ReplicatedStorage").SelfKnockback:FireServer({["Force"] = 0,["Direction"] = Vector3.new(0,1,0)})
--game:GetService("ReplicatedStorage").AdminAbility:FireServer("Anvil")
--game:GetService("ReplicatedStorage").AdminAbility:FireServer("Fling")
--game:GetService("ReplicatedStorage").AdminAbility:FireServer("Invisibility")
--game:GetService("ReplicatedStorage").RetroAbility:FireServer("Rocket Launcher")
--game:GetService("ReplicatedStorage").RetroAbility:FireServer("Ban Hammer")
--game:GetService("ReplicatedStorage").RetroAbility:FireServer("Bomb")
--game:GetService("ReplicatedStorage").IceSkate:FireServer("Freeze")

--Known animations
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.CutsceneAttacker, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.CutsceneTarget, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.bombthrow, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.bubbleshoot, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Hitman.RevolverAnim, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Retro.Animations["Ban Hammer"], game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.slapstick_slap, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.DualSlap, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Slap, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Retro.Animations.Bomb, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Retro.Animations["Rocket Launcher"], game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Rojo.Animation, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Rojo.AnimationRecoil, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Thor.Animation, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.robAnimation, game.Players.LocalPlayer.Character.Humanoid):Play()
--game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets["Ice Skate"].SkateLoop, game.Players.LocalPlayer.Character.Humanoid):Play()

debounce = false
detonate = false

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
--^^This is suppose to stop using abilities when typing.^^
	if input.KeyCode == Enum.KeyCode.Q then
        if debounce == false then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Bind" then
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("default", { origin = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame; goal = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -80);})
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Diamond" then
                game:GetService("ReplicatedStorage").Rockmode:FireServer()
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Counter" then
                game:GetService("ReplicatedStorage").Counter:FireServer()
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "ZZZZZZZ" then
                game:GetService("ReplicatedStorage").ZZZZZZZSleep:FireServer()
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Brick" then
                game:GetService("ReplicatedStorage").lbrick:FireServer()
                game.Players.LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text = tonumber(game.Players.LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text) + 1
                cooldown(1)    
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Iceskate" then
                game:GetService("ReplicatedStorage").GeneralAbilityUnreliable:FireServer("start")
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Warp" then
                game:GetService("ReplicatedStorage").WLOC:FireServer()
                cooldown(4)
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Bomb" then
                if detonate == false then
                    game:GetService("ReplicatedStorage").BombThrow:FireServer()
                    detonate = true
                elseif detonate == true then
                    game:GetService("ReplicatedStorage").BombThrow:FireServer()
                    detonate = false
                    cooldown(5)
                end
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Za Hando" then
                game:GetService("ReplicatedStorage").Erase:FireServer()
                local pullanimation = Instance.new("Animation")
                pullanimation.AnimationId = "rbxassetid://16102722988"
                pullanimation.Parent = game.ReplicatedStorage
                pullanimation.Name = "pullAnimation"
                game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(pullanimation, game.Players.LocalPlayer.Character.Humanoid):Play()
                cooldown(5)
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Flash" then
                local distance = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 50
                game:GetService("ReplicatedStorage").FlashTeleport:FireServer()
                debounce = true
                wait(0.6)                                
                if 112 < distance.X and distance.X < 132 then
                    game.Players.LocalPlayer.Character:PivotTo(CFrame.new(distance))
                else
                    game.Players.LocalPlayer.Character:MoveTo(distance)
                end
                wait(1.4)
                debounce = false
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Jet" then
                local function InitiateUI_upvr(arg1)
                    local CursorIMG_upvr = arg1.Frame.CursorIMG
                    local OutlineIMG_upvr = arg1.Frame.OutlineIMG
                    game:GetService("TweenService"):Create(OutlineIMG_upvr, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
                        Rotation = 90;
                        ImageTransparency = 0;
                    }):Play()
                    game:GetService("TweenService"):Create(CursorIMG_upvr, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
                        ImageTransparency = 0;
                    }):Play()
                    game:GetService("Debris"):AddItem(OutlineIMG_upvr, 5)
                    game:GetService("Debris"):AddItem(CursorIMG_upvr, 5)
                    coroutine.resume(coroutine.create(function() -- Line 27
                        wait(3)
                        if CursorIMG_upvr and OutlineIMG_upvr then
                            game:GetService("TweenService"):Create(CursorIMG_upvr, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
                                ImageTransparency = 1;
                            }):Play()
                            game:GetService("TweenService"):Create(OutlineIMG_upvr, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
                                ImageTransparency = 1;
                            }):Play()
                        end
                    end))
                end
                local tbl_3 = {}
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v:FindFirstChild("leaderstats") ~= nil and v.Character and v.Character.isInArena.Value == true and v.Character.IsInDefaultArena.Value == false then
                        table.insert(tbl_3, {
                            Player = v;
                            Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude;
                        })
                    end
                end
                table.sort(tbl_3, function(arg1, arg2) -- Line 46
                    local var34
                    if arg1.Magnitude >= arg2.Magnitude then
                        var34 = false
                    else
                        var34 = true
                    end
                    return var34
                end)
                if tbl_3[2] ~= nil and tbl_3[2].Player ~= nil then
                    v = tbl_3[2].Player.Character
                    i = v.HumanoidRootPart
                    v = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    if (i.Position - v).Magnitude < 100 then
                        i = game                        
                        if tbl_3[2].Player ~= i.Players.LocalPlayer then
                            v = tbl_3[2]
                            i = v.Player
                            game:GetService("ReplicatedStorage").AirStrike:FireServer(i.Character)
                            local clone = game.ReplicatedStorage.JetTarget:Clone()
                            InitiateUI_upvr(clone)
                            v = tbl_3[2]
                            i = v.Player
                            clone.Parent = i.Character.HumanoidRootPart
                            game.SoundService.Target:Play()
                            cooldown(5)
                        end
                    end
                end
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Hunter" then
                local function InitiateUI_upvr(arg1)
                    local CursorIMG_upvr = arg1.Frame.CursorIMG
                    local OutlineIMG_upvr = arg1.Frame.OutlineIMG
                    game:GetService("TweenService"):Create(OutlineIMG_upvr, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
                        Rotation = 90;
                        ImageTransparency = 0;
                    }):Play()
                    game:GetService("TweenService"):Create(CursorIMG_upvr, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
                        ImageTransparency = 0;
                    }):Play()
                    game:GetService("Debris"):AddItem(OutlineIMG_upvr, 5)
                    game:GetService("Debris"):AddItem(CursorIMG_upvr, 5)
                    coroutine.resume(coroutine.create(function() -- Line 27
                        wait(3)
                        if CursorIMG_upvr and OutlineIMG_upvr then
                            game:GetService("TweenService"):Create(CursorIMG_upvr, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
                                ImageTransparency = 1;
                            }):Play()
                            game:GetService("TweenService"):Create(OutlineIMG_upvr, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
                                ImageTransparency = 1;
                            }):Play()
                        end
                    end))
                end
                local tbl_3 = {}
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v:FindFirstChild("leaderstats") ~= nil and v.Character and v.Character.isInArena.Value == true and v.Character.IsInDefaultArena.Value == false then
                        table.insert(tbl_3, {
                            Player = v;
                            Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude;
                        })
                    end
                end
                table.sort(tbl_3, function(arg1, arg2) -- Line 46
                    local var34
                    if arg1.Magnitude >= arg2.Magnitude then
                        var34 = false
                    else
                        var34 = true
                    end
                    return var34
                end)
                if tbl_3[2] ~= nil and tbl_3[2].Player ~= nil then
                    i = game                        
                    if tbl_3[2].Player ~= i.Players.LocalPlayer then
                        v = tbl_3[2]
                        i = v.Player
                        game:GetService("ReplicatedStorage").HunterAbility:FireServer(i.Character)
                        local clone = game.ReplicatedStorage.JetTarget:Clone()
                        InitiateUI_upvr(clone)
                        v = tbl_3[2]
                        i = v.Player
                        clone.Parent = i.Character.HumanoidRootPart
                        local Sound_4 = Instance.new("Sound")
                        Sound_4.SoundId = "rbxassetid://5701808679"
                        game:GetService("Debris"):AddItem(Sound_4, 10)
                        Sound_4.Volume = 2
                        Sound_4.Parent = game.SoundService
                        Sound_4:Play()
                        local Sound_2 = Instance.new("Sound")
                        Sound_2.SoundId = "rbxassetid://533256819"
                        game:GetService("Debris"):AddItem(Sound_2, 10)
                        Sound_2.Volume = 2
                        Sound_2.Parent = game.SoundService
                        Sound_2:Play()
                        local Sound = Instance.new("Sound")
                        Sound.SoundId = "rbxassetid://1841354127"
                        game:GetService("Debris"):AddItem(Sound, 10)
                        Sound.Volume = 2
                        Sound.Parent = game.SoundService
                        Sound:Play()
                        cooldown(5)
                    end
                end
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" then
                game:GetService("ReplicatedStorage").Fortlol:FireServer()
                cooldown(3)
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Shard" then
                game:GetService("ReplicatedStorage").Shards:FireServer()
                cooldown(4)
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Slapple" then
                game:GetService("ReplicatedStorage").funnyTree:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                cooldown(3)
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Stun" then
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    game:GetService("ReplicatedStorage").StunR:FireServer(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))
                    cooldown(10)
                end
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Pusher" then
                game:GetService("ReplicatedStorage").PusherWall:FireServer()
                cooldown(5)
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Magnet" then
                local LocalPlayer = game.Players.LocalPlayer
                local tbl_3 = {}
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v:FindFirstChild("leaderstats") ~= nil and v.Character:FindFirstChild("isInArena") and v.Character.isInArena.Value == true and v.Character.IsInDefaultArena.Value == false then
                        table.insert(tbl_3, {
                            Player = v;
                            Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude;
                        })
                    end
                end
                table.sort(tbl_3, function(arg1, arg2) -- Line 25
                    local var29
                    if arg1.Magnitude >= arg2.Magnitude then
                        var29 = false
                    else
                        var29 = true
                    end
                    return var29
                end)
                if tbl_3[2] ~= nil and tbl_3[2].Player ~= nil then
                    if tbl_3[2].Player ~= LocalPlayer then
                        var5_upvw = true
                        game:GetService("ReplicatedStorage").MagnetS:FireServer()
                        local Attachment_2 = Instance.new("Attachment")
                        Attachment_2.Parent = LocalPlayer.Character.HumanoidRootPart
                        Attachment_2.Name = "magnetismATTACHMENT"
                        local AlignPosition_2 = Instance.new("AlignPosition")
                        AlignPosition_2.MaxForce = 25000
                        AlignPosition_2.Responsiveness = 20
                        i = "Attachment"
                        local any_2 = Instance.new(i)
                        v = tbl_3[2].Player.Character
                        i = v.HumanoidRootPart
                        any_2.Parent = i
                        AlignPosition_2.Attachment1 = any_2
                        AlignPosition_2.Attachment0 = Attachment_2
                        i = workspace
                        AlignPosition_2.Parent = i
                        i = game:GetService("Debris"):AddItem(any_2, 0.5)
                        i = game:GetService("Debris"):AddItem(Attachment_2, 0.5)
                        i = game:GetService("Debris"):AddItem(AlignPosition_2, 0.5)
                    end
                end
                cooldown(4)
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "bus" then
                game:GetService("ReplicatedStorage").busmoment:FireServer()
                cooldown(5)
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Space" then
                game:GetService("ReplicatedStorage").ZeroGSound:FireServer()
                game.Workspace.Gravity = 0
                local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
                ColorCorrectionEffect.Name = "ZeroGColor"
                ColorCorrectionEffect.Parent = game.Lighting
                game:GetService("TweenService"):Create(ColorCorrectionEffect, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
                    TintColor = Color3.new(0.333333, 1, 0);
                    Brightness = -0.3;
                }):Play()
                wait(4)
                game:GetService("TweenService"):Create(ColorCorrectionEffect, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
                    TintColor = Color3.new(1, 1, 1);
                    Brightness = 0;
                }):Play()
                game:GetService("TweenService"):Create(game.Workspace, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
                    Gravity = 196.2;
                }):Play()
                wait(1)
                ColorCorrectionEffect:Destroy()
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Acrobat" then
                local Animation_upvr = Instance.new("Animation")
                Animation_upvr.AnimationId = "rbxassetid://16299510063"
                game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animation_upvr):Play()
                game:GetService("ReplicatedStorage").Roll:FireServer()
                local BodyVelocity = Instance.new("BodyVelocity")
                BodyVelocity.Velocity = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame.LookVector * 100
                BodyVelocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                game:GetService("Debris"):AddItem(BodyVelocity, 0.1)
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Massless = true
                    end
                end
                wait(0.6)
                if game.Players.LocalPlayer.Character then
                    for _, v_2 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v_2:IsA("BasePart") then
                            v_2.Massless = false
                        end
                    end
                end
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Anchor" then
                game:GetService("TweenService"):Create(game:GetService("ReplicatedStorage").AnchorActivated:InvokeServer().BillboardGui.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
	                ImageTransparency = 0;
                }):Play()
                cooldown(1)
            else
                --game:GetService("ReplicatedStorage").HunterAbility:FireServer(game.Players[""].Character)
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                --game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
            end
        end
    end

        if input.KeyCode == Enum.KeyCode.E then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Brick" then
                cooldown(1)
            end
        end
        if input.KeyCode == Enum.KeyCode.R then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Poltergeist" then
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("ability2")
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Bind" then
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("ultimate", { origin = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame; goal = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -80);})
            else
            --game:GetService("ReplicatedStorage").Ghostinvisibilitydeactivated:FireServer()
            end
        end

        if input.KeyCode == Enum.KeyCode.T then
            game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Retro.Animations.Bomb, game.Players.LocalPlayer.Character.Humanoid):Play()
            wait(0.4)
            game:GetService("ReplicatedStorage").RetroAbility:FireServer("Bomb")
        end

        if input.KeyCode == Enum.KeyCode.Y then

        end

        if input.KeyCode == Enum.KeyCode.U then

        end

        if input.KeyCode == Enum.KeyCode.O then

        end

        if input.KeyCode == Enum.KeyCode.P then
            game:GetService("ReplicatedStorage").IceSkate:FireServer("Freeze")
        end

        if input.KeyCode == Enum.KeyCode.F then
            game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Retro.Animations["Rocket Launcher"], game.Players.LocalPlayer.Character.Humanoid):Play()
            wait(0.5)
            game:GetService("ReplicatedStorage").RetroAbility:FireServer("Rocket Launcher")
        end

        if input.KeyCode == Enum.KeyCode.G then
            game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Retro.Animations["Ban Hammer"], game.Players.LocalPlayer.Character.Humanoid):Play()
            wait(0.9)
            game:GetService("ReplicatedStorage").RetroAbility:FireServer("Ban Hammer")
        end

        if input.KeyCode == Enum.KeyCode.H then

        end

        if input.KeyCode == Enum.KeyCode.J then

        end

        if input.KeyCode == Enum.KeyCode.K then

        end

        if input.KeyCode == Enum.KeyCode.L then

        end

        if input.KeyCode == Enum.KeyCode.Z then
        
        end

        if input.KeyCode == Enum.KeyCode.X then
            game:GetService("ReplicatedStorage").SelfKnockback:FireServer({["Force"] = 0,["Direction"] = Vector3.new(0,1,0)})
        end

        if input.KeyCode == Enum.KeyCode.C then

        end

        if input.KeyCode == Enum.KeyCode.V then

        end

        if input.KeyCode == Enum.KeyCode.B then

        end

        if input.KeyCode == Enum.KeyCode.N then

        end

        if input.KeyCode == Enum.KeyCode.M then
            
        end
end)

function cooldown(time)
    debounce = true
    wait(time)
    debounce = false
end
