--Table Insert
    table.insert(G.CHALLENGES,#G.CHALLENGES+1,{
        name = 'Copycat',
        id = 'c_mod_bb_copycat',
         rules = {
            modifiers = {
                {id = 'dollars', value = 4},
                {id = 'discards', value = 4},
                {id = 'hands', value = 4},
                {id = 'reroll_cost', value = 5},
                {id = 'joker_slots', value = 5},
                {id = 'consumable_slots', value = 2},
                {id = 'hand_size', value = 8},
            }
        },
        jokers = {
            {id = 'j_blueprint', eternal = true, pinned=true},
            {id = 'j_blueprint', eternal = true, pinned=true},
            {id = 'j_blueprint', eternal = true, pinned=true},
            {id = 'j_blueprint', eternal = true, pinned=true},
        },
        vouchers = {
            {id = 'v_tarot_merchant'},
            {id = 'v_planet_merchant'},
            {id = 'v_tarot_tycoon'},
            {id = 'v_planet_tycoon'},
            {id = 'v_overstock_norm'},
            {id = 'v_overstock_plus'},
        },
        deck = {
            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
                
            },
            banned_tags = {
                {id = 'tag_rare'},
                {id = 'tag_uncommon'},
                {id = 'tag_holo'},
                {id = 'tag_polychrome'},
                {id = 'tag_negative'},
                {id = 'tag_foil'},
                {id = 'tag_buffoon'},
                {id = 'tag_top_up'},

            },
            banned_other = {
                {id = 'bl_final_acorn', type = 'blind'},
                {id = 'bl_final_heart', type = 'blind'},
                {id = 'bl_final_leaf', type = 'blind'}
            }
        }
    })

-- Localization

	G.localization.misc.challenge_names["c_mod_bb_copycat"] = "Copycat"