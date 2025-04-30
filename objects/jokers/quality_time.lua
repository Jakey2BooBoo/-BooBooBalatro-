SMODS.Joker {
    key = 'quality_time',
    rarity = 1,
    atlas = 'jokers',
    pos = { x = 1, y = 2 },
    cost = 5,
    config = {extra = {odds = 5, h_mult = 1}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand then
            context.other_card.ability.perma_h_mult = context.other_card.ability.perma_h_mult or 0
            context.other_card.ability.perma_h_mult = context.other_card.ability.perma_h_mult + card.ability.extra.h_mult
            local chance = pseudorandom('j_quality_time')
            
            if context.other_card.ability.perma_mult >= 50 then
                if chance <= G.GAME.probabilities.normal / card.ability.extra.odds and context.other_card.edition == nil then
                    context.other_card:set_edition('e_holo', true)
                    card_eval_status_text(context.other_card, 'extra', nil, nil, nil, {message = 'Upgrade!', colour = G.C.RED})
                    context.other_card.ability.perma_h_mult = context.other_card.ability.perma_h_mult - 50
                    context.other_card:juice_up()
                    card:juice_up()
                end

            elseif context.other_card.ability.perma_mult >= 20 then
                if chance == G.GAME.probabilities.normal / card.ability.extra.odds and context.other_card.config.center == G.P_CENTERS.c_base then
                    context.other_card:set_ability('m_mult')
                    card_eval_status_text(context.other_card, 'extra', nil, nil, nil, {message = 'Upgrade!', colour = G.C.RED})
                    context.other_card.ability.perma_h_mult = context.other_card.ability.perma_h_mult - 20
                    context.other_card:juice_up()
                    card:juice_up()
                end
            end

            return {
                message = 'Upgrade!',
                card = context.other_card,
                colour = G.C.MULT
            }

        end
    end
}