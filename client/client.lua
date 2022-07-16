local big_fireworks_objects = {}
local small_fireworks_objects = {}
local big_firecracker_object
local small_firecracker_object
local smoke_campfire_objects = {}

-- Función para cargar animación. 
function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function GetPlayers()
    local players = {}
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
        end
    end
    return players
end


-- BIG FIREWORKS
RegisterNetEvent('xakra_fireworks:big_fireworks')
AddEventHandler('xakra_fireworks:big_fireworks', function()
    local pcoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
    local pHead = GetEntityHeading(myPed)

    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 7000, true, false, false, false)
    Citizen.Wait(7000)

    local big_fireworks_object = CreateObject("p_wickerbox01x", pcoords.x, pcoords.y, pcoords.z-1.20, true, true, false)
    PlaceObjectOnGroundProperly(object)
    SetEntityHeading(objec, pHead)
    SetEntityAlpha(objec, 51)

    table.insert(big_fireworks_objects, big_fireworks_object)

    TriggerServerEvent("xakra_fireworks:players",pcoords,"big_fireworks")
end)

RegisterNetEvent('xakra_fireworks:big_fireworks_players')
AddEventHandler('xakra_fireworks:big_fireworks_players', function(pcoords)

    Citizen.Wait(5000)
    RequestNamedPtfxAsset(GetHashKey('scr_ind1'))
    while not HasNamedPtfxAssetLoaded(GetHashKey('scr_ind1')) do
        Wait(10)
    end
    UseParticleFxAsset('scr_ind1')
    local fireworks = StartParticleFxLoopedAtCoord('scr_ind1_firework', pcoords, 0.0,0.0,0.0, 0.70, false, false, false, true) 

    Citizen.InvokeNative(0x9DDC222D85D5AF2A, fireworks, 10.0)

    SetParticleFxLoopedAlpha(fireworks, 1.0)

    for x=0, Config.big_fireworks_time,1 do
        local num = math.random(100,800)
        Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z, 32, 0xF36AD9AC, 0.0, true, false, true) -- Sonido de salida
        Wait(100)
        Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z +60, 25, 0xF36AD9AC, 0.0, true, true, true) -- Sonido explosión
        Wait(num)
    end
    StopParticleFxLooped(fireworks, true)

    Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z, 32, 0xF36AD9AC, 0.0, true, false, true) -- Sonido de salida
    Wait(100)
    Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z +60, 25, 0xF36AD9AC, 0.0, true, true, true) -- Sonido explosión

    Citizen.Wait(10000)
    for _, object in pairs(big_fireworks_objects) do
        DeleteObject(object)
    end
end)

-- SMALL FIREWORKS
RegisterNetEvent('xakra_fireworks:small_fireworks')
AddEventHandler('xakra_fireworks:small_fireworks', function()
    local pcoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
    local pHead = GetEntityHeading(myPed)

    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 7000, true, false, false, false)
    Citizen.Wait(7000)

    local small_fireworks_object = CreateObject("p_wickerbox01x", pcoords.x, pcoords.y, pcoords.z-1.20, true, true, false)
    PlaceObjectOnGroundProperly(object)
    SetEntityHeading(objec, pHead)
    SetEntityAlpha(objec, 51)

    table.insert(small_fireworks_objects, small_fireworks_object)

    TriggerServerEvent("xakra_fireworks:players",pcoords,"small_fireworks")
end)

RegisterNetEvent('xakra_fireworks:small_fireworks_players')
AddEventHandler('xakra_fireworks:small_fireworks_players', function(pcoords)

    Citizen.Wait(5000)
    RequestNamedPtfxAsset(GetHashKey('anm_ind'))
    while not HasNamedPtfxAssetLoaded(GetHashKey('anm_ind')) do
        Wait(10)
    end
    UseParticleFxAsset('anm_ind')
    local fireworks = StartParticleFxLoopedAtCoord('ent_anim_ind_firework', pcoords, 0.0,0.0,0.0, 0.20, false, false, false, true) 
    Citizen.InvokeNative(0x9DDC222D85D5AF2A, fireworks, 10.0)
    SetParticleFxLoopedAlpha(fireworks, 1.0)


    for x=0, Config.small_fireworks_time,1 do
        local num = math.random(100,800)
        Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z, 32, 0xF36AD9AC, 0.0, true, false, true) -- Sonido de salida
        Wait(100)
        Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z+10, 12, 0xF36AD9AC, 0.0, true, true, true) -- Sonido explosión
        Wait(num)
    end
    StopParticleFxLooped(fireworks, true)

    Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z, 32, 0xF36AD9AC, 0.0, true, false, true) -- Sonido de salida
    Wait(100)
    Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z+10, 12, 0xF36AD9AC, 0.0, true, true, true) -- Sonido explosión

    Citizen.Wait(10000)
    for _, object in pairs(small_fireworks_objects) do
        DeleteObject(object)
    end
end)

-- BIG FIRECRACKER
RegisterNetEvent('xakra_fireworks:big_firecracker')
AddEventHandler('xakra_fireworks:big_firecracker', function()
    local pcoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 15.0, 0.0)

    local animDict = "amb_camp@world_camp_jack_throws_rocks_casual@male_a@wip_base"
    local animName = "base"
    local speed = 8.0 
    local speedX = 3.0 
    local duration = 6500
    local flags = 2
    loadAnimDict(animDict) -- Función para cargar animación.
    TaskPlayAnim(PlayerPedId(), animDict, animName, speed, speedX, duration, flags, 0, 0, 0, 0 )
    
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local big_firecracker_object = CreateObject(GetHashKey("w_throw_dynamite01"), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(PlayerPedId(), "IK_R_Hand")
    AttachEntityToEntity(big_firecracker_object, PlayerPedId(), righthand, 0.06, 0.0, -0.05, -90.0, 0.0, -45.0, true, true, false, true, 1, true)

    Citizen.Wait(4500) -- Espera para animaciones.
    DeleteObject(big_firecracker_object)
    Citizen.Wait(1500) -- Espera para animaciones.

    TriggerServerEvent("xakra_fireworks:players",pcoords,"big_firecracker")
end)

RegisterNetEvent('xakra_fireworks:big_firecracker_players')
AddEventHandler('xakra_fireworks:big_firecracker_players', function(pcoords)
    Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z-0.50, 31, 0xC22E127D, 0.0, true, false, true)
end)

-- SMALL FIRECRACKER
RegisterNetEvent('xakra_fireworks:small_firecracker')
AddEventHandler('xakra_fireworks:small_firecracker', function()
    local pcoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 15.0, 0.0)

    local animDict = "amb_camp@world_camp_jack_throws_rocks_casual@male_a@wip_base"
    local animName = "base"
    local speed = 8.0 
    local speedX = 3.0 
    local duration = 6500
    local flags = 2
    loadAnimDict(animDict) -- Función para cargar animación.

    TaskPlayAnim(PlayerPedId(), animDict, animName, speed, speedX, duration, flags, 0, 0, 0, 0 )

    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local small_firecracker_object = CreateObject(GetHashKey("mp001_p_mp_dynamite01x_noexp"), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(PlayerPedId(), "IK_R_Hand")
    AttachEntityToEntity(small_firecracker_object, PlayerPedId(), righthand, 0.09, 0.0, -0.04, -90.0, 0.0, -43.0, true, true, false, true, 1, true)

    Citizen.Wait(4500) -- Espera para animaciones.
    DeleteObject(small_firecracker_object)
    Citizen.Wait(1500) -- Espera para animaciones.
    TriggerServerEvent("xakra_fireworks:players",pcoords,"small_firecracker")
end)

RegisterNetEvent('xakra_fireworks:small_firecracker_players')
AddEventHandler('xakra_fireworks:small_firecracker_players', function(pcoords)
    Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z-0.50, 12, 0x2FDA2B4A, 0.0, true, false, true)
end)

-- SMOKE CAMPFIRE
RegisterNetEvent('xakra_fireworks:smoke_campfire')
AddEventHandler('xakra_fireworks:smoke_campfire', function()
    local pcoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
    local pHead = GetEntityHeading(myPed)

    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 7000, true, false, false, false)
    Citizen.Wait(12000)

    local smoke_campfire_object = CreateObject("p_campfire01x", pcoords.x, pcoords.y, pcoords.z-1.20, true, true, false)
    PlaceObjectOnGroundProperly(object)
    SetEntityHeading(objec, pHead)
    SetEntityAlpha(objec, 51)

    table.insert(smoke_campfire_objects, smoke_campfire_object)

    TriggerServerEvent("xakra_fireworks:players",pcoords,"smoke_campfire")
end)

RegisterNetEvent('xakra_fireworks:smoke_campfire_players')
AddEventHandler('xakra_fireworks:smoke_campfire_players', function(pcoords)
    RequestNamedPtfxAsset(GetHashKey('SCR_ADV_SOK'))
    while not HasNamedPtfxAssetLoaded(GetHashKey('SCR_ADV_SOK')) do
        Wait(10)
    end

    UseParticleFxAsset("SCR_ADV_SOK")
    local smoke = StartParticleFxLoopedAtCoord("scr_adv_sok_torchsmoke",pcoords.x, pcoords.y, pcoords.z-6.22, 0.0,0.0,0.0, 8.0, false, false, false, true)
    Citizen.InvokeNative(0x9DDC222D85D5AF2A, smoke, 15.0)
    SetParticleFxLoopedAlpha(smoke, 1.0)
    SetParticleFxLoopedColour(smoke, 1.0,1.0,1.0, false)

    
    Citizen.Wait(Config.smoke_campfire_time)
    StopParticleFxLooped(smoke, true)

    for _, object in pairs(smoke_campfire_objects) do
        DeleteObject(object)
        Wait(25000)
    end
end)