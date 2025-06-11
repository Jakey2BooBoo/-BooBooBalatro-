SMODS.Joker {
    key = 'gluttony',
    rarity = 2,
    atlas = 'jokers',
    pos = { x = 6, y = 1 },
    cost = 7,
    blueprint_compat = true,
    config = { extra = {odds = 7}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
        info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            for _, c in ipairs(context.scoring_hand) do
                local editions = {'e_foil','e_holo','e_polychrome','e_negative'}
                local seals = {'Gold', 'Red', 'Blue', 'Purple'}
                if not c.edition and pseudorandom('j_gluttony') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                    if c.config.center.key == "m_bonus" then
                        c:set_edition('e_foil', true)
                    elseif c.config.center.key == "m_mult" then
                        c:set_edition('e_holo', true)
                    elseif c.config.center.key == "m_glass" then
                        c:set_edition('e_polychrome', true)
                    elseif c.config.center.key == "m_stone" then
                        c:set_edition('e_negative', true)
                    elseif c.config.center.key == "m_wild" then
                        local ed_to_add = pseudorandom_element(editions, pseudoseed('ed2add'))
                        local seal_to_add = pseudorandom_element(seals, pseudoseed('seal2add'))
                        c:set_edition(ed_to_add, true)
                        c:set_seal(seal_to_add, true)
                    end
                end
            end
        end
    end
}
