SMODS.Enhancement {
	key = "stained_red",
	atlas = 'enhancers',
	pos = {x= 2, y = 0},
	shatters = true,
    weight = 2,
	config = {extra = {Xmult = 2, odds = 16}},
    in_pool = function(self, args)
        available = false
        for _, c in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(c, 'm_bb_stained_red') then
                available = true
            end
        end
        return available
    end,
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
		if context.main_scoring then
			return {
				xmult = card.ability.extra.Xmult
			}
		end
		if context.destroy_card and context.cardarea == G.play then
			if SMODS.has_enhancement(context.destroy_card, 'm_bb_stained_red') and pseudorandom('m_stained_red') <= G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					remove = true
				}
            end
		end
		if context.discard and context.other_card then
            if SMODS.has_enhancement(context.other_card, 'm_bb_stained_red') and pseudorandom('m_stained_red') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    remove = true
                }
            end
        end
	end
}