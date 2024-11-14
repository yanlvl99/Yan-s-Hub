-- Serviços do Roblox
ReplicatedStorage = game:GetService("ReplicatedStorage")
VirtualInputManager = game:GetService("VirtualInputManager")
CollectionService = game:GetService("CollectionService")
HttpService = game:GetService("HttpService")
RunService = game:GetService("RunService")
TweenService = game:GetService("TweenService")
TeleportService = game:GetService("TeleportService")
VirtualUser = game:GetService("VirtualUser")
Players = game:GetService("Players")
Player = Players.LocalPlayer

PlayerData = Player:WaitForChild("Data")
Remotes = ReplicatedStorage:WaitForChild("Remotes")
EnemiesFolder = workspace:WaitForChild("Enemies")
CharactersFolder = workspace:WaitForChild("Characters")
_WorldOrigin = workspace:WaitForChild("_WorldOrigin")

PlayerSpawns = _WorldOrigin.PlayerSpawns:WaitForChild(tostring(Player.Team and Player.Team or "Pirate"))
Sea = _WorldOrigin:WaitForChild("Foam;")
LocationsFolder = _WorldOrigin:WaitForChild("Locations")
CommF_ = Remotes:WaitForChild("CommF_")

MainGui = Player:WaitForChild("PlayerGui"):WaitForChild("Main")
InventoryContainer = MainGui:WaitForChild("InventoryContainer")
FruitShop = MainGui:WaitForChild("FruitShop")

Complements = {
    loadstring(game:HttpGet('https://raw.githubusercontent.com/yanlvl99/Yan-s-Hub/refs/heads/main/utility.lua'))(),
    loadstring(game:HttpGet('https://raw.githubusercontent.com/yanlvl99/Yan-s-Hub/refs/heads/main/functions.lua'))(),
    loadstring(game:HttpGet('https://raw.githubusercontent.com/yanlvl99/Yan-s-Hub/refs/heads/main/infos.lua'))(),
}

CurrentSea = GetCurrentSea()

Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
Library:ToggleTransparency(false)
Window = Library:CreateWindow({
    Title = "Yan's Hub",
    SubTitle = "Blox Fruits "..CurrentSea,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl
})

function ProcessInterface(Table)
    for PageName, PageConfig in pairs(Table) do
        if PageConfig.Tab then
            Fluent:AddTab(PageConfig.Tab)
            
            if PageConfig.Content then
                for _, Element in ipairs(PageConfig.Content) do
                    local ElementType = Element.Type
                    Fluent["Add" .. ElementType](Fluent, Element)
                end
            end
        end
    end
end

Interface = {
    Main = {
        Tab = {Title = "Settings", Icon = "" },
        Content = {
            {Type = 'Paragraph',Name = 'Auto Farm Settings',Content = "Change the settings auto farm"},
        }
    }
}

ProcessInterface(Interface)
