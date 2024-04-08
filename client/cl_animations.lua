QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-chopshop:wheelanimation')
AddEventHandler('qb-chopshop:wheelanimation', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
	QBCore.Functions.Progressbar("wheel", Config.Locale["Wheel"], 7000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	Citizen.Wait(7500)
	local ped = PlayerPedId()    
	RequestAnimDict("anim@heists@box_carry@")
	Citizen.Wait(100)
    wheelprop = CreateObject(GetHashKey("imp_prop_impexp_tyre_01b"), 0, 0, 0, true, true, true)        
	AttachEntityToEntity(wheelprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), -0.05, 0.2, 0.35, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
	TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
	Citizen.Wait(2500)
	DetachEntity(wheelprop, 1, true)
	DeleteEntity(wheelprop)
	DeleteObject(wheelprop)
end)

RegisterNetEvent('qb-chopshop:dooranimation')
AddEventHandler('qb-chopshop:dooranimation', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
	QBCore.Functions.Progressbar("Door1", Config.Locale["Door1"], (4000), false, true, {
	    disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	Citizen.Wait(4500)
	TriggerEvent('animations:client:EmoteCommandStart', {"pull"})
	QBCore.Functions.Progressbar("Door2", Config.Locale["Door2"], (4000), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	Citizen.Wait(4500)
	local ped = PlayerPedId()    
	RequestAnimDict("anim@heists@box_carry@")
	Citizen.Wait(100)
	doorprop = CreateObject(GetHashKey("imp_prop_impexp_car_door_04a"), 0, 0, 0, true, true, true)  
    AttachEntityToEntity(doorprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.16, -0.05, 0.5, -135.0, 180.0, 0.0, true, true, false, true, 1, true)
	TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2000, 51, 0, false, false, false)
	Citizen.Wait(2000)
	DetachEntity(doorprop, 1, true)
	DeleteEntity(doorprop)
	DeleteObject(doorprop)
end)

RegisterNetEvent('qb-chopshop:trunkanimation')
AddEventHandler('qb-chopshop:trunkanimation', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
	QBCore.Functions.Progressbar("Trunk1", Config.Locale["searching"], (4000), false, true, {
	    disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	Citizen.Wait(4500)
	TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
	QBCore.Functions.Progressbar("Hood1", Config.Locale["Door1"], (4000), false, true, {
	    disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	Citizen.Wait(4500)
	TriggerEvent('animations:client:EmoteCommandStart', {"pull"})
	QBCore.Functions.Progressbar("Hood2", Config.Locale["Door2"], (4000), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	Citizen.Wait(4500)
end)

RegisterNetEvent('qb-chopshop:hoodanimation')
AddEventHandler('qb-chopshop:hoodanimation', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
	QBCore.Functions.Progressbar("Hood1", Config.Locale["Door1"], (4000), false, true, {
	    disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	Citizen.Wait(4500)
	TriggerEvent('animations:client:EmoteCommandStart', {"pull"})
	QBCore.Functions.Progressbar("Hood2", Config.Locale["Door2"], (4000), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	Citizen.Wait(4500)
	local ped = PlayerPedId()    
	RequestAnimDict("anim@heists@box_carry@")
	Citizen.Wait(100)
	trunkprop = CreateObject(GetHashKey("imp_prop_impexp_bonnet_02a"), 0, 0, 0, true, true, true)  
    AttachEntityToEntity(trunkprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.58, 0.35, 0.24, -120.0, 115.0, 0.0, true, true, false, true, 1, true)
	TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2000, 51, 0, false, false, false)
	Citizen.Wait(2000)
	DetachEntity(trunkprop, 1, true)
	DeleteEntity(trunkprop)
	DeleteObject(trunkprop)
end)

RegisterNetEvent('qb-chopshop:wheelchopanim')
AddEventHandler('qb-chopshop:wheelchopanim', function()
	local ped = PlayerPedId()
	QBCore.Functions.Progressbar("wheel", Config.Locale["chopwheel"], 13000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	RequestAnimDict("anim@heists@box_carry@")
	Citizen.Wait(100)
    wheelprop = CreateObject(GetHashKey("imp_prop_impexp_tyre_01b"), 0, 0, 0, true, true, true)        
	AttachEntityToEntity(wheelprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), -0.05, 0.2, 0.35, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
	SetEntityCoords(ped, 472.3670, -1311.3860, 28.2159)
    SetEntityHeading(ped, 124.7478)
	TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 1500, 51, 0, false, false, false)
	Citizen.Wait(1500)
	DeleteEntity(wheelprop)
	DeleteEntity(wheelprop)
	DeleteObject(wheelprop)
	wheeleobj = CreateObject(GetHashKey("imp_prop_impexp_tyre_01b"), 471.8941, -1311.6477, 29.2602, true, true, true)
	PlaceObjectOnGroundProperly(wheeleobj)
    SetEntityHeading(wheeleobj, 290.6089)
	TriggerEvent('animations:client:EmoteCommandStart', {"weld"})
	Citizen.Wait(12000)
	ClearPedTasks(ped)
	DeleteEntity(wheeleobj)
	DeleteEntity(wheeleobj)
	DeleteObject(wheeleobj)
end)

RegisterNetEvent('qb-chopshop:doorchopanim')
AddEventHandler('qb-chopshop:doorchopanim', function()
	local ped = PlayerPedId()    
	QBCore.Functions.Progressbar("door", Config.Locale["chopdoor"], 13000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	RequestAnimDict("anim@heists@box_carry@")
	Citizen.Wait(100)
	doorprop = CreateObject(GetHashKey("imp_prop_impexp_car_door_04a"), 0, 0, 0, true, true, true)  
    AttachEntityToEntity(doorprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.08, 0.28, 0.90, -115.0, 180.0, 0.0, true, true, false, true, 1, true)
    SetEntityCoords(ped, 472.5670, -1311.3860, 28.2159)
    SetEntityHeading(ped, 124.747)
	TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 1500, 51, 0, false, false, false)
	Citizen.Wait(1500)
	DetachEntity(doorprop, 1, true)
	DeleteEntity(doorprop)
	DeleteObject(doorprop)
	doorobj = CreateObject(GetHashKey("imp_prop_impexp_car_door_04a"), 471.5941, -1311.3477, 29.2602, true, true, true)
	PlaceObjectOnGroundProperly(doorobj)
    SetEntityHeading(doorobj, 37.1947)
	TriggerEvent('animations:client:EmoteCommandStart', {"weld"})
	Citizen.Wait(12000)
	ClearPedTasks(ped)
	DeleteEntity(doorobj)
	DeleteEntity(doorobj)
	DeleteObject(doorobj)
end)

RegisterNetEvent('qb-chopshop:hoodchopanim')
AddEventHandler('qb-chopshop:hoodchopanim', function()
	local ped = PlayerPedId()    
	QBCore.Functions.Progressbar("hood", Config.Locale["chophood"], 12500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	RequestAnimDict("anim@heists@box_carry@")
	Citizen.Wait(100)
	hoodprop = CreateObject(GetHashKey("imp_prop_impexp_bonnet_02a"), 0, 0, 0, true, true, true)  
    AttachEntityToEntity(hoodprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.15, -0.05, 0.24, -200.0, 110.0, 0.0, true, true, false, true, 1, true)
	SetEntityCoords(ped, 472.8181, -1311.4249, 28.2183)
    SetEntityHeading(ped, 124.3253)
	TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 1000, 51, 0, false, false, false)
	Citizen.Wait(1000)
	DetachEntity(hoodprop, 1, true)
	DeleteEntity(hoodprop)
	DeleteObject(hoodprop)
	hoodobj = CreateObject(GetHashKey("imp_prop_impexp_bonnet_02a"), 471.8663, -1311.6914, 29.86, true, true, true)
    SetEntityHeading(hoodobj, 118.1908)
	SetEntityRotation(hoodobj, 0.0, 80.0)
	TriggerEvent('animations:client:EmoteCommandStart', {"weld"})
	Citizen.Wait(12000)
	ClearPedTasks(ped)
	DeleteEntity(hoodobj)
	DeleteEntity(hoodobj)
	DeleteObject(hoodobj)
end)

RegisterNetEvent('qb-chopshop:trunkchopanim')
AddEventHandler('qb-chopshop:trunkchopanim', function()
	local ped = PlayerPedId()
	QBCore.Functions.Progressbar("trunk", Config.Locale["choptrunk"], 12500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
	end)
	RequestAnimDict("anim@heists@box_carry@")
	Citizen.Wait(100)
	trunkprop = CreateObject(GetHashKey("imp_prop_impexp_bonnet_02a"), 0, 0, 0, true, true, true)  
    AttachEntityToEntity(trunkprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.15, -0.05, 0.24, -200.0, 110.0, 0.0, true, true, false, true, 1, true)
	SetEntityCoords(ped, 472.5044, -1311.2794, 28.2171)
    SetEntityHeading(ped, 122.8519)
	TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 1000, 51, 0, false, false, false)
	Citizen.Wait(1000)
	DetachEntity(trunkprop, 1, true)
	DeleteEntity(trunkprop)
	DeleteObject(trunkprop)
	trunkobj = CreateObject(GetHashKey("imp_prop_impexp_bonnet_02a"),471.7178, -1311.6902, 29.82, true, true, true)
    SetEntityHeading(trunkobj, 118.1908)   
	SetEntityRotation(trunkobj, 0.0, 250.0)
	TriggerEvent('animations:client:EmoteCommandStart', {"weld"})
	Citizen.Wait(12000)
	ClearPedTasks(ped)
	DeleteEntity(trunkobj)
	DeleteEntity(trunkobj)
	DeleteObject(trunkobj)
end)

--[[RegisterCommand('hood', function ()

end)]]
