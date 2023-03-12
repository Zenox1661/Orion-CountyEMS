--[[

  /$$$$$$            /$$                           /$$$$$$$                                /$$                                                         /$$    
 /$$__  $$          |__/                          | $$__  $$                              | $$                                                        | $$    
| $$  \ $$  /$$$$$$  /$$  /$$$$$$  /$$$$$$$       | $$  \ $$  /$$$$$$  /$$    /$$ /$$$$$$ | $$  /$$$$$$   /$$$$$$  /$$$$$$/$$$$   /$$$$$$  /$$$$$$$  /$$$$$$  
| $$  | $$ /$$__  $$| $$ /$$__  $$| $$__  $$      | $$  | $$ /$$__  $$|  $$  /$$//$$__  $$| $$ /$$__  $$ /$$__  $$| $$_  $$_  $$ /$$__  $$| $$__  $$|_  $$_/  
| $$  | $$| $$  \__/| $$| $$  \ $$| $$  \ $$      | $$  | $$| $$$$$$$$ \  $$/$$/| $$$$$$$$| $$| $$  \ $$| $$  \ $$| $$ \ $$ \ $$| $$$$$$$$| $$  \ $$  | $$    
| $$  | $$| $$      | $$| $$  | $$| $$  | $$      | $$  | $$| $$_____/  \  $$$/ | $$_____/| $$| $$  | $$| $$  | $$| $$ | $$ | $$| $$_____/| $$  | $$  | $$ /$$
|  $$$$$$/| $$      | $$|  $$$$$$/| $$  | $$      | $$$$$$$/|  $$$$$$$   \  $/  |  $$$$$$$| $$|  $$$$$$/| $$$$$$$/| $$ | $$ | $$|  $$$$$$$| $$  | $$  |  $$$$/
 \______/ |__/      |__/ \______/ |__/  |__/      |_______/  \_______/    \_/    \_______/|__/ \______/ | $$____/ |__/ |__/ |__/ \_______/|__/  |__/   \___/  
                                                                                                        | $$                                                  
                                                                                                        | $$                                                  
                                                                                                        |__/      

]]

CountyEMS = false

TriggerEvent('chat:addSuggestion', '/'..Config.Command, 'Call the County EMS.')

RegisterNetEvent('orion-countyems:CallEMS')
AddEventHandler('orion-countyems:CallEMS', function(xUser)
    local ped = PlayerPedId()
    local currentPos = GetEntityCoords(ped)
    exports['t-notify']:Custom({ style  =  'info', duration  =  8000, title  =  'San Andreas County EMS', message  =  'County EMS are on route to your location, please be patient!', sound  =  false })
    Citizen.Wait(5000)
    exports['progressBars']:startUI(5000, "County EMS Have Been Dispatched")
    Citizen.Wait(6000)
    exports['progressBars']:startUI(5000, "County EMS Have Arrived")
    Citizen.Wait(6000)
    exports['progressBars']:startUI(5000, "Paramedics are tending your wounds")
    Citizen.Wait(6000)
    exports['progressBars']:startUI(5000, "Being prepared for transport")
    Citizen.Wait(6000)
    print(currentPos)
    SetEntityCoords(ped, 1839.41, 3672.90, 34.28, false, false, false, true)
    currentPos = GetEntityCoords(ped)
    print(currentPos)
    exports['t-notify']:Custom({ style  =  'info', duration  =  8000, title  =  'San Andreas County EMS', message  =  'County EMS have successfully resuscitated you and transported you to Sandy Medical!', sound  =  false })
    TriggerEvent('orion-countyems:RevivexUser')
end)

function revivePed(ped)
    local playerPos = GetEntityCoords(ped, true)
    isDead = false
    timerCount = reviveWait
    NetworkResurrectLocalPlayer(playerPos, true, true, false)
    SetPlayerInvincible(ped, false)
    ClearPedBloodDamage(ped)
    deadCheck = false;
end
RegisterNetEvent('orion-countyems:RevivexUser')
AddEventHandler('orion-countyems:RevivexUser', function()
	local ped = GetPlayerPed(-1);
	if IsEntityDead(ped) then 
		revivePed(ped);
	end
end)