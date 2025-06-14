SMODS.Joker {
    key = 'sloth',
    rarity = 2,
    atlas = 'jokers',
    pos = { x = 0, y = 1 },
    cost = 7,
    blueprint_compat = false,
    config = { extra = { hand_chance = 3, next_blind = 0}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hand_chance
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and card.ability.extra.next_blind > 0 and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    G.GAME.blind.chips = card.ability.extra.next_blind
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = '*yawn*',
                        colour = G.C.RED,
                        card = card,
                        instant = true
                    })
            return true end }))
        end
        
        if context.before and not context.blueprint and pseudorandom('fixed') <= 1/card.ability.extra.hand_chance then
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    ease_hands_played(1)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = '*yawn*',
                        colour = G.C.BLUE,
                        card = card,
                        instant = true
                    })
            return true end }))
        end

        if context.end_of_round then
            card.ability.extra.next_blind = G.GAME.chips
        end
    end
}