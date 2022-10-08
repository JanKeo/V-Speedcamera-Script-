Config = {}


Config.blitzer = { --speedcam Zones
    vector3(311.92, -393.44, 45.22),
}

Config.listedjobs = { -- Jobs that wont get flashed
    "police"
}


Config.dist = 20 --distance to speedcamera to get flashed
Config.maxspeed = 100 -- speed to get flashed
Config.toleranz = 5 -- how much faster then the maxspeed you can drive to not get flashed
Config.money = 1000 -- how much money you have to pay when you get flashed
Config.IncreaseMoneyOnHigherSpeeds = true -- should the money increase for every kmh how drive too fast
Config.amountperkmh = 50 -- how much should the money increase on every kmh you drive too fast
Config.useblips = true -- Speedcams will be as Blips on the Map
Config.SpeedBlip = 483 -- Blip ID
Config.SpeedBlipColor = 1 -- Blip Color
Config.SpeedBlipName = "Blitzer (" .. Config.maxspeed .. " km/h)" -- Blip Name
Config.secondstogetblitzed = 10*1000 -- cooldown to get flashed again



Config.notify = function(msg) -- notify system
    ESX.ShowNotification(msg)
end