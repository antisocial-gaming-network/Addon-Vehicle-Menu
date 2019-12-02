_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Vehicle Menu", "~r~Antisocial Netowrk Custom Vehicles")
_menuPool:Add(mainMenu)
_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

	
-- THIS IS FOR AN EXAMPLE, PLEASE USE YOOUR OWN CARS SEE THE README.MD FILE FOR MORE!


function FirstItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Trucks") 
    local carItem = NativeUI.CreateItem("F150", "2018 FORD F150")
         submenu:AddItem(carItem)
    carItem.Activated = function(sender, item)
        if item == carItem then
            spawnCar("transformer")
            notify("Vehicle Spawned")
        end
   end
       local vehItem = NativeUI.CreateItem("Ford Raptor (Modded)", "Raptor")
       submenu:AddItem(vehItem)
           vehItem.Activated = function(sender, item) 
            if item == vehItem then
            spawnCar("RAPTOR150")
            notify("Vehicle Spawned")
        end
   end
          local vehItems = NativeUI.CreateItem("GMC 4X4", "Modded 4x4 GMC truck HUGE")
       submenu:AddItem(vehItems)
           vehItems.Activated = function(sender, item) 
            if item == vehItems then
                spawnCar("952500")
            notify("Vehicle Spawned")
        end
   end
             local caraItems = NativeUI.CreateItem("Caracarase", "Caracarase")
       submenu:AddItem(caraItems)
           caraItems.Activated = function(sender, item) 
            if item == caraItems then
            spawnCar("caracarase")
            notify("Vehicle Spawned")
        end
   end

   _menuPool:MouseControlsEnabled(false)
    _menuPool:ControlDisablingEnabled(false)
end

function SecondItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Suvs") 
    local carItem = NativeUI.CreateItem("Lamborghini Urus", "2018 Lamborghini Urus")
         submenu:AddItem(carItem)
    carItem.Activated = function(sender, item)
        if item == carItem then
            spawnCar("urus2018")
            notify("Vehicle Spawned")
        end
   end
      local mercItem = NativeUI.CreateItem("G-Wagon", "GWagon")
    submenu:AddItem(mercItem)
      mercItem.Activated = function(sender, item)
        if item == mercItem then
            spawnCar("g63mg")
            notify("Vehicle Spawned")
        end
   end

   _menuPool:MouseControlsEnabled(false)
    _menuPool:ControlDisablingEnabled(false)
end


FirstItem(mainMenu)
_menuPool:RefreshIndex()
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        --[[ The "e" button will activate the menu ]]
        if IsControlJustPressed(1, 10) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)




--[[ COPY BELOW ]]

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end


function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, GetEntityHeading(PlayerPedId()), true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
    
end

