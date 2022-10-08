ESX = nil
local PlayerData = {}
local bypass = false
local wasblitzed = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
end)





Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsPedInAnyVehicle(PlayerPedId()) then
            if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
                if not wasblitzed then
                    for k, v in pairs(Config.blitzer) do
                        local dist = #(GetEntityCoords(PlayerPedId()) - v)
                        if dist < Config.dist then
                            for a, b in pairs(Config.listedjobs) do 
                                if PlayerData.job.name == b then
                                    bypass = true
                                end
                            end
                            if not bypass then
                                local kmh = math.ceil(GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId())) * 3.6)
                                local kmhno = kmh - Config.toleranz
                                if kmhno > Config.maxspeed then
                                    local money = Config.money
                                    if Config.IncreaseMoneyOnHigherSpeeds == true then
                                        local n = kmh - Config.maxspeed
                                        local money2 = math.ceil(Config.money + n * Config.amountperkmh)
                                        TriggerServerEvent("speedcam:pay", money2)
                                        Config.notify("You were flashed in a  "..Config.maxspeed.." Zone with a speed of"..kmh.." !")
                                    else
                                        TriggerServerEvent("speedcam:pay", money)
                                        Config.notify("You were flashed in a  "..Config.maxspeed.." Zone with a speed of"..kmh.." !")
                                    end
                                    wasblitzed = true
                                    Wait(Config.secondstogetblitzed)
                                    wasblitzed = false
                                end
                            end
                            bypass = false
                        end
                    end
                end
            end
        end
    end
end)



Citizen.CreateThread(function()
    if Config.useblips == true then
        for k,v in ipairs(Config.blitzer) do
                local speed_blip = AddBlipForCoord(v)
                SetBlipSprite(speed_blip, Config.SpeedBlip)
                SetBlipColour(speed_blip, Config.SpeedBlipColor)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(Config.SpeedBlipName)
                EndTextCommandSetBlipName(speed_blip)
                SetBlipDisplay(speed_blip, 2)
                SetBlipScale(speed_blip, 0.6)
                SetBlipAsShortRange(speed_blip, true)
        end
    end
end)