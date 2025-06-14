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
        if context.after and not context.end_of_round then
            for _, c in ipairs(G.hand.cards) do
                if not c.debuff then
                    c.ability.perma_h_mult = c.ability.perma_h_mult or 0
                    c.ability.perma_h_mult = c.ability.perma_h_mult + card.ability.extra.h_mult
                    local chance = pseudorandom('j_quality_time')
                    
                    if c.ability.perma_mult >= 50 then
                        if chance <= G.GAME.probabilities.normal / card.ability.extra.odds and c.edition == nil then
                            c:set_edition('e_holo', true)
                            c.ability.perma_h_mult = c.ability.perma_h_mult - 50
                        end
        
                    elseif c.ability.perma_mult >= 20 then
                        if chance == G.GAME.probabilities.normal / card.ability.extra.odds and c.config.center == G.P_CENTERS.c_base then
                            c:set_ability('m_mult')
                            c.ability.perma_h_mult = c.ability.perma_h_mult - 20
                        end
                    end
    
                    G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.77,func = function()
                        card:juice_up()
                        c:juice_up()
                        card_eval_status_text(c, 'extra', nil, nil, nil, {
                            message = 'Upgrade!',
                            colour = G.C.RED,
                            card = c,
                            instant = true
                        })
                    return true end }))
                end
            end
        end
    end
}