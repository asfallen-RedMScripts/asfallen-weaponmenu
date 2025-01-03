local MenuData = exports["vorp_menu"]:GetMenuData()
Config = {}

Config.weaponCategories = {
    revolvers = {
        label = "Revolverlar",
        weapons = {
            {label = "Navy Revolver", value = "WEAPON_REVOLVER_NAVY", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Cattleman Revolver", value = "WEAPON_REVOLVER_CATTLEMAN", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Double Action Revolver", value = "WEAPON_REVOLVER_DOUBLEACTION", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Schofield Revolver", value = "WEAPON_REVOLVER_SCHOFIELD", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Lemat Revolver", value = "WEAPON_REVOLVER_LEMAT", desc = "PageUp ile geri gidebilirsiniz"},
        }
    },
    pistols = {
        label = "Tabancalar",
        weapons = {
            {label = "Volcanic Pistol", value = "WEAPON_PISTOL_VOLCANIC", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "M1899 Pistol", value = "WEAPON_PISTOL_M1899", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Semi-Auto Pistol", value = "WEAPON_PISTOL_SEMIAUTO", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Mauser Pistol", value = "WEAPON_PISTOL_MAUSER", desc = "PageUp ile geri gidebilirsiniz"},
        }
    },
    rifles = {
        label = "Tüfekler",
        weapons = {
            {label = "Rollingblock Rifle", value = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Carcano Rifle", value = "WEAPON_SNIPERRIFLE_CARCANO", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Springfield Rifle", value = "WEAPON_RIFLE_SPRINGFIELD", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Bolt Action Rifle", value = "WEAPON_RIFLE_BOLTACTION", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Varmint Rifle", value = "WEAPON_RIFLE_VARMINT", desc = "PageUp ile geri gidebilirsiniz"},
        }
    },
    repeaters = {
        label = "Repeaterlar",
        weapons = {
            {label = "Winchester Repeater", value = "WEAPON_REPEATER_WINCHESTER", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Henry Repeater", value = "WEAPON_REPEATER_HENRY", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Evans Repeater", value = "WEAPON_REPEATER_EVANS", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Carbine Repeater", value = "WEAPON_REPEATER_CARBINE", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Lancaster Repeater", value = "WEAPON_REPEATER_LANCASTER", desc = "PageUp ile geri gidebilirsiniz"},
        }
    },
    shotguns = {
        label = "Av Tüfekleri",
        weapons = {
            {label = "Doublebarrel Shotgun", value = "WEAPON_SHOTGUN_DOUBLEBARREL", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Pump Shotgun", value = "WEAPON_SHOTGUN_PUMP", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Repeating Shotgun", value = "WEAPON_SHOTGUN_REPEATING", desc = "PageUp ile geri gidebilirsiniz"},
            {label = "Semiauto Shotgun", value = "WEAPON_SHOTGUN_SEMIAUTO", desc = "PageUp ile geri gidebilirsiniz"},
        }
    }
}

Config.ammos = {
    {label = "Revolver Ammo Normal", value = {key = "AMMO_REVOLVER", name = "Revolver Ammo Normal"}},
    {label = "Rifle Ammo Normal", value = {key = "AMMO_RIFLE", name = "Rifle Ammo Normal"}},
    {label = "Repeater Ammo Normal", value = {key = "AMMO_REPEATER", name = "Repeater Ammo Normal"}},
    {label = "Shotgun Ammo Normal", value = {key = "AMMO_SHOTGUN", name = "Shotgun Ammo Normal"}},
    {label = "Pistol Ammo Normal", value = {key = "AMMO_PISTOL", name = "Pistol Ammo Normal"}},
    {label = "Varmint Ammo Normal", value = {key = "AMMO_22", name = "Varmint Ammo Normal"}},
    {label = "Elephant Rifle Ammo Normal", value = {key = "AMMO_RIFLE_ELEPHANT", name = "Elephant Rifle Ammo Normal"}},
}

local WeaponMenuKeyHash=0x446258B6 -- PageUp
local AmmoMenuKeyHash=0x4AF4D473  -- Del

local function openCategoryMenu(category, lastMenu)
    MenuData.CloseAll()
    local elements = Config.weaponCategories[category].weapons
    
    MenuData.Open('default', GetCurrentResourceName(), 'weapon_category_menu',
        {
            title = Config.weaponCategories[category].label,
            align = "top-left",
            elements = elements,
            lastmenu = lastMenu
        },
        function(data, menu)
            if data.current.value then
                TriggerServerEvent("giveWeaponFromMenu", data.current.value)
            end
        end,
        function(data, menu)
            menu.close()
            if data.current == "backup" then
                lastMenu()
            end
        end
    )
end

local function openWeaponCategoryMenu(category, categoryName)
    MenuData.CloseAll()
    local elements = {}
    
    for _, weapon in pairs(Config.weaponCategories[category].weapons) do
        table.insert(elements, {
            label = weapon.label,
            value = weapon.value,
            desc = "PageUp ile geri gidebilirsiniz"
        })
    end
    
    MenuData.Open('default', GetCurrentResourceName(), 'weapon_category_menu',
        {
            title = categoryName,
            align = "top-left",
            elements = elements,
            lastmenu = lastMenu
        },
        function(data, menu)
            if data.current.value then
                TriggerServerEvent("giveWeaponFromMenu", data.current.value)
            end
        end,
        function(data, menu)
            menu.close()
            if data.current == "backup" then
                lastMenu()
            end
        end
    )
end

local function openWeaponMenu()
    MenuData.CloseAll()
    local elements = {}
    
    for category, data in pairs(Config.weaponCategories) do
        table.insert(elements, {
            label = data.label,
            value = category,
            desc = "BackSpace ile çıkabilirsiniz"
        })
    end
    
    MenuData.Open('default', GetCurrentResourceName(), 'weapon_main_menu',
        {
            title = "Silah Menüsü",
            align = "top-left",
            elements = elements
        },
        function(data, menu)
            if data.current.value then
                openCategoryMenu(data.current.value, function() openWeaponMenu() end)
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

local function openAmmoMenu()
    MenuData.CloseAll()
    local elements = {}
    
    for _, ammo in pairs(Config.ammos) do
        table.insert(elements, {
            label = ammo.label,
            value = ammo.value,
            desc = "BackSpace ile çıkabilirsiniz"
        })
    end
    
    MenuData.Open('default', GetCurrentResourceName(), 'ammo_menu',
        {
            title = "Mermi Menüsü",
            align = "top-left",
            elements = elements
        },
        function(data, menu)
            if data.current.value then
                TriggerServerEvent("giveAmmoFromMenu", data.current.value.key, data.current.value.name)
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

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

RegisterCommand("weaponmenu", function()
    openWeaponMenu()
end, false)

RegisterCommand("ammomenu", function()
    openAmmoMenu()
end, false)