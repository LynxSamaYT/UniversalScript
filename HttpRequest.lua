local HttpRequest = {}
HttpRequest.__index = HttpRequest

function HttpRequest.new()
    local self = setmetatable({}, HttpRequest)
    return self
end

function HttpRequest:PostAsync(url, headers, body)
    local request = http.request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    return request
end

return HttpRequest
