SMODS.Joker {
    key = 'words_of_affirmation',
    rarity = 1,
    atlas = 'jokers',
    pos = { x = 2, y = 2 },
    cost = 5,
    blueprint_compat = true,
    config = {extra = {Xmult = 2, ace_scored = false}},

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 14 then 
                card.ability.extra.ace_scored = true
            elseif (card.ability.extra.ace_scored and (context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13)) then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end

        if context.after then
            card.ability.extra.ace_scored = false
        end
    end
}