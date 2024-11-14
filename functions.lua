function GetCurrentSea()
    local hasLocation = LocationsFolder.FindFirstChild
    if hasLocation("Mansion") and not hasLocation("Café") then
        return "Third Sea"
    elseif hasLocation("Café") then
        return "Second Sea"
    else
        return "First Sea"
    end
end

function AddStatPoints(Type,Quantity)
    CommF_:InvokeServer("AddPoint",Type or "Melee",Quantity or 1)
end
