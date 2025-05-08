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
        if context.joker_main and context.cardarea == G.jokers then
            if pseudorandom('j_pride') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                local played_cards = {}
                local seals = {'Gold', 'Red', 'Blue', 'Purple'}
                local enhanced = nil
                for _, c in ipairs(context.scoring_hand) do
                    enhanced = false
                    for k, v in pairs(SMODS.get_enhancements(c)) do
                        if v then
                            enhanced = true
                        end
                    end
                    if not enhanced then
                        played_cards[#played_cards + 1] = c
                    end
                end
                if #played_cards >= 1 then
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3,
                        func = (function()
                            local c = pseudorandom_element(played_cards, pseudoseed('pride_card'))
                            local seal = pseudorandom_element(seals, pseudoseed('pride_single'))
                            c:set_seal(seal, true)
                            c:juice_up()
                            card:juice_up()
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Sharing!", colour = G.C.GREEN})
                            return true
                        end)
                    }))
                end
            else
                return {
                    message = 'Nope!',
                    colour = G.C.GREEN,
                    card = card
                }
            end
        end
    end
}
