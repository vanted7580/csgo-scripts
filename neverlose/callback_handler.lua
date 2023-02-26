
_DEBUG = true

local __main__ = function()

    local menu_handler = {
        ui_elements = {},
        init = function(self)
            
        end,
        menu_update = function(self)
            print(1)
        end
    }

    local callback_handler = 
    {
        callbacks = {},
        add_callback = function(self, e, fn)
            if self.callbacks[e] == nil then
                self.callbacks[e] = {}
            end
            table.insert(self.callbacks[e], fn)
        end,
        init = function(self)
            for key, content in pairs(self.callbacks) do
                events[key]:set(function(...)
                    for _, fn in ipairs(content) do
                        fn(...)
                    end
                end)
            end
        end
    }

    callback_handler:add_callback('render', menu_handler.menu_update)


    callback_handler:init()
    menu_handler:init()

end

__main__()
