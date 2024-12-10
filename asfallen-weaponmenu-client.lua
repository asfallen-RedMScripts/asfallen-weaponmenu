
local MenuData = exports["vorp_menu"]:GetMenuData()

RegisterCommand("weaponmenu", function()
    MenuData.CloseAll()
    MenuData.Open("default", GetCurrentResourceName(), "weapon_menu", {
        title = "Silah Menüsü",
        align = "top-left",
        elements = {
            {label = "Navy Revolver", value = "WEAPON_REVOLVER_NAVY"},
            {label = "Cattleman Revolver", value = "WEAPON_REVOLVER_CATTLEMAN"},
            {label = "Rollingblock Rifle", value = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK"},
            {label = "Carcano Rifle", value = "WEAPON_SNIPERRIFLE_CARCANO"},
            {label = "Winchester Repeater", value = "WEAPON_REPEATER_WINCHESTER"},
            {label = "Henry Repeater", value = "WEAPON_REPEATER_HENRY"},
            {label = "Evans Repeater", value = "WEAPON_REPEATER_EVANS"},
            {label = "Doublebarrel Shotgun", value = "WEAPON_SHOTGUN_DOUBLEBARREL"},
        }
    }, function(data, menu)
        local weaponHash = data.current.value
        TriggerServerEvent("giveWeaponFromMenu", weaponHash)
    end, function(data, menu)
        menu.close() 
    end)
end, false)

RegisterNUICallback("menu_cancel", function(data)
    MenuData.CloseAll()
end)

RegisterCommand("ammomenu", function()
    MenuData.CloseAll()
    local elements = {
        {label = "Revolver Ammo Normal", value = {key = "AMMO_REVOLVER", name = "Revolver Ammo Normal"}},
        {label = "Rifle Ammo Normal", value = {key = "AMMO_RIFLE", name = "Rifle Ammo Normal"}},
        {label = "Repeater Ammo Normal", value = {key = "AMMO_REPEATER", name = "Repeater Ammo Normal"}},
        {label = "Shotgun Ammo Normal", value = {key = "AMMO_SHOTGUN", name = "Shotgun Ammo Normal"}},
    }

    MenuData.Open("default", GetCurrentResourceName(), "ammo_menu", {
        title = "Mühimmat Menüsü",
        align = "top-left",
        elements = elements
    }, function(data, menu)
        local ammoData = data.current.value
        TriggerServerEvent("giveAmmoFromMenu", ammoData.key, ammoData.name)
    end, function(data, menu)

        menu.close() 
    end)
end, false)


RegisterNUICallback("menu_cancel", function(data)
    MenuData.CloseAll()
end)