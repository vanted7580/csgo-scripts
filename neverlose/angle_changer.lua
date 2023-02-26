
_DEBUG = true


vtable_entry = function(instance, index, type)
    return ffi.cast(type, (ffi.cast("void***", instance)[0])[index])     
end

vtable_bind = function(module, interface, index, typestring)

    local instance = utils.create_interface(module, interface) or error("invalid interface")

    local success, typeof = pcall(ffi.typeof, typestring)

    if not success then

        error(typeof, 2)

    end
        
    local fnptr = vtable_entry(instance, index, typeof) or error("invalid vtable")

    return function(...)

        return fnptr(instance, ...)

    end
end

get_clien_entity_address = vtable_bind("client.dll", "VClientEntityList003", 3, "uint32_t(__thiscall*)(void*, int)")

roll = ui.create("Test"):slider("roll", -90, 90, 0)
pitch = ui.create("Test"):slider("pitch", -180, 180, 90)

change_roll = function()

    local players = entity.get_players(true)

    for _, ent in pairs(players) do

        local address = get_clien_entity_address(ent:get_index())

        ffi.cast("float*", address + 0x117D0)[2] = roll:get()
        ffi.cast("float*", address + 0x117D0)[0] = pitch:get()

    end

end

events.net_update_end:set(function()
    change_roll()
end)

