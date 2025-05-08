return {
    descriptions = {
        Back={
            b_bb_modulo = {
                name = "Modulo Deck",
                text={
                    "If {C:chips}chips{} x {C:mult}mult{} surpasses",
                    "blind amount, subtracts blind",
                    "amount from projected score"
                },
            },
            b_bb_cathedral = {
                name = "Cathedral Deck",
                text={
                    "Start with 5 full",
                    "suits of glass cards"
                },
            },
        },
        Blind={},
        Edition={},
        Enhanced={
            m_bb_stained_red = {
                name = "Red Stained Glass",
                label = "Red Stained Glass",
                text = {
                    "{X:mult,C:white} X#3# {} Mult when played or in hand",
                    "{C:green}#1# in #2#{} chance to shatter",
                    "when played or discarded"
                }
            },
            m_bb_stained_blue = {
                name = "Blue Stained Glass",
                label = "Blue Stained Glass",
                text = {
                    "{X:chips,C:white} X#3# {} Chips when scored",
                    "{C:green}#1# in #2#{} chance to shatter",
                    "when played or discarded"
                }
            },
            m_bb_stained_gold = {
                name = "Gold Stained Glass",
                label = "Gold Stained Glass",
                text = {
                    "Earn {C:money}$#3#{} when scored",
                    "{C:green}#1# in #2# chance{} to shatter",
                    "when played or discarded"
                }
            },
            m_bb_stained_green = {
                name = "Green Stained Glass",
                label = "Green Stained Glass",
                text = {
                    "{C:green}#1# in #2#{} chance to increase",
                    "all probabilities for the round by {X:green,C:white}+1{}",
                    "{C:green}#1# in #3#{} chance to shatter",
                    "when played or discarded"
                }
            },
            m_bb_wild_glass = {
                name = "Wild Glass",
                label = "Wild Glass",
                text = {
                    "Acts as any suit,",
                    "{X:mult,C:white} X#3# {} Mult",
                    "{C:green}#1# in #2#{} chance to destroy card",
                }
            },
            m_bb_kintsugi = {
                name = "Kintsugi",
                label = "Kintsugi",
                text = {
                    'Earn {C:gold}$#1#{} when scored.',
                    'Reduces by {C:gold}$1{} each scoring.'
                }
            },
            m_bb_geode = {
                name = "Geode",
                label = "Geode",
                text = {
                    'Balances {C:blue}chips{} and {C:mult}mult{}',
                    '{C:green}#1# in #2#{} chance of being destroyed'
                }
            },
            m_bb_deposit = {
                name = "Ruby Deposit",
                label = "Ruby Deposit",
                text = {
                    'Scores {X:mult,C:white} X#1# {} Mult when scored.',
                    'Reduces by {X:mult,C:white} X#2# {} Mult each scoring.'
                }
            },
        },
        Joker={
            j_bb_denial = {
                name = 'Denial',
                text = {
                    "{C:gold}Gold{}, {C:purple}Purple{}, and {C:blue}Blue{}, seals have",
                    "additional effects when {C:red}discarded{}",
                    "and {C:attention}held in hand at the end of round{}",
                }
            },
            j_bb_anger = {
                name = 'Anger',
                text = {
                    '{X:chips,C:white} X#2# {} Chips, additional',
                    '{X:chips,C:white} X#1# {} Chips per {C:attention}unscored{}',
                    'card in played hand'
                }
            },
            j_bb_bargaining = {
                name = 'Bargaining',
                text = {
                    "Cards played have a {C:green}#1# in #2#{}",
                    "chance to be destroyed and a {C:green}#1# in #2#{}",
                    "chance to grant a copy of {C:attention}Death{}"
                }
            },
            j_bb_depression = {
                name = 'Depression',
                text = {
                    "{C:green}#1# in #2#{} chance to turn a",
                    "random held card {C:dark_edition}negative{}.",
                    "Card turns to stone if already {C:dark_edition}negative{}"
                }
            },
            j_bb_acceptance = {
                name = 'Acceptance',
                text = {
                    "This card gains {C:mult}+#2#{} mult for each quality",
                    "shared between adjacent scored {C:attention}numbered cards{}",
                    "(qualities: rank, suit, enhancement, edition, seal)",
                    "{C:inactive}(Currently {}{C:mult}+#1# mult{})"
                }
            },
            j_bb_pride = {
                name = 'Pride',
                text = {
                    "{C:attention}Unenhanced{} cards have a {C:green}#1# in #2#{}",
                    "chance to gain a random {C:attention}seal{}"
                }
            },
            j_bb_envy = {
                name = 'Envy',
                text = {
                    "Every unscored cared has a {C:green}#1# in #2#{} chance",
                    "to turn into a copy of a scored card."
                }
            },
            j_bb_wrath = {
                name = 'Wrath',
                text = {
                    "{C:green}#3# in #2#{} chance to copy",
                    "each played {C:attention}Glass{} card.",
                    "Chance increases by {C:green}#1# in #2#{}",
                    "per {C:attention}Glass card{} scored this round.",
                    "{C:red}Destroys{} all {C:attention}Glass{} cards held in hand."
                }
            },
            j_bb_greed = {
                name = 'Greed',
                text = {
                    'Cards with {C:gold}gold{} seals gain {C:gold}$#3#{} scoring bonus',
                    '{C:gold}Gold{} cards gain {C:gold}$#4#{} bonus when held',
                    '{C:gold}Gold{} cards and cards with {C:gold}gold{}',
                    'seals are {C:red}destroyed{} when discarded'
                }
            },
            j_bb_gluttony = {
                name = 'Gluttony',
                text = {
                    "{C:green}#1# in #2#{} chance to upgrade each",
                    "scoring {C:attention}Bonus{} or {C:attention}Mult{} card with",
                    "{C:dark_edition}Foil{} or {C:dark_edition}Holographic{} edition,",
                    "respectively."
                },
            },
            j_bb_lust = {
                name = 'Lust',
                text = {
                    "Held cards that do not share a suit",
                    "with a scored card have a {C:green}#1# in #2#{} chance",
                    "to become a {C:attention}wild card{}.",
                }
            },
            j_bb_sloth = {
                name = 'Sloth',
                text = {
                    "When using a {C:planet}Planet{} card,",
                    "{C:green}#1# in #2#{} chance to increase",
                    "{C:chips}Chips{} and {C:mult}Mult{} of {C:attention}each poker hand{}",
                    "that contains the upgraded hand",
                    "{C:inactive}(e.g. {C:planet}Venus{} has a chance to increase {C:planet}Mars{})"
                }
            },
            j_bb_acts_of_service = {
                name = 'Acts of Service',
                text = {
                    "Every {C:attention}enhanced{} card held in hand has a",
                    "{C:green}#1# in #2#{} chance to apply it's",
                    "{C:attention}enhancement{} to a played card."
                }
            },
            j_bb_quality_time = {
                name = 'Quality Time',
                text = {
                    "Cards not played gain",
                    "{C:mult}+#1# Mult{} when held",
                    "each hand played"
                }
            },
            j_bb_words_of_affirmation = {
                name = 'Words of Affirmation',
                text = {
                    "If an {C:attention}Ace{} is scored,",
                    "all subsequent {C:attention}Kings{}, {C:attention}Queens{}, and {C:attention}Jacks{}",
                    "in the same played hand",
                    "score {X:chips,C:white} X#1# {} Chips"
                }
            },
            j_bb_physical_touch = {
                name = 'Physical Touch',
                text = {
                    "If scored hand contains a {C:attention}Straight,",
                    "each held card that continues the",
                    "{C:attention}straight{} gives {X:mult,C:white} X#1# {} Mult"
                }
            },
            j_bb_gifts = {
                name = 'Gifts',
                text = {
                    "After defeating a blind,",
                    "create a {C:attention}random{} Joker Tag",
                    "with the same rarity as a {C:attention}random{} joker."
                }
            },
        },
        Other={
            denial_gold = {
                name = 'Gold Seal',
                text = {
                    '{C:blue}When played:{} Earn {C:gold}$3{},',
                    '{C:red}When discarded:{} Earn {C:gold}$3{},',
                    '{C:attention}When held at end of round:{} Earn {C:gold}$3{}',
                },
            },
            denial_blue = {
                name = 'Blue Seal',
                text = {
                    '{C:red}When discarded:{} creates a {C:planet}Planet{} card,',
                    '{C:attention}When held at end of round:{} gives the',
                    '{C:planet}Planet{} card for final played {C:attention}poker hand{}',
                },
            },
            denial_purple = {
                name = 'Purple Seal',
                text = {
                    '{C:red}When discarded:{} creates a {C:tarot}Tarot{} card,',
                    '{C:attention}When held at end of round:{} gives the',
                    'last played {C:tarot}Tarot{} card.'
                },
            },
        },
        Planet={},
        Spectral={},
        Stake={},
        Tag={
            tag_bb_common = {
                name = 'Common Tag',
                text = {
                    "Shop has a free",
                    "Common Joker"
                }
            },
            tag_bb_legendary = {
                name = 'Legendary Tag',
                text = {
                    "Shop has a free",
                    "Legendary Joker"
                }
            },
        },
        Tarot={},
        Voucher={},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={},
        high_scores={},
        labels={},
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}