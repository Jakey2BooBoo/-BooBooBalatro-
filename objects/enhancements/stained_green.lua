SMODS.Enhancement {
	key = "stained_green",
	atlas = 'enhancers',
	pos = {x= 1, y = 0},
	shatters = true,
    weight = 2,
	config = {extra = {break_odds = 16, bonus_odds = 4}},
    in_pool = function() return false end,
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
		if context.setting_blind then
			G.GAME.green_shattered = false
		end

		if context.cardarea == G.play and context.main_scoring then
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
       
		if context.destroy_card then
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