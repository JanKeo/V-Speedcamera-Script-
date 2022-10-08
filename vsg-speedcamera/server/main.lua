ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)


RegisterServerEvent("speedcam:pay", function(money)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney('bank', money)
end)