SMODS.Joker {
    key = 'gifts',
    rarity = 1,
    atlas = 'jokers',
    pos = { x = 4, y = 2 },
    cost = 5,
    blueprint_compat = true,
    config = { extra = {odds = 10}},

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            local rarities = {}
            local editions = {}
            for i = 1, #G.jokers.cards do
                rarities[#rarities + 1] = G.jokers.cards[i].config.center.rarity
                if G.jokers.cards[i].edition then
                    editions[#editions + 1] = G.jokers.cards[i].edition.key
                else
                    editions[#editions + 1] = 'e_none'
                end
            end
            local chosen_rarity = pseudorandom_element(rarities, pseudoseed('j_gifts'))
            local chosen_edition = pseudorandom_element(editions, pseudoseed('j_gifts'))
            local tag_map = {
                [1] = 'tag_bb_common', 
                [2] = 'tag_uncommon', 
                [3] = 'tag_rare', 
                [4] = 'tag_bb_legendary',
                ['e_none'] = 'tag_none',
                ['e_negative'] = 'tag_negative',
                ['e_foil'] = 'tag_foil',
                ['e_holo'] = 'tag_holo',
                ['e_polychrome'] = 'tag_polychrome'
            }
            G.E_MANAGER:add_event(Event({
                func = (function()
                    card:juice_up()
                    add_tag(Tag(tag_map[chosen_rarity]))
                    if tag_map[chosen_edition] ~= 'tag_none' then
                        add_tag(Tag(tag_map[chosen_edition]))
                    end
                    return true
                end)
            }))
        end
    end
}