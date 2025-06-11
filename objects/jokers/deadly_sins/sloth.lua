SMODS.Joker {
    key = 'sloth',
    rarity = 2,
    atlas = 'jokers',
    pos = { x = 0, y = 1 },
    cost = 7,
    blueprint_compat = true,
    config = { extra = { hand_mult = 2, blind_mult = 2 }},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.blind_mult,
                card.ability.extra.hand_mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            G.E_MANAGER:add_event(Event({func = function()
                ease_hands_played((G.GAME.current_round.hands_left * card.ability.extra.hand_mult) - G.GAME.current_round.hands_left, true)
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_mult
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            return true end }))
        end
    end
}