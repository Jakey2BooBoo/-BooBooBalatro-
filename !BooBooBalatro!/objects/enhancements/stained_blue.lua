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
	config = {extra = {break_odds = 16, bonus_odds = 4}},

    in_pool = function(self, args)
        available = false
        for _, c in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(c, 'm_bb_stained_blue') then
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
		if context.cardarea == G.play and context.main_scoring then
            if pseudorandom('m_stained_blue') <= G.GAME.probabilities.normal / card.ability.extra.bonus_odds then
                local text,disp_text = G.FUNCS.get_poker_hand_info(context.scoring_hand)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(text, 'poker_hands'),chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level=G.GAME.hands[text].level})
                level_up_hand(card, text, nil, 1)
                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
            end
		end
		if context.destroy_card and context.cardarea == G.play then
			if SMODS.has_enhancement(context.destroy_card, 'm_bb_stained_blue') and pseudorandom('m_stained_blue') <= G.GAME.probabilities.normal / card.ability.extra.break_odds then
				return {
					remove = true
				}
            end
		end
		if context.discard and context.other_card then
            if SMODS.has_enhancement(context.other_card, 'm_bb_stained_blue') and pseudorandom('m_stained_blue') <= G.GAME.probabilities.normal / card.ability.extra.break_odds then
                return {
                    remove = true
                }
            end
        end
	end
}