--Table Insert
    table.insert(G.CHALLENGES,#G.CHALLENGES+1,{
    name = 'Wild Side',
    id = 'c_mod_bb_wild_side',
     rules = {
        custom = {
        },
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
        {id = 'j_vampire', eternal = true, pinned=true},
        {id = 'j_greedy_joker', rental = true},
        {id = 'j_lusty_joker', rental = true},
        {id = 'j_wrathful_joker', rental = true},
        {id = 'j_gluttenous_joker', rental = true},
    },
    consumeables = {
    },
    vouchers = {
    },
    deck = {
        cards = {{s='D',r='2',e='m_wild',},{s='D',r='3',e='m_wild',},{s='D',r='4',e='m_wild',},{s='D',r='5',e='m_wild',},{s='D',r='6',e='m_wild',},{s='D',r='7',e='m_wild',},{s='D',r='8',e='m_wild',},{s='D',r='9',e='m_wild',},{s='D',r='T',e='m_wild',},{s='D',r='J',e='m_wild',},{s='D',r='Q',e='m_wild',},{s='D',r='K',e='m_wild',},{s='D',r='A',e='m_wild',},{s='C',r='2',e='m_wild',},{s='C',r='3',e='m_wild',},{s='C',r='4',e='m_wild',},{s='C',r='5',e='m_wild',},{s='C',r='6',e='m_wild',},{s='C',r='7',e='m_wild',},{s='C',r='8',e='m_wild',},{s='C',r='9',e='m_wild',},{s='C',r='T',e='m_wild',},{s='C',r='J',e='m_wild',},{s='C',r='Q',e='m_wild',},{s='C',r='K',e='m_wild',},{s='C',r='A',e='m_wild',},{s='H',r='2',e='m_wild',},{s='H',r='3',e='m_wild',},{s='H',r='4',e='m_wild',},{s='H',r='5',e='m_wild',},{s='H',r='6',e='m_wild',},{s='H',r='7',e='m_wild',},{s='H',r='8',e='m_wild',},{s='H',r='9',e='m_wild',},{s='H',r='T',e='m_wild',},{s='H',r='J',e='m_wild',},{s='H',r='Q',e='m_wild',},{s='H',r='K',e='m_wild',},{s='H',r='A',e='m_wild',},{s='S',r='2',e='m_wild',},{s='S',r='3',e='m_wild',},{s='S',r='4',e='m_wild',},{s='S',r='5',e='m_wild',},{s='S',r='6',e='m_wild',},{s='S',r='7',e='m_wild',},{s='S',r='8',e='m_wild',},{s='S',r='9',e='m_wild',},{s='S',r='T',e='m_wild',},{s='S',r='J',e='m_wild',},{s='S',r='Q',e='m_wild',},{s='S',r='K',e='m_wild',},{s='S',r='A',e='m_wild',},},
        type = 'Challenge Deck',
    },
    restrictions = {
        banned_cards = {
            {id = 'c_jupiter'},
        },
        banned_tags = {
        },
        banned_other = {
            {id = 'bl_club', type = 'blind'},
            {id = 'bl_goad', type = 'blind'},
            {id = 'bl_head', type = 'blind'},
            {id = 'bl_window', type = 'blind'},
        }
    }
})
-- Localization

G.localization.misc.challenge_names["c_mod_bb_wild_side"] = "Wild Side"