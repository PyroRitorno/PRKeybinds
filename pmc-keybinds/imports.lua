
---@param layout string
---@param keyname string
---@param mapname string
---@param onpress function|nil
---@param onrelease function|nil
---@param seclayout string|nil
---@param seckeyname string|nil
function RegisterKey(layout, keyname, mapname, onpress, onrelease, seclayout, seckeyname)
    TriggerEvent('Orion:rK', layout, keyname, mapname, onpress, onrelease, seclayout, seckeyname)
end

---@param layout string
---@param keyname string
---@param mapname string
---@param onpresscmd string|nil
---@param onreleasecmd string|nil
---@param seclayout string|nil
---@param seckeyname string|nil
function RegisterKeyFromCommand(layout, keyname, mapname, onpresscmd, onreleasecmd, seclayout, seckeyname)
    TriggerEvent('Orion:rKCMD', layout, keyname, mapname, onpresscmd, onreleasecmd, seclayout, seckeyname)
end
