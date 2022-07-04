
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)


VorpInv = exports.vorp_inventory:vorp_inventoryApi()


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

VorpInv.RegisterUsableItem("firecracker", function(data)
	VorpInv.subItem(data.source, "firecracker", 1)
	TriggerClientEvent("xakra_fireworks:firecracker", data.source)
	VorpInv.CloseInv(data.source)   -- Cerrar inventario.
end)

VorpInv.RegisterUsableItem("smoke_campfire", function(data)
	VorpInv.subItem(data.source, "smoke_campfire", 1)
	TriggerClientEvent("xakra_fireworks:smoke_campfire", data.source)
	VorpInv.CloseInv(data.source)
end)