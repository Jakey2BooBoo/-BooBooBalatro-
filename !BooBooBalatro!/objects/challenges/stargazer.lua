--Table Insert
    table.insert(G.CHALLENGES,#G.CHALLENGES+1,{
        name = 'Stargazer',
        id = 'c_mod_bb_stargazer',
         rules = {
            custom = {
            },
            modifiers = {
                {id = 'dollars', value = 4},
                {id = 'discards', value = 4},
                {id = 'hands', value = 4},
                {id = 'reroll_cost', value = 5},
                {id = 'joker_slots', value = 5},
                {id = 'consumable_slots', value = 5},
                {id = 'hand_size', value = 7},
            }
        },
        jokers = {
            {id = 'j_constellation'},
            {id = 'j_astronomer'},
            {id = 'j_satellite'},
        },
        consumeables = {
        },
        vouchers = {
            {id = 'v_planet_merchant'},
            {id = 'v_planet_tycoon'},
            {id = 'v_telescope'},
            {id = 'v_observatory'},
        },
        deck = {
            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
            },
            banned_tags = {
            },
            banned_other = {
            }
        }
    })

-- Localization

G.localization.misc.challenge_names["c_mod_bb_stargazer"] = "Stargazer"

