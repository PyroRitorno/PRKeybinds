-- Change this version to forcibly refresh all keybinds for all players
-- This will reset each keybind to their set default value for everyone
VER = '0001'

---@param lay string
---@param key string
---@param mapname string
---@param onpress function?
---@param onrelease function?
---@param seclay string?
---@param seckey string?
RegisterNetEvent('PRKeybinds:RegisterKey', function(lay, key, mapname, onpress, onrelease, seclay, seckey)
	local mapcmdname = mapname:gsub('%s+', ''):lower()
	lay, key = lay:lower(), key:lower()
	if seclay and seckey then
		seclay, seckey = seclay:lower(), seckey:lower()
    end

	RegisterNetEvent(('PRKeybinds:Press:%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname), onpress)
	RegisterNetEvent(('PRKeybinds:Release:%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname), onrelease)

	RegisterCommand(('+%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname),
	function()
        -- print('FUNC    '..('+%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname)..'    '..type(onpress))
		if onpress ~= nil then
            TriggerEvent(('PRKeybinds:Press:%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname))
            -- print('FUNC    '..('+%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname)..'    trigger')
        end
	end)
	RegisterCommand(('-%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname),
	function()
        -- print('FUNC    '..('-%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname)..'    '..type(onrelease))
		if onrelease ~= nil then
            TriggerEvent(('PRKeybinds:Release:%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname))
            -- print('FUNC    '..('-%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname)..'    trigger')
        end
	end)

	RegisterKeyMapping(('+%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname), mapname, lay, key)
	if seclay and seckey then
		RegisterKeyMapping(('~!+%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname), mapname, seclay, seckey)
	end
end)

---@param lay string
---@param key string
---@param mapname string
---@param onpresscmd string?
---@param onreleasecmd string?
---@param seclay string?
---@param seckey string?
RegisterNetEvent('PRKeybinds:RegisterKeyCMD', function(lay, key, mapname, onpresscmd, onreleasecmd, seclay, seckey)
	local mapcmdname = mapname:gsub('%s+', ''):lower()
	lay, key = lay:lower(), key:lower()
	if seclay and seckey then
		seclay, seckey = seclay:lower(), seckey:lower()
    end

	RegisterNetEvent(('PRKeybinds:Press:%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname), function()
        if onpresscmd then
            ExecuteCommand(onpresscmd)
        end
    end)
	RegisterNetEvent(('PRKeybinds:Release:%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname), function()
        if onreleasecmd then
            ExecuteCommand(onreleasecmd)
        end
    end)

	RegisterCommand(('+%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname),
	function()
        -- print('CMD    '..('+%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname)..'    '..type(onpresscmd)..'    '..tostring(onpresscmd))
		if type(onpresscmd) == 'string' then
            TriggerEvent(('PRKeybinds:Press:%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname))
            -- print('CMD    '..('+%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname)..'    trigger')
        end
	end)
	RegisterCommand(('-%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname),
	function()
        -- print('CMD    '..('-%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname)..'    '..type(onreleasecmd)..'    '..tostring(onreleasecmd))
		if type(onreleasecmd) == 'string' then
            TriggerEvent(('PRKeybinds:Release:%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname))
            -- print('CMD    '..('-%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname)..'    trigger')
        end
	end)

	RegisterKeyMapping(('+%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname), mapname, lay, key)
	if seclay and seckey then
		RegisterKeyMapping(('~!+%s_%s_%s_%s_%s_%s'):format(VER, lay, key, seclay, seckey, mapcmdname), mapname, seclay, seckey)
	end
end)



RegisterNetEvent(
---@param lay string
---@param key string
---@param mapname string
---@param onpress function?
---@param onrelease function?
---@param seclay string?
---@param seckey string?
'RegisterKey', function(lay, key, mapname, onpress, onrelease, seclay, seckey)
    TriggerEvent('PRKeybinds:RegisterKey', lay, key, mapname, onpress, onrelease, seclay, seckey)
end)

RegisterNetEvent(
---@param lay string
---@param key string
---@param mapname string
---@param onpresscmd string?
---@param onreleasecmd string?
---@param seclay string?
---@param seckey string?
'RegisterKeyFromCommand', function(lay, key, mapname, onpresscmd, onreleasecmd, seclay, seckey)
    TriggerEvent('PRKeybinds:RegisterKeyCMD', lay, key, mapname, onpresscmd, onreleasecmd, seclay, seckey)
end)

