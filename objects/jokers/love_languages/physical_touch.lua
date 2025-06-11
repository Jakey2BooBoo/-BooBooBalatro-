SMODS.Joker {
    key = 'physical_touch',
    rarity = 1,
    atlas = 'jokers',
    pos = { x = 3, y = 2 },
    cost = 5,
    blueprint_compat = true,
    config = { extra = {Xmult = 2.5}},

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and context.scoring_hand then
            local continued_cards = {}
            if context.poker_hands and next(context.poker_hands['Straight']) then
                local full_table = {}
                for _, c in ipairs(context.scoring_hand) do
                    full_table[#full_table+1] = c
                end
                for _, c in ipairs(G.hand.cards) do
                    full_table[#full_table+1] = c
                end
                local big_straight = nil
                --find "straights", the list of all straights between scored and held cards
                local hands = evaluate_poker_hand(full_table)
                local straights = hands["Straight"]
                --define "big_straight",  the largest hand within "straights" is that contains all of the scored cards
                for i = 1, #straights do
                    local all_contained = true
                    for _, c in ipairs(context.scoring_hand) do
                        local is_there = false
                        -- check to see if the card "c" in scoring hand is in the big straight
                        for _, h in ipairs(straights[i]) do
                            if c == h then
                                is_there = true
                            end
                        end
                        --if one of the scoring cards is not in the big straight, break from loop and check the next large-straight
                        if not is_there then
                            all_contained = false
                            break
                        end
                    end
                    if all_contained then
                        big_straight = straights[i]
                        break
                    end
                end
                if big_straight == nil then
                    return {}
                end

                --pull the scored cards out of the cards we want to apply the bonus to
                for _, b in ipairs(big_straight) do
                    for _, c in ipairs(G.hand.cards) do
                        if b == c then
                            local already_scored = false
                            for _, s in ipairs(context.scoring_hand) do
                                if s:get_id() == c:get_id() then
                                    already_scored = true
                                end
                            end
                            if not already_scored then
                                continued_cards[#continued_cards+1] = c
                            end
                        end
                    end
                end
            end
            for _, c in ipairs(continued_cards) do
                if c == context.other_card then
                    return {
                        xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
    end
}

