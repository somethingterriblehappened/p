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
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Bomb" then
                game:GetService("ReplicatedStorage").BombThrow:FireServer()
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Za Hando" then
                game:GetService("ReplicatedStorage").Erase:FireServer()
                local pullanimation = Instance.new("Animation")
                pullanimation.AnimationId = "rbxassetid://16102722988"
                pullanimation.Parent = game.ReplicatedStorage
                pullanimation.Name = "pullAnimation"
                game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(pullanimation, game.Players.LocalPlayer.Character.Humanoid):Play()
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Flash" then
                local distance = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 50
                game:GetService("ReplicatedStorage").FlashTeleport:FireServer()
                wait(0.6)
                if 112 < distance.X and distance.X < 132 then
                    game.Players.LocalPlayer.Character:PivotTo(CFrame.new(distance))
                else
                    game.Players.LocalPlayer.Character:MoveTo(distance)
                end
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Jet" then
                for _, player in pairs(game.Players:GetPlayers()) do
                    game:GetService("ReplicatedStorage").AirStrike:FireServer(player.Character)
                end
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" then
                game:GetService("ReplicatedStorage").Fortlol:FireServer()
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Shard" then
                game:GetService("ReplicatedStorage").Shards:FireServer()
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Slapple" then
                game:GetService("ReplicatedStorage").funnyTree:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
            elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Stun" then
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    game:GetService("ReplicatedStorage").StunR:FireServer(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))
                    cooldown(2)
                end
            else
        --game:GetService("ReplicatedStorage").HunterAbility:FireServer(game.Players[""].Character)
        --game:GetService("ReplicatedStorage").StunR:FireServer(game.Players.LocalPlayer.Character:WaitForChild("Default"))
            game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
        --game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
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
    end
end)

function cooldown(time)
    debounce = true
    task.wait(time)
    debounce = false
end
