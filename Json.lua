local Json =
{
   encode  =
   function (self, data)
      return game:GetService("HttpService"):JSONEncode(data);
   end;
   decode  =
   function (self, data)
      return game:GetService("HttpService"):JSONDecode(data);
   end;
}
return Json;
