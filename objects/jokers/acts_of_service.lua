SMODS.Joker {
    key = 'acts_of_service',
    rarity = 1,
    atlas = 'jokers',
    pos = { x = 0, y = 2 },
    cost = 5,
    blueprint_compat = true,
    config = { extra = {odds = 5}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        local picked_indeces = {}
        if context.individual and context.cardarea == G.hand and context.scoring_hand then
            local hand_card = context.other_card
            local enhancement = nil
            for k, v in pairs(SMODS.get_enhancements(hand_card)) do
                if v then
                    enhancement = k
                end
            end
            if hand_card and enhancement ~= nil and #context.scoring_hand >= 1 and #picked_indeces < #context.scoring_hand then
                if pseudorandom('j_acts_of_service') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                    local all_indeces = {}
                    for i = 1, #context.scoring_hand, 1 do
                        all_indeces[#all_indeces + 1] = i
                    end
                    local unique = false
                    local chosen_index = nil
                    while not unique do
                        unique = true
                        chosen_index = pseudorandom_element(all_indeces, pseudoseed('j_acts_of_service'))
                        for _, v in ipairs(picked_indeces) do
                            if chosen_index == v then
                                unique = false
                            end
                        end
                    end
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.5, func = function() 
                        picked_indeces[#picked_indeces + 1] = chosen_index
                        context.scoring_hand[chosen_index]:juice_up()
                        hand_card:juice_up()
                        context.scoring_hand[chosen_index]:set_ability(enhancement)
                        return true end
                    }))
                    return {
                        message = 'Share!',
                        colour = G.C.PURPLE,
                        card = hand_card
                    }
                else
                    return {
                        message = 'Nope!',
                        colour = G.C.PURPLE,
                        card = hand_card
                    }
                end
            end
        end
    end
}
