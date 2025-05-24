SMODS.Enhancement {
	key = "stained_gold",
	atlas = 'enhancers',
	pos = {x= 3, y = 0},
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,
	shatters = true,
    weight = 2,
	config = {extra = {p_dollars = 3, odds = 16}},
    in_pool = function(self, args)
        available = false
        for _, c in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(c, 'm_bb_stained_gold') then
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
                card.ability.extra.p_dollars
            }
        }
    end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.main_scoring then
			return {
				p_dollars = card.ability.extra.p_dollars
			}
		end
		if context.destroy_card and context.cardarea == G.play then
			if SMODS.has_enhancement(context.destroy_card, 'm_bb_stained_gold') and pseudorandom('m_stained_gold') <= G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					remove = true
				}
            end
		end
		if context.discard and context.other_card then
            if SMODS.has_enhancement(context.other_card, 'm_bb_stained_gold') and pseudorandom('m_stained_gold') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    remove = true
                }
            end
        end
	end
}