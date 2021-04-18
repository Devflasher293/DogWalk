ESX = nil

local WalkFase = 0
local missionInProgress = false
local missionCompleted = false
local InsideMarker = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		PlayerData = ESX.GetPlayerData()
	end
end)


Citizen.CreateThread(function()
    local sleepThread_1 = 500

	while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), false)
        for k,v in pairs(Config.DogWalkHouse) do
			local distance = Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z)
            if distance <= 1.0 then
                sleepThread_1 = 0
                DrawText3Ds(v.x, v.y, v.z, "Tryck ~g~[E]~s~ för att prata med Gunilla")
                if IsControlJustPressed(0, 86) then
					OpenGunillaMenu()
                end
            end
        end
        Wait(sleepThread_1)
	end
end)



RegisterNetEvent("flasher-dogwalk:MainEvent")
AddEventHandler("flasher-dogwalk:MainEvent", function()
    Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(0)

            
            if missionInProgress == true then 
                if WalkFase == 0 then
                    drawTxt("gå en runda med hunden.",4, 1, 0.50, 0.845, 0.55, 255, 255, 255, 255)

                    local position = GetEntityCoords(GetPlayerPed(-1))
                    local distance = Vdist(1044.024, -411.7032, 66.49221, position.x, position.y, position.z)

                    DrawScriptMarker({
                        ["type"] = 31,
                        ["pos"] = vector3(1044.024, -411.7032, 67.49221),
                        ["r"] = 19,
                        ["g"] = 46,
                        ["b"] = 71,
                        ["sizeX"] = 3.0,
                        ["sizeY"] = 3.0,
                        ["sizeZ"] = 3.0,
                        ["rotate"] = false
                    })

                    
                    if distance <= 1.0 and not IsPedInAnyVehicle(GetPlayerPed(-1), false) and not IsPedDeadOrDying(SpawnedDog) then 
                    --    DrawText3Ds(1029.73, -409.5161, 65.94929, 'Tryck [E] för att få nästa destination')
                    --    DrawMarker(1, 1029.73, -409.5161, 65.94929, 240, 255, 0, 1, false, false, 2, false)
                        InsideMarker = true

                        if InsideMarker == true then
                            ESX.ShowNotification('Fortsätt längst med vägen rakt ner.')
                            PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)
                            RemoveBlip(blip)

                            blip = AddBlipForCoord(858.2529, -545.7744, 56.85387)
                            SetBlipRoute(blip, true)

                        
                            WalkFase = 1
                        end
                    end
                end
            end

            if WalkFase == 1 then 
                drawTxt("gå till nästa destination på kartan.",4, 1, 0.50, 0.845, 0.55,255, 255, 255, 255)
                
                local position = GetEntityCoords(GetPlayerPed(-1))
                local distance = Vdist(858.2529, -545.7744, 56.85387, position.x, position.y, position.z)

                DrawScriptMarker({
                    ["type"] = 31,
                    ["pos"] = vector3(858.2529, -545.7744, 58.49221),
                    ["r"] = 19,
                    ["g"] = 46,
                    ["b"] = 71,
                    ["sizeX"] = 3.0,
                    ["sizeY"] = 3.0,
                    ["sizeZ"] = 3.0,
                    ["rotate"] = false
                })

                if IsPedDeadOrDying(SpawnedDog) then
                    EndWalkIfDogDead()
                
                
                elseif distance <= 1.0 and not IsPedInAnyVehicle(GetPlayerPed(-1), false) and not IsPedDeadOrDying(SpawnedDog) then 
                   -- DrawText3Ds(858.2529, -545.7744, 56.85387, 'Tryck [E] för att få nästa destination')
                 --   DrawMarker(1, 858.2529, -545.7744, 56.85387, 240, 255, 0, 1, false, false, 2, false)

                    InsideMarker = true

                    if InsideMarker == true then
                    
                        ESX.ShowNotification('Fortsätt rakt fram.')
                        PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)
                        RemoveBlip(blip)

                        blip = AddBlipForCoord(906.6492, -598.7958, 57.39655)
                        SetBlipRoute(blip, true)

                        WalkFase = 2
                        InsideMarker = false
                    end
                end
            end

            if WalkFase == 2 then 
                drawTxt("gå till nästa destination på kartan.",4, 1, 0.50, 0.845, 0.55,255, 255, 255, 255)

                local position = GetEntityCoords(GetPlayerPed(-1))
                local distance = Vdist(906.6492, -598.7958, 57.39655, position.x, position.y, position.z)

                DrawScriptMarker({
                    ["type"] = 31,
                    ["pos"] = vector3(906.6492, -598.7958, 58.39655),
                    ["r"] = 19,
                    ["g"] = 46,
                    ["b"] = 71,
                    ["sizeX"] = 3.0,
                    ["sizeY"] = 3.0,
                    ["sizeZ"] = 3.0,
                    ["rotate"] = false
                })

                if IsPedDeadOrDying(SpawnedDog) then
                    EndWalkIfDogDead()
                

            elseif distance <= 1.0 and not IsPedInAnyVehicle(GetPlayerPed(-1), false) and not IsPedDeadOrDying(SpawnedDog) then 
                --    DrawText3Ds(906.6492, -598.7958, 57.39655, 'Tryck [E] för att få nästa destination')
                --    DrawMarker(1, 906.6492, -598.7958, 57.39655, 240, 255, 0, 1, false, false, 2, false)

                    InsideMarker = true

                    if InsideMarker == true then
                        ESX.ShowNotification('Ta vänster här över vägen.')
                        PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)

                        RemoveBlip(blip)

                        blip = AddBlipForCoord(997.1698, -532.6326, 57.52653)
                        SetBlipRoute(blip, true)

                        WalkFase = 3
                        InsideMarker = false
                    end
                end
            end    

            if WalkFase == 3 then 
                drawTxt("gå till nästa destination på kartan.",4, 1, 0.50, 0.845, 0.55,255, 255, 255, 255)

                local position = GetEntityCoords(GetPlayerPed(-1))
                local distance = Vdist(997.1698, -532.6326, 59.5265, position.x, position.y, position.z)

                DrawScriptMarker({
                    ["type"] = 31,
                    ["pos"] = vector3(997.1698, -532.6326, 60.49221),
                    ["r"] = 19,
                    ["g"] = 46,
                    ["b"] = 71,
                    ["sizeX"] = 3.0,
                    ["sizeY"] = 3.0,
                    ["sizeZ"] = 3.0,
                    ["rotate"] = false
                })

                if IsPedDeadOrDying(SpawnedDog) then
                    EndWalkIfDogDead()
                

                
            elseif distance <= 1.0 and not IsPedInAnyVehicle(GetPlayerPed(-1), false) and not IsPedDeadOrDying(SpawnedDog) then 
                --    DrawText3Ds(997.1698, -532.6326, 59.5265, 'Tryck [E] för att få nästa destination')
                --    DrawMarker(1, 997.1698, -532.6326, 59.5265, 240, 255, 0, 1, false, false, 2, false)
                
                    InsideMarker = true
  
                    if InsideMarker == true then
                        ESX.ShowNotification('Fortsätt rakt fram.')
                        PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)

                        RemoveBlip(blip)

                        blip = AddBlipForCoord(1046.895, -505.5583, 63.90388)
                        SetBlipRoute(blip, true)

                        WalkFase = 4
                        missionCompleted = true
                        InsideMarker = false
                    end
                end
            end   

                if missionCompleted == true then
                    if WalkFase == 4 then 
                    drawTxt("lämna tillbaka Gunillas hund och få din belöning",4, 1, 0.50, 0.845, 0.55, 255, 255, 255, 255)

                        local position = GetEntityCoords(GetPlayerPed(-1))
                        local distance = Vdist(1046.895, -505.5583, 63.90388, position.x, position.y, position.z)

                        if distance <= 1.0 then
                        DrawText3Ds(1046.895, -505.5583, 63.90388, 'Tryck ~g~[E]~w~ för att lämna tillbaks hunden.')
                        if IsControlJustPressed(1, 38) then
                            DeleteEntity(SpawnedDog)
                            RemoveBlip(blip)
                            TriggerServerEvent("flasher-dogwalk:DogWalkDone", source)
                            missionInProgress = false
                            missionCompleted = true
                            WalkFase = 0
                        end
                    end
                end
            end
        end
    end)
end)

function EndWalkIfDogDead()
    missionInProgress = false
    missionCompleted = false
    WalkFase = 0
    ESX.ShowNotification('Hunden dog och du blev av med 100kr')
    TriggerServerEvent("flasher-dogwalk:DogDeath", source)
end


function OpenGunillaMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'Gunilla_Menu',
        {
            title    = 'Gunilla',
            elements = {
				{label = 'Vill du rasta min hund för 200KR?', value = 'rasta'},
            }
        },
        function(data, menu)
			if data.current.value == 'rasta' then
				OpenDogMenu()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenDogMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'Dog_Menu',
        {
            title    = 'Ja/nej',
            elements = {
				{label = 'Ja', value = 'ja'},
				{label = 'Nej', value = 'nej'},
            }
        },
        function(data, menu)
            if data.current.value == 'ja' then
                ESX.UI.Menu.CloseAll()

                spawnDog()

			elseif data.current.value == 'nej' then
				ESX.ShowNotification('Varför kom du ens hit då?')
				menu.close()
			end
        end,
        function(data, menu)
            menu.close()
        end
    )
end


function spawnDog()

    missionInProgress = true

    blip = AddBlipForCoord(1029.73, -409.5161, 65.9492)
    SetBlipRoute(blip, true)

    local model = 1318032802
    RequestModel(model)

    while not HasModelLoaded(model) do 
        Citizen.Wait(0)
    end


    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local heading = GetEntityHeading(GetPlayerPed(-1))

    SpawnedDog = CreatePed(28, model, pos.x + 2, pos.y, pos.z, heading, true, true)

        --dog natives
    TaskSetBlockingOfNonTemporaryEvents(SpawnedDog, true)
    SetPedFleeAttributes(SpawnedDog, 0, false)
    SetPedCombatAttributes(SpawnedDog, 3, true)
    SetPedCombatAttributes(SpawnedDog, 5, true)
    SetPedCombatAttributes(SpawnedDog, 46, true)
    SetCanAttackFriendly(ped, toggle, p2)
    ClearPedTasks(SpawnedDog)
    DetachEntity(SpawnedDog)
    
    TaskFollowToOffsetOfEntity(SpawnedDog, GetPlayerPed(-1), 0.5, 0.0, 0.0, 10.0, -1, 0.2, true)

    TriggerEvent("flasher-dogwalk:MainEvent", source)
end





-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

-- Map Blip:
Citizen.CreateThread(function()
	for k,v in pairs(Config.Blip) do
		if v.Enable then
			local blip = AddBlipForCoord(v.Pos[1], v.Pos[2], v.Pos[3])
			SetBlipSprite (blip, v.Sprite)
			SetBlipDisplay(blip, v.Display)
			SetBlipScale  (blip, v.Scale)
			SetBlipColour (blip, v.Color)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.Name)
			EndTextCommandSetBlipName(blip)
		end
	end	
end)

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

DrawScriptMarker = function(markerData)
    DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0, markerData["sizeX"] or 1.0, markerData["sizeY"] or 1.0, markerData["sizeZ"] or 1.0, markerData["r"] or 1.0, markerData["g"] or 1.0, markerData["b"] or 1.0, 100, false, true, 2, false, false, false, false)
end