local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.last_tarot = nil
    ret.probabilities.base = 1
	return ret
end

--Thank you Paperback!
-- Adds new context that happens after destroying jokers
local remove_ref = Card.remove
function Card.remove(self)
    -- Check that the card being removed is a joker that's in the player's deck and that it's not being sold
    if self.added_to_deck and self.ability.set == 'Joker' and not G.CONTROLLER.locks.selling_card then
    SMODS.calculate_context({
        hooked = {
            destroying_joker = true,
            destroyed_joker = self
        }
    })
    end
    return remove_ref(self)
end

local set_cost_ref = Card.set_cost
function Card.set_cost(self)
    self.extra_cost = 0 + G.GAME.inflation
    if self.edition then
        self.extra_cost = self.extra_cost + (self.edition.holo and 3 or 0) + (self.edition.foil and 2 or 0) + 
        (self.edition.polychrome and 5 or 0) + (self.edition.negative and 5 or 0)
    end
    self.cost = math.max(1, math.floor((self.base_cost + self.extra_cost + 0.5)*(100-G.GAME.discount_percent)/100))
    if G.GAME.used_vouchers["v_bb_fraud"] then
        if self.ability.set == "Joker" then
            if self.ability.chips then
                self.cost = self.cost + 2*math.floor(self.ability.chips/10)
            end
            if self.ability.mult then
                self.cost = self.cost + 2*math.floor(self.ability.mult/10)
            end
            if self.ability.Xchips then
                self.cost = self.cost + 2*math.floor(self.ability.Xchips/1)
            end
            if self.ability.Xmult then
                self.cost = self.cost + 2*math.floor(self.ability.Xmult/1)
            end
            if self.ability.dollars then
                self.cost = self.cost + 2*math.floor(self.ability.dollars/1)
            end
            if self.ability.extra and type(self.ability.extra) == "table" then
                if self.ability.extra.chips then
                    self.cost = self.cost + 2*math.floor(self.ability.extra.chips/10)
                end
                if self.ability.extra.mult then
                    self.cost = self.cost + 2*math.floor(self.ability.extra.mult/10)
                end
                if self.ability.extra.Xchips then
                    self.cost = self.cost + 2*math.floor(self.ability.extra.Xchips/1)
                end
                if self.ability.extra.Xmult then
                    self.cost = self.cost + 2*math.floor(self.ability.extra.Xmult/1)
                end
                if self.ability.extra.dollars then
                    self.cost = self.cost + 2*math.floor(self.ability.dollars/1)
                end
            end
        end
    end
    if self.ability.set == 'Booster' and G.GAME.modifiers.booster_ante_scaling then
        self.cost = self.cost + G.GAME.round_resets.ante - 1 
        end
    if self.ability.set == 'Booster' and (not G.SETTINGS.tutorial_complete) and G.SETTINGS.tutorial_progress and (not G.SETTINGS.tutorial_progress.completed_parts['shop_1']) then
        self.cost = self.cost + 3
    end
    if (self.ability.set == 'Planet' or (self.ability.set == 'Booster' and self.ability.name:find('Celestial'))) and #find_joker('Astronomer') > 0 then 
        self.cost = 0
    end
    if self.ability.rental then
        self.cost = 1
    end
    self.sell_cost = math.max(1, math.floor(self.cost/2)) + (self.ability.extra_value or 0)
    if self.area and self.ability.couponed and (self.area == G.shop_jokers or self.area == G.shop_booster) then
        self.cost = 0
    end
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
    return set_cost_ref
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

