function GetCurrentSea()
    if LocationsFolder:FindFirstChild("Mansion") and not LocationsFolder:FindFirstChild("Café") then
        return "Third Sea"
    elseif LocationsFolder:FindFirstChild("Café") then
        return "Second Sea"
    else
        return "First Sea"
    end
end

function AddStatPoints(Type,Quantity)
    CommF_:InvokeServer("AddPoint",Type or "Melee",Quantity or 1)
end
