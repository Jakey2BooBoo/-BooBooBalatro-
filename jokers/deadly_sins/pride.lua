SMODS.Joker {
    key = 'pride',
    rarity = 2,
    atlas = 'jokers',
    pos = { x = 4, y = 1},
    cost = 7,
    blueprint_compat = true,
    config = { extra = {odds = 7}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers and not context.blueprint then
            local unenhanced = {}
            local enhanced = nil
            for _, c in ipairs(context.scoring_hand) do
                enhanced = false
                for k, v in pairs(SMODS.get_enhancements(c)) do
                    if v then
                        enhanced = true
                    end
                end
                if not enhanced then
                    unenhanced[#unenhanced + 1] = c
                end
            end
            for _, c in ipairs(unenhanced) do
                if pseudorandom('j_pride') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                    G.E_MANAGER:add_event(Event({trigger = 'before',delay = 2.5,func = function()
                        c:juice_up(0.3,1)
                        card:juice_up(0.3,2)
                        c:set_seal(SMODS.poll_seal({guaranteed = true}), true)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = 'Nice!',
                            colour = G.C.ATTENTION,
                            card = card,
                            instant = true
                        })
                    return true end}))
                else
                    G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.5,func = function()
                        c:juice_up(0.3,0.3)
                        card:juice_up(0.3,0.3)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = 'Nope!',
                            colour = G.C.ATTENTION,
                            card = card,
                            instant = true
                        })
                    return true end}))
                end
            end
        end
    end
}
