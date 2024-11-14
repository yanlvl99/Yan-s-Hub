Format, State, Tool, Roblox = {}, {}, {}, ()
Format.__index, State.__index, Tool.__index, Roblox.__index = Format, State, Tool, Roblox
Get, Set, Roblox = { Format = setmetatable({}, Format), State = setmetatable({}, State) }, { Tool = setmetatable({}, Tool) }, {Roblox = setmetatable({},Roblox)}

function Format:Position(arg) if typeof(arg) == "BasePart" then return arg.Position elseif typeof(arg) == "Vector3" or typeof(arg) == "CFrame" then return arg.Position or arg elseif typeof(arg) == "Model" then return arg.PrimaryPart and arg.PrimaryPart.Position end end
function Format:TextColor(t,c) return '<font color="'..c..'">'..t..'</font>' end
function Format:FormatNumber(n,s) s = s or {"K", "M", "B"} for i, sfx in ipairs(s) do if n >= 1000 then n = n / 1000 else return math.floor(n) .. sfx end end end
function Format:Price(M,F) local t="" if M and M > 0 then t = Get.Format:TextColor("$"..self:FormatNumber(M),"rgb(0,255,0)") end if F and F > 0 then if t ~= "" then t = t.." e " end t = t .. Get.Format:TextColor(self:FormatNumber(F).." Frags", "rgb(128,0,128)") end return t end
function Get:Distance(a, b) return (Get.Format:Position(a) - Get.Format:Position(b)).Magnitude end
function State:Humanoid(s) return game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and Player.Character.Humanoid:GetState() == Enum.HumanoidStateType[s] or false end
function State:NetworkOwner(a) if not a:IsA("BasePart") then return end return isnetworkowner and isnetworkowner(a) or (Player.Character:FindFirstChild("HumanoidRootPart") and Get:Distance(Player.Character.HumanoidRootPart, a) <= 350) end
function Tool:Equip(t) pcall(function() local tool = Player.Backpack:FindFirstChild(t) if tool then Player.Character.Humanoid:EquipTool(tool) end end) end
function Tool:Unequip(t) pcall(function() local tool = Player.Character:FindFirstChild(t) if tool then tool.Parent = Player.Backpack end end) end
function Roblox:Rejoin() TeleportService:Teleport(game.PlaceId, Player) end
