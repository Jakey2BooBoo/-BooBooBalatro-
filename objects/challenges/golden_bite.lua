--Table Insert
    table.insert(G.CHALLENGES,#G.CHALLENGES+2,{
        name = 'Golden Bite',
        id = 'c_mod_bb_eat',
         rules = {
            custom = {
                {id = 'no_reward'},
                {id = 'no_extra_hand_money'},
                {id = 'no_interest'}
            },
            modifiers = {
                {id = 'dollars', value = 0},
                {id = 'discards', value = 6},
                {id = 'hands', value = 3},
                {id = 'reroll_cost', value = 5},
                {id = 'joker_slots', value = 5},
                {id = 'consumable_slots', value = 2},
                {id = 'hand_size', value = 5},
            }
        },
        jokers = {
            {id = 'j_midas_mask', edition = 'negative', eternal = true},
            {id = 'j_pareidolia', edition = 'negative', eternal = true},
            {id = 'j_vampire', edition = 'negative', eternal = true},
            {id = 'j_ticket', edition = 'negative', eternal = true},
        },
        consumeables = {
        },
        vouchers = {
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

G.localization.misc.challenge_names["c_mod_bb_eat"] = "Golden Bite"
