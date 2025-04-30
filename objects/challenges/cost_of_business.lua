--Table Insert
    table.insert(G.CHALLENGES,#G.CHALLENGES+1,{
        name = 'Cost of Business',
        id = 'c_mod_bb_cost_of_business',
         rules = {
            custom = {
                {id = 'no_reward'},
                {id = 'no_extra_hand_money'},
                {id = 'no_interest'}
            },
            modifiers = {
                {id = 'dollars', value = 0},
                {id = 'discards', value = 2},
                {id = 'hands', value = 4},
                {id = 'reroll_cost', value = 5},
                {id = 'joker_slots', value = 6},
                {id = 'consumable_slots', value = 1},
                {id = 'hand_size', value = 4},
            }
        },
        jokers = {
            {id = 'j_sixth_sense', eternal =true},
            {id = 'j_8_ball', eternal =true},
            {id = 'j_cloud_9', eternal =true},
            {id = 'j_certificate', edition = 'negative', rental = true},
            {id = 'j_marble', edition = 'negative', rental = true},
            {id = 'j_dna'},
            {id = 'j_trading'},
        },
        consumeables = {
        },
        vouchers = {
            {id = 'v_hieroglyph'},
            {id = 'v_petroglyph'},
        },
        deck = {
            cards = {{s='S',r='6',g='Red',},{s='S',r='8',g='Purple',},{s='S',r='9',g='Gold',},},
            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
                {id = 'p_arcana_normal_1', ids = {
                    'p_arcana_normal_1','p_arcana_normal_2','p_arcana_normal_3','p_arcana_normal_4','p_arcana_jumbo_1','p_arcana_jumbo_2','p_arcana_mega_1','p_arcana_mega_2',
                }},
                {id = 'p_celestial_normal_1', ids = {
                    'p_celestial_normal_1','p_celestial_normal_2','p_celestial_normal_3','p_celestial_normal_4','p_celestial_jumbo_1','p_celestial_jumbo_2','p_celestial_mega_1','p_celestial_mega_2',
                }},
            },
            banned_tags = {
            },
            banned_other = {
            }
        }
    })


-- Localization

    G.localization.misc.challenge_names["c_mod_bb_cost_of_business"] = "Cost of Business"
