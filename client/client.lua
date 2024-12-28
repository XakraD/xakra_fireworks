local Particles = {}
local Objects = {}

-- BIG FIREWORKS
RegisterNetEvent('xakra_fireworks:big_fireworks')
AddEventHandler('xakra_fireworks:big_fireworks', function()
    TaskStartScenarioInPlace(PlayerPedId(), joaat('WORLD_HUMAN_CROUCH_INSPECT'), 7000, true, false, false, false)
    Wait(7000)

    local big_fireworks_object = CreateObject('p_wickerbox01x', GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0), true, true, false)
    table.insert(Objects, big_fireworks_object)
    PlaceObjectOnGroundProperly(big_fireworks_object)
    SetEntityHeading(big_fireworks_object, GetEntityHeading(PlayerPedId()))

    Wait(5000)
    local coords = GetEntityCoords(big_fireworks_object)
    TriggerServerEvent('xakra_fireworks:players', coords, 'big_fireworks')

    local stop = false
    SetTimeout(Config.big_fireworks_time * 1000, function()
        stop = true
    end)

    repeat
        AddExplosionWithUserVfx(coords, 32, 0x2FDA2B4A, 0.0, Config.EnableSound, false, false, 0.0)
        Wait(100)
        AddExplosionWithUserVfx(coords.x, coords.y, coords.z + 60, 25, 0x2FDA2B4A, 0.0, Config.EnableSound, true, false, 0.0)
        Wait(math.random(100,800))
    until stop

    Wait(500)
    AddExplosionWithUserVfx(coords, 32, 0x2FDA2B4A, 0.0, Config.EnableSound, false, false, 0.0) 
    Wait(100)
    AddExplosionWithUserVfx(coords.x, coords.y, coords.z + 60, 25, 0x2FDA2B4A, 0.0, Config.EnableSound, true, false, 0.0) 

    Wait(10000)
    DeleteObject(big_fireworks_object)
end)

RegisterNetEvent('xakra_fireworks:big_fireworks_players')
AddEventHandler('xakra_fireworks:big_fireworks_players', function(coords)
    LoadPtfxAsset('scr_ind1')
    local fireworks = StartParticleFxLoopedAtCoord('scr_ind1_firework', coords, 0.0, 0.0, 0.0, 1.0, false, false, false, true)
    table.insert(Particles, fireworks)

    Wait(Config.big_fireworks_time * 1000)

    StopParticleFxLooped(fireworks, true)
end)

-- SMALL FIREWORKS
RegisterNetEvent('xakra_fireworks:small_fireworks')
AddEventHandler('xakra_fireworks:small_fireworks', function()
    TaskStartScenarioInPlace(PlayerPedId(), joaat('WORLD_HUMAN_CROUCH_INSPECT'), 7000, true, false, false, false)
    Wait(7000)

    local small_fireworks_object = CreateObject('p_wickerbox01x', GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0), true, true, false)
    table.insert(Objects, small_fireworks_object)
    PlaceObjectOnGroundProperly(small_fireworks_object)
    SetEntityHeading(small_fireworks_object, GetEntityHeading(PlayerPedId()))

    Wait(5000)
    local coords = GetEntityCoords(small_fireworks_object)
    TriggerServerEvent('xakra_fireworks:players', coords, 'small_fireworks')

    local stop = false
    SetTimeout(Config.small_fireworks_time * 1000, function()
        stop = true
    end)

    repeat
        AddExplosionWithUserVfx(coords, 32, 0x2FDA2B4A, 0.0, Config.EnableSound, false, false, 0.0)  
        Wait(100)
        AddExplosionWithUserVfx(coords.x, coords.y, coords.z + 10, 12, 0x2FDA2B4A, 0.0, Config.EnableSound, true, false, 0.0)
        Wait(math.random(100,800))
    until stop

    Wait(500)
    AddExplosionWithUserVfx(coords, 32, 0x2FDA2B4A, 0.0, Config.EnableSound, false, false, 0.0)  
    Wait(100)
    AddExplosionWithUserVfx(coords.x, coords.y, coords.z + 10, 12, 0x2FDA2B4A, 0.0, Config.EnableSound, true, false, 0.0)

    Wait(10000)
    DeleteObject(small_fireworks_object)
end)

RegisterNetEvent('xakra_fireworks:small_fireworks_players')
AddEventHandler('xakra_fireworks:small_fireworks_players', function(coords)
    LoadPtfxAsset('anm_ind')
    local fireworks = StartParticleFxLoopedAtCoord('ent_anim_ind_firework', coords, 0.0, 0.0, 0.0, 0.20, false, false, false, true)
    table.insert(Particles, fireworks)

    Wait(Config.small_fireworks_time * 1000)

    StopParticleFxLooped(fireworks, true)
end)

-- BIG FIRECRACKER
RegisterNetEvent('xakra_fireworks:big_firecracker')
AddEventHandler('xakra_fireworks:big_firecracker', function()
    Anim('amb_camp@world_camp_jack_throws_rocks_casual@male_a@wip_base', 'base', 6500, 2)
    
    local big_firecracker_object = CreateObject(joaat('w_throw_dynamite01'), GetEntityCoords(PlayerPedId()), true, true, true)
    table.insert(Objects, big_firecracker_object)
    local righthand = GetEntityBoneIndexByName(PlayerPedId(), 'IK_R_Hand')
    AttachEntityToEntity(big_firecracker_object, PlayerPedId(), righthand, 0.06, 0.0, -0.05, -90.0, 0.0, -45.0, true, true, false, true, 1, true)

    Wait(4500)
    DeleteObject(big_firecracker_object)
    Wait(1500)

    local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 15.0, 0.0)
    local _, z = GetGroundZAndNormalFor_3dCoord(coords.x, coords.y, coords.z + 100)

    AddExplosionWithUserVfx(coords.x, coords.y, z, 31, 0x2FDA2B4A, 0.0, true, false, false, 0.0)

    LoadPtfxAsset('core')
    StartNetworkedParticleFxNonLoopedAtCoord('exp_grd_smoke_post_volatile', coords.x, coords.y, z, 0.0, 0.0, 0.0, 1.0, false, false, false)
end)

-- SMALL FIRECRACKER
RegisterNetEvent('xakra_fireworks:small_firecracker')
AddEventHandler('xakra_fireworks:small_firecracker', function()
    Anim('amb_camp@world_camp_jack_throws_rocks_casual@male_a@wip_base', 'base', 6500, 2)

    local small_firecracker_object = CreateObject(joaat('mp001_p_mp_dynamite01x_noexp'), GetEntityCoords(PlayerPedId()), true, true, true)
    table.insert(Objects, small_firecracker_object)
    local righthand = GetEntityBoneIndexByName(PlayerPedId(), 'IK_R_Hand')
    AttachEntityToEntity(small_firecracker_object, PlayerPedId(), righthand, 0.09, 0.0, -0.04, -90.0, 0.0, -43.0, true, true, false, true, 1, true)

    Wait(4500)
    DeleteObject(small_firecracker_object)
    Wait(1500)

    local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 15.0, 0.0)
    local _, z = GetGroundZAndNormalFor_3dCoord(coords.x, coords.y, coords.z + 100)
    
    for i = 1, 3 do
        AddExplosionWithUserVfx(coords.x, coords.y, z, 12, 0x2FDA2B4A, 0.0, true, false, true, 0.0)
        Wait(300)
    end
end)

-- SMOKE CAMPFIRE
RegisterNetEvent('xakra_fireworks:smoke_campfire')
AddEventHandler('xakra_fireworks:smoke_campfire', function()
    local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)

    TaskStartScenarioInPlace(PlayerPedId(), joaat('WORLD_HUMAN_CROUCH_INSPECT'), 12000, true, false, false, false)
    Wait(12000)

    local smoke_campfire_object = CreateObject('p_campfire01x', coords, true, true, false)
    table.insert(Objects, smoke_campfire_object)
    PlaceObjectOnGroundProperly(smoke_campfire_object)
    SetEntityHeading(smoke_campfire_object, GetEntityHeading(PlayerPedId()))

    TriggerServerEvent('xakra_fireworks:players', GetEntityCoords(smoke_campfire_object), 'smoke_campfire')

    Wait(Config.smoke_campfire_time * 1000 + 10000)
    DeleteObject(smoke_campfire_object)
end)

RegisterNetEvent('xakra_fireworks:smoke_campfire_players')
AddEventHandler('xakra_fireworks:smoke_campfire_players', function(coords)
    LoadPtfxAsset('scr_native1')
    local smoke = StartParticleFxLoopedAtCoord('scr_native1_campfire_smoke', coords.x, coords.y, coords.z + 3.5, 0.0, 0.0, 0.0, 3.0, false, false, false, true)
    SetParticleFxLoopedAlpha(smoke, 255.0)
    table.insert(Particles, smoke)
    
    Wait(Config.smoke_campfire_time * 1000)
    StopParticleFxLooped(smoke, true)
end)

-- LOAD PTFXASSET
function LoadPtfxAsset(fxName)
    if not HasNamedPtfxAssetLoaded(joaat(fxName)) then
        RequestNamedPtfxAsset(joaat(fxName))

        while not HasNamedPtfxAssetLoaded(joaat(fxName)) do
            Wait(0)
        end
    end

    UseParticleFxAsset(fxName)
end

-- ANIM
function Anim(animDict, animName, duration, flag, introtiming, exittiming)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)

        local t = 500

        while not HasAnimDictLoaded(animDict) and t > 0 do
            t = t - 1
            Wait(0)
        end
    end

    TaskPlayAnim(PlayerPedId(), animDict, animName, tonumber(introtiming) or 1.0, tonumber(exittiming) or 1.0, duration or -1, flag or 1, 1, false, false, false, 0, true)
    RemoveAnimDict(animDict)
end

-- RESOURCE STOP
AddEventHandler('onResourceStop', function (resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    for _, v in pairs(Particles) do
        if DoesParticleFxLoopedExist(v) then
            StopParticleFxLooped(v, true)
        end
    end

    for _, v in pairs(Objects) do
        if DoesEntityExist(v) then
            DeleteObject(v)
        end
    end
end)