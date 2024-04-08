local QBCore = exports['qb-core']:GetCoreObject()
chopshop = {}
local PlayerJob = {}
local secondwave = false
local vehicle
local start = false
local removedpart = false

local dropoffx = nil
local dropoffy = nil
local dropoffz = nil
local dropoffm = nil

local LicensePlate = nil
local randomdelivery = nil
local vehicle = nil
local copsCalled = false
local cooldown = false
local scrapblip = false

local cartable = {
	{name = Config.Locale["Trunk"],			    coords = 0,	    vehBone = "boot", 		        distance = 1.5,		chopped = false,	anim = "trunk",	    	destroy = 5,	getin = 5},
	{name = Config.Locale["Hood"],			    coords = 0,	    vehBone = "overheat",		    distance = 0.8,		chopped = false,	anim = "hood",	    	destroy = 4,	getin = 4},
	{name = Config.Locale["Frontleftdoor"],	    coords = 0,	    vehBone = "door_dside_f",       distance = 0.8,	 	chopped = false,	anim = "door",	    	destroy = 0, 	getin = 0},
	{name = Config.Locale["Backleftdoor"],	    coords = 0,	    vehBone = "door_dside_r",	    distance = 0.8,		chopped = false,	anim = "door",	    	destroy = 2, 	getin = 2},
	{name = Config.Locale["Frontrightdoor"],	coords = 0,	    vehBone = "door_pside_f",	    distance = 0.8,		chopped = false,	anim = "door",	    	destroy = 1, 	getin = -1},
	{name = Config.Locale["Backrightdoor"],	    coords = 0,	    vehBone = "door_pside_r",	    distance = 0.8,		chopped = false,	anim = "door",	   	 	destroy = 3, 	getin = 1},
	{name = Config.Locale["Frontleftwheel"],	coords = 0,	    vehBone = "wheel_lf", 	        distance = 1.3,	 	chopped = "cando",	anim = "wheel1",	    destroy = 0,	getin = 0},
	{name = Config.Locale["Backleftwheel"],	    coords = 0,	    vehBone = "wheel_lr",		    distance = 1.3,		chopped = "cando",	anim = "wheel2",	    destroy = 4,	getin = 0},
	{name = Config.Locale["Rightfrontwheel"],	coords = 0,	    vehBone = "wheel_rf",		    distance = 1.3,		chopped = "cando",	anim = "wheel3",	    destroy = 1,	getin = 0},
	{name = Config.Locale["Rightbackwheel"],	coords = 0,	    vehBone = "wheel_rr",		    distance = 1.3,		chopped = "cando",	anim = "wheel4",	    destroy = 5,	getin = 0},
}

-- Job Update and checks
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    onDuty = true
end)

Citizen.CreateThread(function()
    Wait(500)
    if QBCore.Functions.GetPlayerData() ~= nil then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        onDuty = true
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)
        while dropoffx or dropoffy or dropoffz ~= nil do
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dis = #(pos - vector3(dropoffx, dropoffy, dropoffz))
                if dis <= 8 then
                    if dis <= 8 and IsPedInAnyVehicle(ped) and start == false then
                        DrawText3Ds(dropoffx, dropoffy, dropoffz, Config.Locale["chop"])
                        if IsControlJustPressed(0, 38) then
							ScrapVehicle()
						end
                    end
                end
            Citizen.Wait(3)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)
        if scrapblip then
            Citizen.Wait(1000)
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dist = #(pos - vector3(Config.VehicleCoords[randomcoords].x, Config.VehicleCoords[randomcoords].y, Config.VehicleCoords[randomcoords].z))
            Citizen.Wait(1)
            if dist <= 3 then
				if not copsCalled then
                    local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                    local street1 = GetStreetNameFromHashKey(s1)
                    local street2 = GetStreetNameFromHashKey(s2)
                    local streetLabel = street1
                    if street2 ~= nil then 
                        streetLabel = streetLabel .. " " .. street2
                    end
                    TriggerServerEvent("qb-chopshop:server:callCops", "Chopshop", 0, streetLabel, pos)
                    copsCalled = true
                end
                Citizen.Wait(5000)
				QBCore.Functions.Notify(Config.Locale["FoundVeh"], 'success')
				Citizen.Wait(10000)
				QBCore.Functions.Notify(Config.Locale["ScrapBlip"], 'primary')
				CreateBlip2()
				SetNewWaypoint(dropoffx, dropoffy)
				scrapblip = false
            end
        end
    end
end)

RegisterNetEvent('qb-chopshop:jobaccept')
AddEventHandler('qb-chopshop:jobaccept', function()
    if cooldown == false then
        if LicensePlate ~= nil then
            QBCore.Functions.Notify(Config.Locale["JobActive"], 'error')
        else
            randomvehiclenumber = math.random(1, 47)
            randomcoords = math.random(1, 60)
            randomdelivery = math.random(1,4)
            SpawnVehicle(Config.VehicleList[randomvehiclenumber].vehicle, Config.VehicleCoords[randomcoords].x, Config.VehicleCoords[randomcoords].y, Config.VehicleCoords[randomcoords].z, Config.VehicleCoords[randomcoords].h)
        end
    else
        QBCore.Functions.Notify(Config.Locale["CoolDown"], 'error')
    end
end)

function SpawnVehicle(vehicle, x, y, z, h)
    local coords = vector4(x, y, z, h)
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetEntityHeading(veh, coords.w)
        SetVehicleEngineOn(veh, false, false)
        SetVehicleOnGroundProperly(veh)
        SetVehicleNeedsToBeHotwired(veh, false)
		SetVehicleColours(vehicle, 0, 0)
        exports['ps-fuel']:SetFuel(veh, 100.0)
        for i = 0, 5 do
            SetVehicleDoorShut(veh, i, true)
        end
        LicensePlate = GetVehicleNumberPlateText(veh)
        coordsproblipx, coordsproblipy = Config.VehicleCoords[randomcoords].x, Config.VehicleCoords[randomcoords].y
		dropoffx, dropoffy, dropoffz, dropoffm = Config.DeliveryCoords[randomdelivery].x, Config.DeliveryCoords[randomdelivery].y, Config.DeliveryCoords[randomdelivery].z, Config.DeliveryCoords[randomdelivery].h
    	QBCore.Functions.Notify(Config.Locale["Email"], 'success')
        Citizen.Wait(math.random(10000,25000))
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = "Chop Shop",
            subject = "Vehicle Located",
            message = "Hello,<br><br> The vehicle you need to collect is a<br><b>" .. vehicle .. " </b> <br><br>The license plate is - <br><b>" .. LicensePlate .."</b>.<br><br>The approximate position of the <b>vehicle</b> and the <b>scrapyard</b> you <b>need</b> to bring it to are marked on your GPS.",
        })
        CreateBlip()
		scrapblip = true
        cooldown = true
        Citizen.Wait(Config.CoolDown * 60000)
        cooldown = false
    end, coords, true)
end

function ScrapVehicle()
	local ped = PlayerPedId()
	vehicle = GetVehiclePedIsIn(ped, false)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if GetVehicleNumberPlateText(veh) ~= LicensePlate then
        QBCore.Functions.Notify(Config.Locale["WrongVeh"], 'error')
	else 
		local netId = NetworkGetNetworkIdFromEntity(vehicle)
        QBCore.Functions.Notify(Config.Locale["Reminder"], 8000)
		StartChopping()
		DeleteBlip()
    end
end

-- Police alert function used to alert all active police on Duty
RegisterNetEvent('qb-chopshop:client:robberyCall')
AddEventHandler('qb-chopshop:client:robberyCall', function(type, key, streetLabel, coords)
    if PlayerJob.name == "police" and onDuty then
        local bank = "Vehicle Robbery"
        if type == "Chopshop" then
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            TriggerEvent('chatMessage', "ALARM", "warning", "Vehicle robbery")
            TriggerEvent('qb-policealerts:client:AddPoliceAlert', {
                timeOut = 15000,
                alertTitle = "Possible Vehicle Robbery",
                coords = {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z,
                },
                details = {
                    [1] = {
                        icon = '<i class="fas fa-car"></i>',
                        detail = bank,
                    },
                    [2] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = streetLabel,
                    },
                },
                callSign = QBCore.Functions.GetPlayerData().metadata["callsign"],
            })

            local transG = 250
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, 227)
            SetBlipColour(blip, 4)
            SetBlipDisplay(blip, 4)
            SetBlipAlpha(blip, transG)
            SetBlipScale(blip, 1.9)
            SetBlipFlashes(blip, true)
            SetBlipAsShortRange(blip, false)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString("911: Vehicle Robbery")
            EndTextCommandSetBlipName(blip)
            
            while transG ~= 0 do
                Wait(180 * 4)
                transG = transG - 1
                SetBlipAlpha(blip, transG)
                if transG == 0 then
                    SetBlipSprite(blip, 2)
                    RemoveBlip(blip)
                    return
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if start then
			FreezeEntityPosition(vehicle,true)
			  for k=1, #cartable, 1 do
				if cartable[k].chopped == "cando" and DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(-1))   then
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), cartable[k].coords.x, cartable[k].coords.y, cartable[k].coords.z, true ) < cartable[k].distance then
						DrawText3Ds(cartable[k].coords.x,cartable[k].coords.y,cartable[k].coords.z,Config.Locale["remove"]..cartable[k].name)
						if(IsControlJustPressed(1, 38))   then
							StartAnimation(k)
						end
						if removedpart == false then
							removedpart = true
						end
					end
				end
			end
			if cartable[7].chopped == true and cartable[8].chopped == true and cartable[9].chopped == true and cartable[10].chopped == true and secondwave == false then
				for i=1, 6, 1 do
					cartable[i].chopped = "cando"
				end
				secondwave = true
			end	
			if GetVehiclePedIsIn(GetPlayerPed(-1)) == vehicle and removedpart == true then
				local pos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "windscreen"))
				DrawText3Ds(pos.x,pos.y,pos.z,Config.Locale["destroy"])
					if(IsControlJustPressed(1, 38))   then
						QBCore.Functions.Progressbar("crushing", Config.Locale["crushing"], (6500), false, true, {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						}, {}, {}, {}, function()
						TaskLeaveVehicle(GetPlayerPed(-1), vehicle, 1)
						Citizen.Wait(1500)
						NetworkFadeOutEntity(vehicle,false,false)
						Citizen.Wait(1000)
						DeleteEntity(vehicle)
						Reset()
                        LicensePlate, coordsproblipx, coordsproblipy, dropoffx, dropoffy, dropoffz, dropoffm, randomvehiclenumber, randomcoords = nil
					end)
				end
			end
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(-1)),dropoffx, dropoffy, dropoffz,true) > 50 and start == true  then
				VehicleToFar()
			end
		end
	end
end)

function StartAnimation(num)
	if cartable[num].anim == "wheel1" or cartable[num].anim == "wheel2" or cartable[num].anim == "wheel3" or cartable[num].anim == "wheel4" then
		TriggerEvent('qb-chopshop:wheelanimation')
		Citizen.Wait(7400)
		if cartable[num].anim == "wheel1" then
			SetVehicleWheelXOffset(vehicle, 0, -2000)
		elseif cartable[num].anim == "wheel2" then
			SetVehicleWheelXOffset(vehicle, 2, -2000)
		elseif cartable[num].anim == "wheel3" then
			SetVehicleWheelXOffset(vehicle, 1, -2000)
		elseif cartable[num].anim == "wheel4" then 
			SetVehicleWheelXOffset(vehicle, 3, -2000)
		end
		cartable[num].chopped = true
		TriggerServerEvent('qb-chopshop:server:rewardplayer', cartable[num].anim)	
	elseif cartable[num].anim == "door" then
		TaskOpenVehicleDoor(GetPlayerPed(-1),vehicle,3000,cartable[num].getin,10)
		Citizen.Wait(2500)  
		TriggerEvent('qb-chopshop:dooranimation')
		Citizen.Wait(9000)
		SetVehicleDoorBroken(vehicle,cartable[num].destroy,true)
		cartable[num].chopped = true
		TriggerServerEvent('qb-chopshop:server:rewardplayer', cartable[num].anim)
	elseif cartable[num].anim == "trunk" then
		SetVehicleDoorOpen(vehicle, cartable[num].destroy, false, true)
		Citizen.Wait(2500)  
		TriggerEvent('qb-chopshop:trunkanimation')
		Citizen.Wait(4000)
		cartable[num].chopped = true
		TriggerServerEvent('qb-chopshop:server:rewardplayer', cartable[num].anim)
		Citizen.Wait(9500)
		SetVehicleDoorBroken(vehicle,cartable[num].destroy,true)
	elseif cartable[num].anim == "hood" then
		SetVehicleDoorOpen(vehicle, cartable[num].destroy, false, true)
		Citizen.Wait(2500)  
		TriggerEvent('qb-chopshop:hoodanimation')
		Citizen.Wait(9000)
		SetVehicleDoorBroken(vehicle,cartable[num].destroy,true)
		cartable[num].chopped = true
		TriggerServerEvent('qb-chopshop:server:rewardplayer', cartable[num].anim)
	end
end

function VehicleToFar() 
	DeleteEntity(vehicle)
	Reset()
	QBCore.Functions.Notify(Config.Locale["FarAway"], 'error')
end

function CreateBlip()
    DeleteBlip()
    coordsproblipx = coordsproblipx + math.random(-75.0, 75.0)
    coordsproblipy = coordsproblipy + math.random(-75.0, 75.0)
    
    blip = AddBlipForRadius(coordsproblipx, coordsproblipy, 0.0, 100.0)
    SetBlipSprite(blip, 9)
    SetBlipColour(blip, 38)
    SetBlipAlpha(blip, 80)
end

function CreateBlip2()
	DeleteBlip()
	blip2 = AddBlipForCoord(dropoffx, dropoffy, dropoffz)
    SetBlipSprite(blip2, 380)
    SetBlipColour(blip2, 33)
    SetBlipAlpha(blip2, 200)
    SetBlipDisplay(blip2, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Scrap Yard")
    EndTextCommandSetBlipName(blip2)
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function DeleteBlip()
    if DoesBlipExist(blip) then
        RemoveBlip(blip)
    end
    if DoesBlipExist(blip2) then
        RemoveBlip(blip2)
    end
end

function StartChopping()
	for i=1, #cartable, 1 
	   do
		   local pos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, cartable[i].vehBone))
		   cartable[i].coords=pos
	   end
	   start = true
	   for k=-1, 2, 1
		   do
			local pedseat = GetPedInVehicleSeat(vehicle,k)
			TaskLeaveVehicle(pedseat, vehicle, 1)
	end
end

function Reset()
	for i=1, #cartable, 1 
		do
		if i <=6 then
			cartable[i].chopped=false
		else
			cartable[i].chopped="cando"
		end
	end
	secondwave = false
	vehicle = nil
	start = false
	removedpart = false
end
