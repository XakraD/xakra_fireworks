
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)


VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("xakra_fireworks:players")
AddEventHandler("xakra_fireworks:players", function(pcoords,firework)
	local _source = source
	local users = GetPlayers()

	for _, user in pairs(users) do
		if firework == "big_fireworks" then
			TriggerClientEvent("xakra_fireworks:big_fireworks_players",user,pcoords)
		elseif firework == "small_fireworks" then
			TriggerClientEvent("xakra_fireworks:small_fireworks_players",user,pcoords)
		elseif firework == "big_firecracker" then
			TriggerClientEvent("xakra_fireworks:big_firecracker_players",user,pcoords)
		elseif firework == "small_firecracker" then
			TriggerClientEvent("xakra_fireworks:small_firecracker_players",user,pcoords)
		elseif firework == "smoke_campfire" then
			TriggerClientEvent("xakra_fireworks:smoke_campfire_players",user,pcoords)
		end
	end
		
end)

VorpInv.RegisterUsableItem("big_fireworks", function(data)
	VorpInv.subItem(data.source, "big_fireworks", 1)  
	TriggerClientEvent("xakra_fireworks:big_fireworks", data.source)
	VorpInv.CloseInv(data.source)   -- Cerrar inventario.
end)

VorpInv.RegisterUsableItem("small_fireworks", function(data) 
	VorpInv.subItem(data.source, "small_fireworks", 1) 
	TriggerClientEvent("xakra_fireworks:small_fireworks", data.source)
	VorpInv.CloseInv(data.source)   -- Cerrar inventario.
end)

VorpInv.RegisterUsableItem("big_firecracker", function(data)
	VorpInv.subItem(data.source, "big_firecracker", 1)
	TriggerClientEvent("xakra_fireworks:big_firecracker", data.source)
	VorpInv.CloseInv(data.source)   -- Cerrar inventario.
end)

VorpInv.RegisterUsableItem("small_firecracker", function(data)
	VorpInv.subItem(data.source, "small_firecracker", 1)
	TriggerClientEvent("xakra_fireworks:small_firecracker", data.source)
	VorpInv.CloseInv(data.source)   -- Cerrar inventario.
end)

VorpInv.RegisterUsableItem("smoke_campfire", function(data)
	VorpInv.subItem(data.source, "smoke_campfire", 1)
	TriggerClientEvent("xakra_fireworks:smoke_campfire", data.source)
	VorpInv.CloseInv(data.source)
end)