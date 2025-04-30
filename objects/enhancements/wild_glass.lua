SMODS.Enhancement {
	key = "wild_glass",
	atlas = 'enhancers',
	pos = {x= 4, y = 0},
    any_suit = true,
	shatters = true,
    weight = 2,
	config = {extra = {Xmult = 2, odds = 4}},
    in_pool = function() return false end,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                card.ability.extra.Xmult
            }
        }
    end,

	calculate = function(self, card, context)
		if context.cardarea == G.play and context.main_scoring then
			return {
				xmult = card.ability.extra.Xmult
			}
		end
       
		if context.destroy_card and context.cardarea == G.play then
			if SMODS.has_enhancement(context.destroy_card, 'm_bb_wild_glass') and pseudorandom('m_stained_wild_glass') <= G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					remove = true
				}
            end
		end

        if context.discard and context.other_card then
            if SMODS.has_enhancement(context.other_card, 'm_bb_wild_glass') and pseudorandom('m_bb_wild_glass') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    remove = true
                }
            end
        end
	end
}