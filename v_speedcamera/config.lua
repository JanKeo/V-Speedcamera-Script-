Config = {}


Config.blitzer = {
    vector3(311.92, -393.44, 45.22),
}

Config.listedjobs = {
    "police"
}


Config.dist = 20
Config.maxspeed = 100
Config.toleranz = 5
Config.money = 1000
Config.IncreaseMoneyOnHigherSpeeds = true
Config.amountperkmh = 50
Config.useblips = true
Config.SpeedBlip = 483
Config.SpeedBlipColor = 1
Config.SpeedBlipName = "Blitzer (" .. Config.maxspeed .. " km/h)"
Config.secondstogetblitzed = 10*1000



Config.notify = function(msg)
    ESX.ShowNotification(msg)
end