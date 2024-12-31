local MenuData = exports["vorp_menu"]:GetMenuData()
Config = {}

Config.weapons = {
    {label = "Navy Revolver", value = "WEAPON_REVOLVER_NAVY"},
    {label = "Cattleman Revolver", value = "WEAPON_REVOLVER_CATTLEMAN"},
    {label = "Rollingblock Rifle", value = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK"},
    {label = "Carcano Rifle", value = "WEAPON_SNIPERRIFLE_CARCANO"},
    {label = "Winchester Repeater", value = "WEAPON_REPEATER_WINCHESTER"},
    {label = "Henry Repeater", value = "WEAPON_REPEATER_HENRY"},
    {label = "Evans Repeater", value = "WEAPON_REPEATER_EVANS"},
    {label = "Doublebarrel Shotgun", value = "WEAPON_SHOTGUN_DOUBLEBARREL"},
}

Config.ammos = {
    {label = "Revolver Ammo Normal", value = {key = "AMMO_REVOLVER", name = "Revolver Ammo Normal"}},
    {label = "Rifle Ammo Normal", value = {key = "AMMO_RIFLE", name = "Rifle Ammo Normal"}},
    {label = "Repeater Ammo Normal", value = {key = "AMMO_REPEATER", name = "Repeater Ammo Normal"}},
    {label = "Shotgun Ammo Normal", value = {key = "AMMO_SHOTGUN", name = "Shotgun Ammo Normal"}},
}


local WeaponMenuKeyHash=0x446258B6 -- PageUp
local AmmoMenuKeyHash=0x3C3DD371  -- PageDown

local function openWeaponMenu()
    MenuData.CloseAll()
    MenuData.Open("default", GetCurrentResourceName(), "weapon_menu", {
        title = "Silah Menüsü",
        align = "top-left",
        elements = Config.weapons
    }, function(data, menu)
        local weaponHash = data.current.value
        TriggerServerEvent("giveWeaponFromMenu", weaponHash)
    end, function(data, menu)
        menu.close() 
    end)
end

local function openAmmoMenu()
    MenuData.CloseAll()
    MenuData.Open("default", GetCurrentResourceName(), "ammo_menu", {
        title = "Mühimmat Menüsü",
        align = "top-left",
        elements = Config.ammos
    }, function(data, menu)
        local ammoData = data.current.value
        TriggerServerEvent("giveAmmoFromMenu", ammoData.key, ammoData.name)
    end, function(data, menu)
        menu.close() 
    end)
end
--[[

RegisterCommand("weaponmenu", function()
    openWeaponMenu()
end, false)

RegisterCommand("ammomenu", function()
    openAmmoMenu()
end, false)

]]

CreateThread(function()
    while true do
      Wait(0)
      if IsControlJustPressed(0, WeaponMenuKeyHash) then
        openWeaponMenu()
      end

      if IsControlJustPressed(0, AmmoMenuKeyHash) then
        openAmmoMenu()
      end
    
    end
  end)

RegisterNUICallback("menu_cancel", function(data)
    MenuData.CloseAll()
end)