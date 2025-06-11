SMODS.Seal {
    key = 'Green',
    atlas = 'enhancers',
    pos = { x = 6, y = 4 },
    config = { extra = { bonus = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.bonus } }
    end,
    badge_colour = G.C.GREEN,
    calculate = function(self, card, context)
		if context.cardarea == G.play and context.main_scoring then
			G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.8,
                func = (function()
                    G.GAME.probabilities.normal = G.GAME.probabilities.normal + 1
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "+1 Odds",
                        colour = G.C.GREEN,
                        card = card,
                        instant = true
                    })
                    return true
                end)
            }))
		end
	end,
}