 This is a resource using  nativeUI 
 NativeUI for Lua : https://forum.fivem.net/t/release-dev-nativeuilua/98318


to run go to server.cfg add
-start NativeUI
-start addon_menu-master

defualt key is pageup on your keyboard, you can change this on line 82, make sure its a valid INDEX number from https://docs.fivem.net/game-references/controls/


to add cars please use your brain follow the template bellow and the example in menu_lua
make sure to add mroe of these for the more sub menus u make for example `FirstItem(mainMenu)` is the first one so the second one youd do `SecondItem(mainMenu)` so on, this on line 75

Need anymore support Visit my Website or discord 
Discord : https://discord.gg/y7UR2uS
Website : https://antisocial.gg/ 

otherwise leave a comment on the resource post, ill respond ASAP, also make sure to check comments as i may of already answered your question :P



-- example -- 

  function FirstItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "SUBMENUNAME ETC 'TRUCKS'") 
    local carItem = NativeUI.CreateItem("NAME", "EXAMPLE INFO")
         submenu:AddItem(carItem)
    carItem.Activated = function(sender, item)
        if item == carItem then
            spawnCar("VEHICLE SPAWN CODE")
            notify("Vehicle Spawned")
        end
   end

   _menuPool:MouseControlsEnabled(false)
    _menuPool:ControlDisablingEnabled(false)
end