SMODS.Joker {
    key = 'greed',
    rarity = 2,
    atlas = 'jokers',
    pos = { x = 3, y = 1 },
    cost = 7,
    blueprint_compat = true,
    config = { extra = {odds = 7, play_dollars = 1, held_dollars = 1}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_SEALS.Gold
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                card.ability.extra.play_dollars,
                card.ability.extra.held_dollars
            }
        }
    end,
    
    calculate = function(self, card, context)
    
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_seal() == "Gold" then
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars or 0
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars + card.ability.extra.play_dollars
                return {
                    message = 'Upgrade!',
                    colour = G.C.MONEY,
                    card = context.other_card
                }
            end
        end
    
        if context.discard and context.other_card then
            if SMODS.has_enhancement(context.other_card, 'm_gold') or context.other_card:get_seal() == "Gold" then
                return {
                    remove = true
                }
            end
        end

        if context.end_of_round and context.individual and context.cardarea == G.hand then
            if SMODS.has_enhancement(context.other_card, 'm_gold') then
                context.other_card.ability.perma_h_dollars = context.other_card.ability.perma_h_dollars or 0
                context.other_card.ability.perma_h_dollars = context.other_card.ability.perma_h_dollars + card.ability.extra.held_dollars
                return {
                    message = 'Upgrade!',
                    colour = G.C.MONEY,
                    card = context.other_card
                }
            end
        end
    end
}