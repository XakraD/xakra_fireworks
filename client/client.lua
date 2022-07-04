-- Función para cargar animación. 
function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

-- BIG FIREWORKS
RegisterNetEvent('xakra_fireworks:big_fireworks')
AddEventHandler('xakra_fireworks:big_fireworks', function()
    local pcoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
    local pHead = GetEntityHeading(myPed)

    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 7000, true, false, false, false)
    Citizen.Wait(7000)

    local object = CreateObject("p_wickerbox01x", pcoords.x, pcoords.y, pcoords.z-1.20, true, true, false)
    SetEntityHeading(objec, pHead)
    SetEntityAlpha(objec, 51)

    Citizen.Wait(5000)
    RequestNamedPtfxAsset(GetHashKey('scr_ind1'))
    while not HasNamedPtfxAssetLoaded(GetHashKey('scr_ind1')) do
        Wait(10)
    end
    UseParticleFxAsset('scr_ind1')
    fireworks = StartParticleFxLoopedAtCoord('scr_ind1_firework', pcoords, 0.0,0.0,0.0, 0.70, false, false, false, true) 

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

    Citizen.Wait(10000)
    DeleteObject(object)
end)

-- SMALL FIREWORKS
RegisterNetEvent('xakra_fireworks:small_fireworks')
AddEventHandler('xakra_fireworks:small_fireworks', function()
    local pcoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
    local pHead = GetEntityHeading(myPed)

    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 7000, true, false, false, false)
    Citizen.Wait(7000)

    local object = CreateObject("p_wickerbox01x", pcoords.x, pcoords.y, pcoords.z-1.20, true, true, false)
    SetEntityHeading(objec, pHead)
    SetEntityAlpha(objec, 51)

    Citizen.Wait(5000)
    RequestNamedPtfxAsset(GetHashKey('anm_ind'))
    while not HasNamedPtfxAssetLoaded(GetHashKey('anm_ind')) do
        Wait(10)
    end
    UseParticleFxAsset('anm_ind')
    fireworks = StartParticleFxLoopedAtCoord('ent_anim_ind_firework', pcoords, 0.0,0.0,0.0, 0.20, false, false, false, true) 
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

    Citizen.Wait(10000)
    DeleteObject(object)
end)

-- FIRECRACKER
RegisterNetEvent('xakra_fireworks:firecracker')
AddEventHandler('xakra_fireworks:firecracker', function()
    local pcoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 15.0, 0.0)

    local animDict = "amb_camp@world_camp_jack_throws_rocks_casual@male_a@wip_base"
    local animName = "base"
    local speed = 8.0 
    local speedX = 3.0 
    local duration = 6500
    local flags = 2
    loadAnimDict(animDict) -- Función para cargar animación.
    TaskPlayAnim(PlayerPedId(), animDict, animName, speed, speedX, duration, flags, 0, 0, 0, 0 )
    Citizen.Wait(7000) -- Espera para animaciones.

    for x=0, Config.firecracker_time,1 do
        local num = math.random(50,200)
        Citizen.InvokeNative(0x53BA259F3A67A99E, pcoords.x, pcoords.y, pcoords.z-1.00, 6, 0x7DD07579, 0.0, true, false, true) -- Sonido de salida
        Wait(num)
    end

    Citizen.Wait(10000)
    DeleteObject(object)
end)

-- SMOKE CAMPFIRE
RegisterNetEvent('xakra_fireworks:smoke_campfire')
AddEventHandler('xakra_fireworks:smoke_campfire', function()
    local pcoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
    local pHead = GetEntityHeading(myPed)

    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 7000, true, false, false, false)
    Citizen.Wait(12000)

    local object = CreateObject("p_campfire01x", pcoords.x, pcoords.y, pcoords.z-1.20, true, true, false)
    SetEntityHeading(objec, pHead)
    SetEntityAlpha(objec, 51)

    RequestNamedPtfxAsset(GetHashKey('SCR_ADV_SOK'))
    while not HasNamedPtfxAssetLoaded(GetHashKey('SCR_ADV_SOK')) do
        Wait(10)
    end

    UseParticleFxAsset("SCR_ADV_SOK")
    smoke = StartParticleFxLoopedAtCoord("scr_adv_sok_torchsmoke",pcoords.x, pcoords.y, pcoords.z-6.22, 0.0,0.0,0.0, 8.0, false, false, false, true)
    Citizen.InvokeNative(0x9DDC222D85D5AF2A, smoke, 15.0)
    SetParticleFxLoopedAlpha(smoke, 1.0)
    SetParticleFxLoopedColour(smoke, 1.0,1.0,1.0, false)

    
    Citizen.Wait(Config.smoke_campfire_time)
    StopParticleFxLooped(smoke, true)
    DeleteObject(object)
end)