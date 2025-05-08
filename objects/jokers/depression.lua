SMODS.Joker {
    key = 'depression',
    rarity = 3,
    atlas = 'jokers',
    pos = { x = 2, y = 0 },
    cost = 8,
    blueprint_compat = true,
    config = { extra = {odds = 5}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            if pseudorandom('j_depression') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.3,
                    func = (function()
                        (context.blueprint_card or card):juice_up(0.8, 0.8)
                        c = pseudorandom_element(G.hand.cards, pseudoseed('j_depression'))
                        if c.edition ~= nil and c.edition.negative then
                            c:set_edition(nil, true)
                            c:set_ability('m_stone')
                        else
                            c:set_edition('e_negative', true)
                        end
                        c:juice_up()
                        return true
                    end)
                }))
            else
                return{
                    message = 'Nope!',
                    card = card,
                    colour = G.C.BLUE
                }
            end
        end
    end
}
