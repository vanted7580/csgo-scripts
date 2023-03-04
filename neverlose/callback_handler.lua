callback_handler = 
{
    callbacks = {},
    add_callback = function(self, event, func, prio)
        prio = math.default(prio, 50) -- defualt priority
        self.callbacks[event] = math.default(self.callbacks[event], {})
        table.insert(self.callbacks[event], {func, prio})
    end,
    sort_algorithm = function(item_a, item_b)
        return item_a[2] > item_b[2]
    end,
    init_event = "init",
    start = function(self, sort)
        sort = math.default(sort, true)
        if sort then
            table.sort(self.callbacks[self.init_event], self.sort_algorithm)
        end
        for _, data in ipairs(self.callbacks[self.init_event]) do
            data[1]()
        end
        for event, content in pairs(self.callbacks) do
            if event == self.init_event then
                goto continue
            end
            if sort then
                table.sort(content, self.sort_algorithm)
            end
            for _, data in ipairs(content) do
                events[event]:set(data[1])
            end
            ::continue::
        end
        self.callbacks = {}
    end
}
