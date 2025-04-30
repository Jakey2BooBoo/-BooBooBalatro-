SMODS.Enhancement {
	key = "stained_blue",
	atlas = 'enhancers',
	pos = {x= 0, y = 0},
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,
	shatters = true,
    weight = 2,
	config = {extra = {Xchips = 1.25, odds = 16}},
    in_pool = function() return false end,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                card.ability.extra.Xchips
            }
        }
    end,

	calculate = function(self, card, context)
		if context.cardarea == G.play and context.main_scoring then
			return {
				xchips = card.ability.extra.Xchips
			}
		end
       
		if context.destroy_card and context.cardarea == G.play then
			if SMODS.has_enhancement(context.destroy_card, 'm_bb_stained_blue') and pseudorandom('m_stained_blue') <= G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					remove = true
				}
            end
		end

		if context.discard and context.other_card then
            if SMODS.has_enhancement(context.other_card, 'm_bb_stained_blue') and pseudorandom('m_stained_blue') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    remove = true
                }
            end
        end
	end
}