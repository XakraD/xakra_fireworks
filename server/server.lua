
local VorpCore = exports.vorp_core:GetCore()

RegisterServerEvent('xakra_fireworks:players')
AddEventHandler('xakra_fireworks:players', function(coords, firework)
	if firework == 'big_fireworks' then
		TriggerClientEvent('xakra_fireworks:big_fireworks_players', -1, coords)

	elseif firework == 'small_fireworks' then
		TriggerClientEvent('xakra_fireworks:small_fireworks_players', -1, coords)

	elseif firework == 'smoke_campfire' then
		TriggerClientEvent('xakra_fireworks:smoke_campfire_players', -1, coords)
	end
end)

exports.vorp_inventory:registerUsableItem('big_fireworks', function(data)
	exports.vorp_inventory:subItem(data.source, 'big_fireworks', 1)  
	TriggerClientEvent('xakra_fireworks:big_fireworks', data.source)
	exports.vorp_inventory:closeInventory(data.source)
end)

exports.vorp_inventory:registerUsableItem('small_fireworks', function(data) 
	exports.vorp_inventory:subItem(data.source, 'small_fireworks', 1) 
	TriggerClientEvent('xakra_fireworks:small_fireworks', data.source)
	exports.vorp_inventory:closeInventory(data.source)
end)

exports.vorp_inventory:registerUsableItem('big_firecracker', function(data)
	exports.vorp_inventory:subItem(data.source, 'big_firecracker', 1)
	TriggerClientEvent('xakra_fireworks:big_firecracker', data.source)
	exports.vorp_inventory:closeInventory(data.source)
end)

exports.vorp_inventory:registerUsableItem('small_firecracker', function(data)
	exports.vorp_inventory:subItem(data.source, 'small_firecracker', 1)
	TriggerClientEvent('xakra_fireworks:small_firecracker', data.source)
	exports.vorp_inventory:closeInventory(data.source)
end)

exports.vorp_inventory:registerUsableItem('smoke_campfire', function(data)
	exports.vorp_inventory:subItem(data.source, 'smoke_campfire', 1)
	TriggerClientEvent('xakra_fireworks:smoke_campfire', data.source)
	exports.vorp_inventory:closeInventory(data.source)
end)