SMODS.Joker {
    key = 'denial',
    rarity = 3,
    atlas = 'jokers',
    pos = { x = 4, y = 0 },
    cost = 8,
    blueprint_compat = false,
    config = { extra = {odds = 8, dollars = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'denial_gold', set = 'Other'}
        info_queue[#info_queue+1] = {key = 'denial_blue', set = 'Other'}
        info_queue[#info_queue+1] = {key = 'denial_purple', set = 'Other'}
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if not context.blueprint then
            if context.individual and context.cardarea == G.play and not context.other_card.debuff then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    local scored = false
                    for _, c in ipairs(context.scoring_hand) do
                        if c == context.other_card then
                            scored = true
                        end
                    end
    
                    if scored and (context.other_card:get_seal() == 'Blue' or context.other_card:get_seal() == 'Purple') then
                        local ret_color = nil
                        if context.other_card:get_seal() == 'Blue' then
                            ret_color = G.C.BLUE
                        elseif context.other_card:get_seal() == 'Purple' then
                            ret_color = G.C.PURPLE
                        end
                        if pseudorandom('j_denial') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            --gives random spectral card
                            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                                local gifted_card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'j_denial')
                                gifted_card:add_to_deck()
                                G.consumeables:emplace(gifted_card)
                                G.GAME.consumeable_buffer = 0
                                return true 
                            end }))
                            return {
                                message = '+1 Spectral!',
                                colour = ret_color,
                                card = context.other_card
                            }
                        else
                            return {
                                message = 'Nope!',
                                colour = ret_color,
                                card = context.other_card
                            }
                        end
                    end
                end
            end
    
            if context.discard and not context.other_card.debuff then
                print(G.GAME.last_tarot)
                if context.other_card:get_seal() == 'Gold' then
                    --Gives money
                    ease_dollars(card.ability.extra.dollars)
                    return {
                        message = '$'..card.ability.extra.dollars,
                        colour = G.C.MONEY,
                        card = context.other_card
                    }
    
                elseif context.other_card:get_seal() == 'Blue' and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    --Gives random planet card
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                        local gifted_card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'j_denial')
                        gifted_card:add_to_deck()
                        G.consumeables:emplace(gifted_card)
                        G.GAME.consumeable_buffer = 0
                        return true 
                    end }))
                    return {
                        message = '+1 Planet!',
                        colour = G.C.BLUE,
                        card = context.other_card
                    }
                end
            end
    
            if context.end_of_round and context.individual and context.cardarea == G.hand then
                if context.other_card:get_seal() == 'Purple' and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    --Gives most recent tarot card played
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                        gifted_card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, G.GAME.last_tarot, 'j_denial')
                        gifted_card:add_to_deck()
                        G.consumeables:emplace(gifted_card)
                        G.GAME.consumeable_buffer = 0
                        return true 
                    end }))
                    return {
                        message = '+1 Tarot!',
                        colour = G.C.PURPLE,
                        card = context.other_card
                    }
    
                elseif context.other_card:get_seal() == 'Gold' then
                    --gives money
                    ease_dollars(card.ability.extra.dollars)
                    return {
                        message = '$'..card.ability.extra.dollars,
                        colour = G.C.MONEY,
                        card = context.other_card
                    }
                end
            end
        end
    end
}