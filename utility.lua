Format, State, Tool, Roblox, Gui = {}, {}, {}, {}, {}
Format.__index, State.__index, Tool.__index, Roblox.__index, Gui.__index = Format, State, Tool, Roblox, Gui

Get, Set, Roblox, Gui = { Format = setmetatable({}, Format), State = setmetatable({}, State) }, { Tool = setmetatable({}, Tool) }, {Roblox = setmetatable({},Roblox)}, {Gui = setmetatable({},Gui)}

function Format:Position(arg)
    if typeof(arg) == "BasePart" then 
        return arg.Position 
    elseif typeof(arg) == "Vector3" or typeof(arg) == "CFrame" then 
        return arg.Position or arg 
    elseif typeof(arg) == "Model" then 
        return arg.PrimaryPart and arg.PrimaryPart.Position 
    end
    return Vector3.new(0, 0, 0)
end

function Format:TextColor(t, c)
    return string.format('<font color="%s">%s</font>', c, tostring(t))
end

function Format:FormatNumber(n, suffixes)
    suffixes = suffixes or {"K", "M", "B", "T"}
    local number = math.abs(n)
    
    for i, suffix in ipairs(suffixes) do
        if number >= 1000 then
            number = number / 1000
        else
            return string.format("%s%s", math.floor(number), suffix)
        end
    end
    
    return tostring(math.floor(number))
end

function Format:Price(Money, Frags)
    local result = ""
    
    if Money and Money > 0 then
        result = self:TextColor("$" .. self:FormatNumber(Money), "rgb(0,255,0)")
    end
    
    if Frags and Frags > 0 then
        if result ~= "" then
            result = result .. " e "
        end
        result = result .. self:TextColor(self:FormatNumber(Frags) .. " Frags", "rgb(128,0,128)")
    end
    
    return result
end

function Get:Distance(a, b)
    return (Get.Format:Position(a) - Get.Format:Position(b)).Magnitude
end

function State:Humanoid(s)
    local character = Player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    
    return humanoid and humanoid:GetState() == Enum.HumanoidStateType[s] or false
end

function Gui:Visible(Gui)
    Gui.Visible = true 
end

function Gui:Toggle(Gui)
    Gui.Visible = not Gui.Visible
end

function Gui:Hide(Gui)
    Gui.Visible = false
end


function State:NetworkOwner(a)
    if not a:IsA("BasePart") then return false end
    
    local character = Player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    
    return (hrp and self:Distance(hrp, a) <= 350) or false
end

function State:InCombat()
    return InCombat.Visible == true
end

function Tool:Equip(t)
    local success, err = pcall(function()
        local tool = Player.Backpack:FindFirstChild(t)
        local character = Player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        
        if tool and humanoid then
            humanoid:EquipTool(tool)
        end
    end)
    return success
end

function Tool:Unequip(t)
    local success, err = pcall(function()
        local character = Player.Character
        local tool = character and character:FindFirstChild(t)
        
        if tool then
            tool.Parent = Player.Backpack
        end
    end)
    return success
end

function Roblox:Rejoin()
    local success, err = pcall(function()
        TeleportService:Teleport(game.PlaceId, Player)
    end)
    return success
end
