SMODS.Joker {
    key = 'wrath',
    rarity = 2,
    atlas = 'jokers',
    pos = { x = 2, y = 1 },
    cost = 7,
    blueprint_compat = true,
    config = { extra = {odds = 7, scored_glass = 1}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                card.ability.extra.scored_glass
            }
        }
    end,

    addacopyitsaboy = function(_card)
        local c1 = copy_card(_card, nil, nil, G.playing_card)
        _card:juice_up()
        c1:add_to_deck()
        G.deck:emplace(c1)
        table.insert(G.playing_cards, c1)
        playing_card_joker_effects({c1})
    end,

    calculate = function(self, card, context)
        local glass_enhancements = {'m_glass','m_bb_stained_red','m_bb_stained_gold','m_bb_stained_green','m_bb_stained_blue','m_bb_wild_glass'}
        if context.destroy_card and context.cardarea == G.hand then
            for _, glass_type in ipairs(glass_enhancements) do
                if context.destroy_card and SMODS.has_enhancement(context.destroy_card, glass_type) then
                    return { 
                        remove = true
                    }
                end
            end
        end

        if context.before and not context.retrigger then
            for _, c in ipairs(context.scoring_hand) do
                for _, glass_type in ipairs(glass_enhancements) do
                    if SMODS.has_enhancement(c, glass_type) then
                        local chance = card.ability.extra.scored_glass
                        while chance > card.ability.extra.odds do
                            self.addacopyitsaboy(c)
                            chance = chance - card.ability.extra.odds
                        end
                        if pseudorandom('j_wrath') <= chance / card.ability.extra.odds then
                            self.addacopyitsaboy(c)
                        end
                        card.ability.extra.scored_glass = card.ability.extra.scored_glass + G.GAME.probabilities.normal
                    end
                end
            end
        end

        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.scored_glass = G.GAME.probabilities.normal
            return{
                message = 'Reset!',
                card = card,
                colour = G.C.WHITE
            }
        end
    end
}