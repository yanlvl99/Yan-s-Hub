function GetCurrentSea()
    if LocationsFolder:FindFirstChild("Mansion") and not LocationsFolder:FindFirstChild("Café") then
        return "Third Sea"
    elseif LocationsFolder:FindFirstChild("Café") then
        return "Second Sea"
    else
        return "First Sea"
    end
end

function AddStatPoints(Type, Quantity)
    Type = Type or "Melee"
    Quantity = Quantity or 1
    
    if Type ~= "Melee" and Type ~= "Defense" and Type ~= "Sword" and Type ~= "Blox Fruit" then
        warn("Invalid stat type: " .. tostring(Type))
        return false
    end
    
    if not tonumber(Quantity) or Quantity <= 0 then
        warn("Invalid quantity: " .. tostring(Quantity))
        return false
    end
    
    local success, result = pcall(function()
        CommF_:InvokeServer("AddPoint", Type, Quantity)
    end)
    
    return success
end
