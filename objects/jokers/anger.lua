SMODS.Joker {
    key = 'anger',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.bonus,
                card.ability.extra.Xmult
            }
        }
    end,
    rarity = 3,
    atlas = 'jokers',
    pos = { x = 0, y = 0 },
    cost = 8,
    blueprint_compat = true,
    config = { extra = {bonus = 1, Xmult = 1}},

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then

            local hand_map = {}
            local scored_indexes = {}
            local unscored_indexes = {}
            
            for i = 1, #context.full_hand do
                hand_map[#hand_map+1] = false
                local c1 = context.full_hand[i]
                for j = 1, #context.scoring_hand do
                    local c2 = context.scoring_hand[j]
                    if c1 == c2 then
                        hand_map[i] = true
                    end
                end
            end

            if #hand_map > 0 then
                for i = 1, #hand_map do
                    if not hand_map[i] and not context.full_hand[i].debuff then
                        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.bonus
                        G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.16,func = function()
                            context.full_hand[i]:juice_up()
                            card:juice_up()
                        return true end }))
                    end
                end
            end
            return {
                xmult = card.ability.extra.Xmult,
            }
        end
        if context.after and context.cardarea == G.jokers then
            card.ability.extra.Xmult = 1
        end
    end
}