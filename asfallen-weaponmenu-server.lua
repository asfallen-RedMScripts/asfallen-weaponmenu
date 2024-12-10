local VorpCore = {}
local VorpInv = {}

TriggerEvent("getCore", function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("giveWeaponFromMenu")
AddEventHandler("giveWeaponFromMenu", function(weaponHash)
    local _source = source
    local weaponName = weaponHash:gsub("WEAPON_", ""):gsub("_", " "):gsub("^%l", string.upper)
    local Character = VorpCore.getUser(_source).getUsedCharacter
    VorpCore.NotifyRightTip(_source, weaponName .." silah envanterinize eklendi.", 5000)
    VorpInv.createWeapon(_source, weaponHash, {}, {})

end)

RegisterServerEvent("giveAmmoFromMenu")
AddEventHandler("giveAmmoFromMenu", function(ammoKey, ammoName)
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    VorpInv.addBullets(_source, ammoKey, 100)
    VorpCore.NotifyRightTip(_source, ammoName .. " envanterinize eklendi.", 5000)
end)