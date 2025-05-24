SMODS.Joker {
    key = 'pride',
    rarity = 2,
    atlas = 'jokers',
    pos = { x = 4, y = 1},
    cost = 7,
    blueprint_compat = true,
    config = { extra = {odds = 7}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            local unenhanced = {}
            local seals = {'Gold', 'Red', 'Blue', 'Purple'}
            local enhanced = nil
            for _, c in ipairs(context.scoring_hand) do
                enhanced = false
                for k, v in pairs(SMODS.get_enhancements(c)) do
                    if v then
                        enhanced = true
                    end
                end
                if not enhanced then
                    unenhanced[#unenhanced + 1] = c
                end
            end
            for _, c in ipairs(unenhanced) do
                if pseudorandom('j_pride') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                    local seal = pseudorandom_element(seals, pseudoseed('pride_single'))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            c:set_seal(seal, true)
                            c:juice_up()
                            card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if #unenhanced > 0 then 
                return {
                    message = 'Nice!',
                    colour = G.C.GREEN,
                    card = card
                }
            end
        end
    end
}
