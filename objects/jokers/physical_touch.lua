SMODS.Joker {
    key = 'physical_touch',
    rarity = 1,
    atlas = 'jokers',
    pos = { x = 3, y = 2 },
    cost = 5,
    blueprint_compat = true,
    config = { extra = {Xmult = 3}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)
        local low = nil
        local high = nil
        if context.individual and context.cardarea == G.hand and context.scoring_hand then
            for _, c in ipairs(context.scoring_hand) do
                if not low then
                    low = c:get_id()
                elseif c:get_id() < low then
                    low = c:get_id()
                end
                if not high then
                    high = c:get_id()
                elseif c:get_id() > high then
                    high = c:get_id()
                end
            end
            if context.poker_hands and next(context.poker_hands['Straight']) then
                value = context.other_card:get_id()
                local possible = true
                if low then
                    while possible and value < low do
                        possible = false
                        for _, c in ipairs(G.hand.cards) do
                            if value == low - 1 then
                                possible = true
                                value = low
                                break
                            elseif value == c:get_id() - 1 then
                                possible = true
                                value = c:get_id()
                                break
                            end
                        end
                    end
                end
                if high then
                    while possible and value > high do
                        possible = false
                        for _, c in ipairs(G.hand.cards) do
                            if value == high + 1 then
                                possible = true
                                value = high
                                break
                            elseif value == c:get_id() + 1 then
                                possible = true
                                value = c:get_id()
                                break
                            end
                        end
                    end
                end
                if (low == value or high == value) and context.other_card:get_id() ~= low and context.other_card:get_id() ~= high then
                    return {
                        chips = context.other_card:get_id(),
                        xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
    end
}