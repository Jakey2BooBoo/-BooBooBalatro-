SMODS.Enhancement {
	key = "geode",
	atlas = 'enhancers',
	pos = {x= 0, y = 1},
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
	shatters = true,
	config = {extra = {odds = 4}},
    in_pool = function() return false end,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.main_scoring then
            local tot = hand_chips + mult
            hand_chips = math.floor(tot / 2)
            mult = math.floor(tot / 2)
            update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
            G.E_MANAGER:add_event(Event({
                func = (function()
                    local text = localize('k_balanced')
                    play_sound('gong', 0.94, 0.3)
                    play_sound('gong', 0.94*1.5, 0.2)
                    play_sound('tarot1', 1.5)
                    ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
                    ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
                    attention_text({
                        scale = 1.4,
                        text = text,
                        hold = 2,
                        align = "cm",
                        offset = { x = 0, y = -2.7 },
                        major = G.play
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        blockable = false,
                        blocking = false,
                        delay =  1,
                        func = (function() 
                                ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                                ease_colour(G.C.UI_MULT, G.C.RED, 2)
                            return true
                        end)
                    }))
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        blockable = false,
                        blocking = false,
                        no_delete = true,
                        delay =  2,
                        func = (function() 
                            G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
                            G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
                            return true
                        end)
                    }))
                    return true
                end)
            }))
		end

        if context.destroy_card and context.cardarea == G.play then
			if SMODS.has_enhancement(context.destroy_card, 'm_bb_geode') and pseudorandom('m_geode') <= G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					remove = true
				}
            end
		end
	end
}