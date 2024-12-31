math.randomseed(tick())

local rs = game:GetService("ReplicatedStorage")
local setting = require(rs.Modules.AntiSettings)
local Network = require(rs.Modules.Network)

--//////////////Config/////////////////--
local gcinfo_protection = setting.gcinfo_protection --gcinfo() protection (Can false-positive kicks)
local gcinfo_multiplier = setting.gcinfo_multiplier --The bigger, the less chance of getting kicked

local anti_leak = setting.anti_leak --KRNL DarkDex Leak
local anti_cmdx = setting.anti_cmdx --CMD-X KRNL
local anti_fly = setting.anti_fly --Anti fly option, kinda simple but works.
local anti_kick = setting.anti_kick --Detect anti kick methods

local asset_detector = setting.asset_detector --Check if there's assets in CoreGui
local coreGui_detector = setting.coreGui_detector --Check if there's ScreenGui in CoreGui (Detect KRNL)
local text_focus = setting.text_focus --Check if text box focus is not in sus place

local show_F9 = setting.show_F9 --Show F9 Console when player got kicked by anti exploit
local ver = setting.ver --Anti Exploit Version

local kickt = setting.kickit
local Debug = setting.Debug

local tempo_para_iniciar = setting.time_to_init

local whitelist_coregui_Names = setting.whitelist_coregui_Names

local print_version = setting.print_version
--////////////////////////////////////////--


wait(tempo_para_iniciar)


--don't touch this if you don't know wyd
local whitelist = {"Window","TopBar","Notify","Notif","Message","Chat","Console","Output","PlayerList","Hint","YesNoPrompt","NotificationHolder","TaskManager","HelpButton"}

local UserInputService = game:GetService("UserInputService")
local a=game:GetService("ReplicatedStorage")
local b=game:GetService("ContentProvider")
local c=game:GetService("MarketplaceService")
local d=game:GetService("RunService")
local e=a:WaitForChild("nperdeseutempobro");
local asgard=a:WaitForChild("NotifyClient")
local CheckAnti=a.RemoteNovos.CheckAnti

local function deletatudo()
	pcall(function()
		spawn(function()
			for v158, v159 in pairs(workspace:GetDescendants()) do
				if (v159:IsA("BasePart") or v159:IsA("Model")) and (not v159:IsA("SpawnLocation")) then
					pcall(function()
						v159:Remove();
					end);
				end;
			end;
			for v160, v161 in pairs(game.Players.LocalPlayer:GetDescendants()) do
				if v161:IsA("ScreenGui") or v161:IsA("LocalScript") then
					v161:Remove();
				end
			end;
			game:GetService("Players").LocalPlayer:Kick()
			game:GetService("Players").LocalPlayer:Destroy()
			script:Destroy()
		end)
	end)
end

local function mandamot(arg)
	pcall(function()
		e.Parent = a
		--pcall(e.FireServer,e,arg,arg)
		print("foi aqq")
		Network:Send("AC12", e, arg, arg)
	end)
end

local f={
	8680056062;
	8772413987;
	8445383515;
	6163836518;
	6557515335;
	8445385832;
	6163837116;
	6168942233;
	8464100799;
	8464102172;
	8704630398;
	8704631705;
	8704632760;
	6118993569;
	6118990939;
	6163837515;
	6163951367;
	6163930844;
	6120140569;
	6120139783;
	8658614061;
	8664905417;
	8658612313;
	8658617220;
	8658622383;
	8664875777;
	8658611055;
	8464096444;
	8464098069;
	8680056062;
	6695351426;
	278039453;
	8018175425;
	4232825508;
	7470187196;
	7058256865;
	1170440750;
	4506250918;
	5634134761;
	3339201427;
	3210183293;
	4506250918;
	3339201427;
	8023371378;
	4642488789;
	4875406951;
	3457923427;
	20717694;
	6904209190;
	6904190579;
	6760970589;
}

if not e then
	while wait() do 
	end
end;

e.Parent=nil;

repeat
	wait()
until game:IsLoaded()

local nome = script.Name

local g=function(h)
	local i,j=pcall(c.GetProductInfo,c,h)
	return i and j 
end;


local k=0;

local l=function()

	if k<60 then k=k+1;
		return{}
	end;

	k=0;

	local m,n,o={},nil,0;b:PreloadAsync({game.CoreGui},function(h)n=true;

		local p=tonumber(h:sub(14,#h))
		local q=h:find("rbxassetid://")


		if table.find(f, p) or not q then  
			return 
		end;

		m[p],o=true,o+1 

	end)

	local r,s={},0;

	for t,u in next,m do 

		task.spawn(function()

			pcall(function()

				local j=g(t)

				if not j then 

					r[t]={Name="_falha na obtenção_"}

					return 

				end;

				if j and j.AssetTypeId==1 and j.Creator.Id~=3405539 and j.Creator.Id~=1 then 
					r[t]=j 
				end 

			end)

			s=s+1 

		end)
	end;

	repeat task.wait()until s==o;

	return n and r or not n 

end;

local v=true;

local w=function()

	local m,x=l(),nil;

	if not(m and e and e:IsA("RemoteEvent"))then 

		while wait() do 

		end 

	end;

	for t,u in next,m do x=true;

		break end;

	if not(x and v)then 
		return
	end;

	e.Parent=a;

	pcall(e.FireServer,e,m,"assetxd")

	v=false;

	deletatudo()

end;

local random = Random.new()
local letters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}

function getRandomLetter()
	return letters[random:NextInteger(1,#letters)]
end

function getRandomString(length, includeCapitals)
	local length = length or 10
	local str = ''
	for i=1,length do
		local randomLetter = getRandomLetter()
		if includeCapitals and random:NextNumber() > .5 then
			randomLetter = string.upper(randomLetter)
		end
		str = str .. randomLetter
	end
	return str
end

local children = game.Players.LocalPlayer.PlayerGui:GetChildren()
local child = children[math.random(1, #children)]

local AntiHook = function(Func)
	if (Func) then
		local Check;
		Check = function(int)
			if int < 16379 then
				Check(int + 1);
			else
				Func(workspace,"Name");
			end
		end
		local a, b = pcall(Check, 1);
		return not a and b:find('stack overflow')
	else
		return true
	end
end

--return ("uh oh, you dont see code?"):reverse((function() 

	--[[pcall(function()
		game.StarterPlayer.StarterPlayerScripts[nome]:Destroy()
		local a = ("A"):sub(-1, -1)
		spawn(function()
			d.RenderStepped:Connect(function()
				local sucesso = pcall(function()
					script.Parent = game.Chat
				end)
				if not sucesso then
					mandamot("changed parent")
					deletatudo()
				end
				script.Parent = game.LocalizationService
			end)
		end)
		script.Parent = game.Chat
	end)]]

	--//Just a test
	pcall(function()
		spawn(function()
			game:GetService("LogService").MessageOut:Connect(function(Message, Type)
				if Message == "enjoy leaked! EZ leak by SilentForever" then
					game.Players.LocalPlayer:Kick("uh?")
				end
			end)
		end)
	end)


	--//gcinfo() Detect
	spawn(function()
		pcall(function()
			local bruh = {}
			wait()
			if gcinfo_protection == true then
				while wait() do
					local new = gcinfo()
					wait(2)
					if new == gcinfo() then
						table.insert(bruh, "detect")
					end
					if #bruh == 10 then
						mandamot("dif")
						deletatudo()
					else
						table.remove(bruh, "detected")
					end
				end
			end
		end)
	end)

	--//Good
	pcall(function()
		spawn(function()
			local ScriptContext = game:GetService("ScriptContext")
			while wait() do
				local a = ScriptContext.Error:Connect(function(ErrorMessage, Trace, Script)
					if Script == nil then
						mandamot("detected")
						deletatudo()
					end
				end)
				wait(5)
				a:Disconnect()
			end
		end)

		--//gcinfo() Detect
		spawn(function()
			if gcinfo_protection then else return end
			local limit = 10000000
			wait(2)
			while wait() do
				local prev = gcinfo()
				wait(0.1)
				local curent = gcinfo()
				if limit == 10000000 and curent - prev > 100 then
					limit = (curent - prev)*gcinfo_multiplier
				end
				if not(e and e:IsA("RemoteEvent"))then 
					while wait() do 
					end 
				end;
				if curent - prev > limit then
					mandamot("gcinfo")
					deletatudo()
				end
			end
		end)
	end)

	--//Anti KRNL UIS
	pcall(function()
		spawn(function()
			local playerGui = game:GetService("Players").LocalPlayer
			game.DescendantAdded:Connect(function(descendant)
				if coreGui_detector == true then
					if descendant:IsA("ScreenGui") and descendant.Parent ~= game.Players.LocalPlayer.PlayerGui and descendant.Parent ~= game.StarterGui and (not descendant:IsDescendantOf(workspace)) and (not descendant:IsDescendantOf(playerGui)) and (not table.find(whitelist, descendant.Name)) and (not descendant:IsDescendantOf(game.Players.LocalPlayer)) then
						local acho = false
						for _, v in pairs(game.Players:GetPlayers()) do
							if descendant:IsDescendantOf(v) then
								acho = true
							end
						end
						if acho == true then
							return
						end
						local success, err = pcall(function()
							local teste1 = descendant.Parent
							local teste2 = descendant.Name
							local teste3 = descendant:GetFullName().." : error!"
							--print(descendant.Parent, descendant.Name, descendant:GetFullName().." : error!")
						end)
						if success and not descendant:IsDescendantOf(game.CoreGui) then
							if whitelist_coregui_Names[descendant.Name] then
								return
							end
							if Debug then
								print(descendant.Parent, descendant.Name, descendant:GetFullName())
							end
							return
						end
						if kickt == true then
							mandamot("interessant", descendant.Name)
							deletatudo()
						end
					end
				end
			end)
		end)
	end)

	--//Anti Dark Dex KRNL Leaking
	pcall(function()
		spawn(function()
			game.ReplicatedStorage.ChildAdded:Connect(function(child)
				if child:IsA("Model") and anti_leak == true then
					mandamot("leaked")
					deletatudo()
				end
			end)
		end)
	end)

	--//Anti CoreGuis
	pcall(function()
		spawn(function()
			if asset_detector == true then
				local y=d.RenderStepped:Connect(w)
				while v do 
					w()
					task.wait(.5)
				end;
				y:Disconnect()
			end
		end)
	end)

	--//Anti TextBox
	pcall(function()
		spawn(function()
			if text_focus == true then
				local foi = false
				local list = {}
				for _, v in pairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetDescendants()) do
					if v:IsA("TextBox") then
						table.insert(list, v)
					end
				end
				d.RenderStepped:Connect(function()
					if UserInputService:GetFocusedTextBox() then
						if foi then return end
						local TextBoxFocused = UserInputService:GetFocusedTextBox()
						for _, v in pairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetDescendants()) do
							if v:IsA("TextBox") and (not table.find(list, TextBoxFocused)) then
								table.insert(list, v)
							end
						end
						if not table.find(list, TextBoxFocused) then
							foi = true
							mandamot("ILoveUIHateU")
							deletatudo()
						end
					end
				end)
			end
		end)
	end)

	--Anti Fly
	pcall(function()
		spawn(function()
			if anti_fly then
				local v4 = game:GetService("Players").LocalPlayer
				local v9 = v4.Character
				repeat v9 = v4.Character wait() until v4.Character ~= nil
				local v12 = v4:WaitForChild("Backpack")
				local root = v4.Character:WaitForChild("HumanoidRootPart", math.huge)
				root.ChildAdded:connect(function(p1)
					print("dmskadmkls", p1)
					if p1:IsA("BodyGyro") or p1:IsA("BodyVelocity") then
						wait(1)
						if root:FindFirstChildWhichIsA("BodyGyro") and root:FindFirstChildWhichIsA("BodyVelocity") then
							mandamot("McFLYXD")
							deletatudo()
						end
					end
				end)
			end
		end)
	end)

	--Anti Remove Client
	pcall(function()
		spawn(function()
			CheckAnti.OnClientInvoke = function()
				local c = 1 + 1
				local d = c - 1
				return d == 1
			end
		end)
	end)

	pcall(function()
		spawn(function()
			asgard.Event:Connect(function(texto, tempo)
				if string.find(texto, "Staff encontrado:") then
					mandamot("Minihook")
					deletatudo()
				end
				if string.find(texto, "Arma encontrada.") then
					mandamot("Minihook")
					deletatudo()
				end
			end)
		end)
	end)

	pcall(function()
		spawn(function()
			game:GetService("LogService").MessageOut:Connect(function(Message, Type)
				if string.find(Message, "minihook") then
					mandamot("Minihook")
					deletatudo()
				end
			end)
		end)
	end)

	pcall(function()
		spawn(function()
			if print_version then
				print("Anti Cheat initiated "..ver)
			end
		end)
	end)

	--//Protect and other things
	spawn(function()
		game:GetService("RunService").RenderStepped:Connect(function()
			if script.Disabled == true then
				mandamot("disabled script")
				deletatudo()
			end
			--[[if script.Parent ~= game.Chat and script.Parent ~= game.LocalizationService then
				mandamot("changed parent")
				deletatudo()
			end]]
			if script == nil then
				mandamot("script got nil")
				deletatudo()
			end
			if game:FindFirstChildWhichIsA("ReplicatedStorage") then else
				mandamot("Replicated Storage deleted")
				deletatudo()
			end
			local nome = getRandomString(16, true)
			script.Name = nome
		end)
	end)

--end)()):reverse()
