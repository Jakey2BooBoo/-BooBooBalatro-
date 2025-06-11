SMODS.Joker {
    key = 'quality_time',
    rarity = 1,
    atlas = 'jokers',
    pos = { x = 1, y = 2 },
    cost = 5,
    blueprint_compat = true,
    config = {extra = {odds = 5, h_mult = 0.1}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_mult
            }
        }
    end,
    calculate = function(self, card, context)
        if not context.end_of_round then
            if context.individual and context.cardarea == G.hand and not context.other_card.debuff then
                local bonus_card = context.other_card
                bonus_card.ability.perma_h_mult = bonus_card.ability.perma_h_mult or 0
                bonus_card.ability.perma_h_mult = bonus_card.ability.perma_h_mult + card.ability.extra.h_mult
                local chance = pseudorandom('j_quality_time')
                
                if bonus_card.ability.perma_mult >= 50 then
                    if chance <= G.GAME.probabilities.normal / card.ability.extra.odds and bonus_card.edition == nil then
                        bonus_card:set_edition('e_holo', true)
                        card_eval_status_text(bonus_card, 'extra', nil, nil, nil, {message = 'Upgrade!', colour = G.C.RED})
                        bonus_card.ability.perma_h_mult = bonus_card.ability.perma_h_mult - 50
                    end
    
                elseif bonus_card.ability.perma_mult >= 20 then
                    if chance == G.GAME.probabilities.normal / card.ability.extra.odds and bonus_card.config.center == G.P_CENTERS.c_base then
                        bonus_card:set_ability('m_mult')
                        card_eval_status_text(bonus_card, 'extra', nil, nil, nil, {message = 'Upgrade!', colour = G.C.RED})
                        bonus_card.ability.perma_h_mult = bonus_card.ability.perma_h_mult - 20
                    end
                end
    
                G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.16,func = function()
                    card:juice_up()
                    bonus_card:juice_up()
                return true end }))
    
                return {
                    message = 'Upgrade!',
                    card = bonus_card,
                    colour = G.C.MULT
                }
            end
        end
    end
}