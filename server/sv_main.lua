QBCore = exports['qb-core']:GetCoreObject()

chopshop = {}

RegisterNetEvent("qb-chopshop:syncchopcars")
AddEventHandler("qb-chopshop:syncchopcars", SyncCars)

function GiveReward(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if data == "wheel1" or data == "wheel2" or data == "wheel3" or data == "wheel4" then
    		Player.Functions.AddItem("wheel", 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['wheel'], "add")

	elseif data == "door" then
    	Player.Functions.AddItem("door", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['door'], "add")
		
	elseif data == "hood" then
    	Player.Functions.AddItem("hood", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['hood'], "add")

	elseif data == "trunk" then 
		local randomitem = math.random(1, 3)
		local item = Config.TrunkItems[randomitem]["item"]
		local amount = Config.TrunkItems[randomitem]["amount"]
		Player.Functions.AddItem(item, amount, false, info)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
		TriggerClientEvent('QBCore:Notify', src, "You found "..amount.." "..item.." in the trunk", 'success')
		Citizen.Wait(8500)
		Player.Functions.AddItem("trunk", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['trunk'], "add")
	end
end

RegisterServerEvent('qb-chopshop:server:callCops')
AddEventHandler('qb-chopshop:server:callCops', function(type, bank, streetLabel, coords)
    local cameraId = nil
    local bankLabel = "Chopshop"
    local msg = ""
    msg = "Possible Vehicle Robbery"
    local alertData = {
        title = "Chopshop",
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = msg,
    }
    TriggerClientEvent("qb-chopshop:client:robberyCall", -1, type, bank, streetLabel, coords)
    TriggerClientEvent("gks-phone:client:addPoliceAlert", -1, alertData)
end)

RegisterNetEvent("qb-chopshop:server:rewardplayer")
AddEventHandler("qb-chopshop:server:rewardplayer", GiveReward)

function SyncCars(list) 
	TriggerClientEvent('qb-chopshop:carlist', -1,list) 
end

