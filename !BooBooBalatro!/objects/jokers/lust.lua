SMODS.Joker {
    key = 'lust',
    rarity = 2,
    atlas = 'jokers',
    pos = { x = 5, y = 1 },
    cost = 7,
    blueprint_compat = true,
    config = { extra = {odds = 7}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            local played_suits = {}
            local eligable_cards = {}
            local wild_collection = {}
            local all_suits = {'Diamonds', 'Hearts', 'Clubs', 'Spades'}

            for _, c in ipairs(context.scoring_hand) do
                played_suits[c.base.suit] = true
                if c.config.center.key == "m_wild" then
                    for _, s in ipairs(all_suits) do
                        played_suits[s] = true
                    end
                end
            end

            for _, c in ipairs(G.hand.cards) do
                if c.config.center.key == "m_wild" then
                    wild_collection[#wild_collection+1] = c
                elseif not played_suits[c.base.suit] then
                    eligable_cards[#eligable_cards+1] = c
                end
            end

            for _, c in ipairs(wild_collection) do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function() 
                    c:highlight(true)
                    play_sound('card3')
                    card:juice_up()
                    return true
                end}))
                if pseudorandom('j_lust') <= G.GAME.probabilities.normal / (card.ability.extra.odds ^ 2) then
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            c:change_suit(pseudorandom_element(all_suits, pseudoseed('lust')))
                            c:juice_up()
                            return true
                        end)
                    }))
                end
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function() 
                    c:highlight(false)
                    return true
                end}))
            end

            for _, c in ipairs(eligable_cards) do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function() 
                    c:highlight(true)
                    play_sound('card3')
                    card:juice_up()
                    return true
                end}))
                if pseudorandom('j_lust') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            card_eval_status_text(c, 'extra', nil, nil, nil, {
                                message = 'Wild!',
                                colour = G.C.RED,
                                card = c,
                                instant = true
                            }) 
                            c:set_ability('m_wild')
                            c:juice_up()
                            return true
                        end)
                    }))
                end
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function() 
                    c:highlight(false)
                    return true
                end}))
            end
        end
        -- Check if card is wild and it needs to be retriggered
        if context.repetition and context.cardarea == G.play then
            if context.other_card.config.center.key == "m_wild" then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end
    end
}