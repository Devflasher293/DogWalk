ESX = nil
local cooldownTimer = {}


TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)


RegisterNetEvent("flasher-dogwalk:DogWalkDone")
AddEventHandler("flasher-dogwalk:DogWalkDone", function()
    local sRc = source 
    local xPlayer = ESX.GetPlayerFromId(sRc)
    local reward = 200

    xPlayer.addMoney(reward)
    TriggerClientEvent('esx:showNotification', sRc, 'Tack för du rasta min hund. Här har du ~g~200~s~ KR')
    Citizen.Wait(1000)
end)


RegisterNetEvent("flasher-dogwalk:DogDeath")
AddEventHandler("flasher-dogwalk:DogDeath", function()
    local sRc = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() <= 99 then
        xPlayer.removeAccountMoney('bank', 100)
    elseif xPlayer.getMoney() >= 99 then
        xPlayer.removeMoney(100)
    end
end)

