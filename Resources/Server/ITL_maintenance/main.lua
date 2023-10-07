pluginName = "ITL_maintenance"
pluginVersion = "0.0.1"

CFG = require("cfg")

function isUserAllowed(playerName)
    for i = 1, #pluginConfig.allowedUsers do
        if pluginConfig.allowedUsers[i] == playerName then
            return true
        end
    end
    return false
end

function onInit()

    pluginConfig = CFG.getLocal("main")

    function OnPlayerAuthHandler(playerName, playerRole, isGuest, identifiers)
        if pluginConfig.isEnabled == true then
            local res = isUserAllowed(playerName)
            print(res)
            if res ~= true then
                return pluginConfig.maintenanceMessage
            end
        end
    end
    MP.RegisterEvent("onPlayerAuth", "OnPlayerAuthHandler")

end
