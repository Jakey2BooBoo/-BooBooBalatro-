SMODS.Enhancement {
	key = "stained_green",
	atlas = 'enhancers',
	pos = {x= 1, y = 0},
	shatters = true,
    weight = 2,
	config = {extra = {break_odds = 16, bonus_odds = 4}},
    in_pool = function(self, args)
        available = false
        for _, c in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(c, 'm_bb_stained_green') then
                available = true
            end
        end
        return available
    end,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.bonus_odds,
                card.ability.extra.break_odds,
			}
        }
    end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			if pseudorandom('m_stained_green') <= G.GAME.probabilities.normal / card.ability.extra.bonus_odds then
				G.E_MANAGER:add_event(Event({
					trigger = 'before',
					delay = 0.8,
					func = (function()
						G.GAME.probabilities.normal = G.GAME.probabilities.normal + 1
						card_eval_status_text(card, 'extra', nil, nil, nil, {
							message = "+1 Odds",
							colour = G.C.CHANCE,
							card = card,
							instant = true
						})
						return true
					end)
				}))
			end
		end
		if context.destroy_card and context.cardarea == G.play then
			if SMODS.has_enhancement(context.destroy_card, 'm_bb_stained_green') and pseudorandom('m_stained_green') <= G.GAME.probabilities.normal / card.ability.extra.break_odds then
				return {
					remove = true
				}
            end
		end
		if context.discard and context.other_card then
            if SMODS.has_enhancement(context.other_card, 'm_bb_stained_green') and pseudorandom('m_stained_green') <= G.GAME.probabilities.normal / card.ability.extra.break_odds then
                return {
                    remove = true
                }
            end
        end
	end
}