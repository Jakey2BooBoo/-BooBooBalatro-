local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.last_tarot = nil
    ret.probabilities.base = 1
	return ret
end

local scu = set_consumeable_usage
set_consumeable_usage = function(self)
    local ret = scu(self)
    if self.config.center_key and self.ability.consumeable then
        if self.ability.set == 'Tarot' then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        func = function()
                            G.GAME.last_tarot = self.config.center_key
                        return true
                    end}))
                return true
            end}))
        end
    end
    return ret
end

local nr = new_round
new_round = function()
    local ret = nr()
        G.GAME.probabilities.base = G.GAME.probabilities.normal
    return ret
end

local er = end_round
end_round = function()
    local ret = er()
        G.GAME.probabilities.normal = G.GAME.probabilities.base
    return ret
end