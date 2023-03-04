registry = 
{
    key_len = {5, 5},
    key_ref = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    key_arange = {'{', '}', '-'},
    key_gen = function(self, key_len, key_sec, key_arange, seed)
        seed = math.default(seed, common.get_timestamp())
        key_len = math.default(key_len, self.key_len[1])
        key_sec = math.default(key_sec, self.key_len[2])
        key_arange = math.default(key_arange, self.key_arange)
        math.randomseed(seed)
        key = key_arange[1]
        for i=1, key_sec do
            for j=1, key_len do
                rand = math.random(1, #self.key_ref)
                key = key .. string.sub(self.key_ref, rand, rand)
            end
            if i ~= key_sec then
                key = key .. key_arange[3]
            end
        end
        key = key .. key_arange[2]
        return key
    end
}
