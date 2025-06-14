return {
    descriptions = {
        Back={
            b_bb_aid = {
                name = "!Aid! Deck",
                text={
                    "{C:dark_edition}!BooBooBalatro! Jokers{}",
                    "are {C:green}3x more likely{}",
                    "to appear."
                },
            },
            b_bb_modulo = {
                name = "Modulo Deck",
                text={
                    "If {C:chips}Chips{} x {C:mult}Mult{} surpasses",
                    "blind amount, subtracts blind",
                    "amount from projected score.",
                    "{C:attention}-1{} Starting Ante",
                    "{C:blue}+1{} Hands",
                    "{C:purple}+2{} Joker Slots"
                },
            },
            b_bb_cathedral = {
                name = "Cathedral Deck",
                text={
                    "Start with {C:attention}5{} full",
                    "suits of {C:attention}upgraded{}",
                    "Glass Cards"
                },
            },
            b_bb_rogue = {
                name = "Rogue Deck",
                text={
                    "Reroll Starts at {C:money}$10{}",
                    "After Defeating each blind, gain a",
                    "{C:blue}Standard{}, {C:tarot}Charm{},",
                    "{C:planet}Meteor{}, and {C:attention}Buffoon{} Tag."
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
                    "when scored or discarded"
                }
            },
            m_bb_stained_blue = {
                name = "Blue Stained Glass",
                label = "Blue Stained Glass",
                text = {
                    "{C:green}#1# in #2#{} chance to {C:blue}upgrade{}",
                    "played poker hand when scored.",
                    "{C:green}#1# in #3#{} chance to shatter",
                    "when scored or discarded"
                }
            },
            m_bb_stained_gold = {
                name = "Gold Stained Glass",
                label = "Gold Stained Glass",
                text = {
                    "Earn {C:money}$#3#{} when scored",
                    "{C:green}#1# in #2# chance{} to shatter",
                    "when scored or discarded"
                }
            },
            m_bb_stained_green = {
                name = "Green Stained Glass",
                label = "Green Stained Glass",
                text = {
                    "{C:green}#1# in #2#{} chance to increase",
                    "all probabilities for the round by {X:green,C:white}+1{}",
                    "{C:green}#1# in #3#{} chance to shatter",
                    "when scored or discarded"
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
                    'Reduces by {C:gold}$1{} each scoring.',
                    '{C:inactive}no rank or suit{}'
                }
            },
            m_bb_geode = {
                name = "Geode",
                label = "Geode",
                text = {
                    'Balances {C:blue}Chips{} and {C:mult}Mult{}',
                    '{C:green}#1# in #2#{} chance of being destroyed',
                    '{C:inactive}no rank or suit{}'
                }
            },
            m_bb_deposit = {
                name = "Ruby Deposit",
                label = "Ruby Deposit",
                text = {
                    'Scores {X:mult,C:white} X#1# {} Mult when scored.',
                    'Reduces by {X:mult,C:white} X#2# {} Mult each time scored.',
                    '{C:inactive}no rank or suit{}'
                }
            },
        },
        Joker={
            j_bb_denial = {
                name = 'Denial',
                text = {
                    "{C:gold}Gold{}, {C:purple}Purple{}, and {C:blue}Blue{} seals have",
                    "additional effects when {C:red}discarded{}",
                    "and {C:attention}held in hand at the end of round{}",
                    "{inactive}and something else...{}"
                }
            },
            j_bb_anger = {
                name = 'Anger',
                text = {
                    'Gains {X:mult,C:white} X#1# {} Mult per',
                    '{C:attention}unscored{} card in played hand',
                    '{C:inactive}(Starts at {X:mult,C:white} X#2# {} Mult)',
                }
            },
            j_bb_bargaining = {
                name = 'Bargaining',
                text = {
                    "When using a {C:planet}Planet{} card,",
                    "{C:green}#1# in #2#{} chance to increase",
                    "{C:chips}Chips{} and {C:mult}Mult{} of {C:attention}each poker hand{}",
                    "that contains the upgraded hand",
                    "{C:inactive}(e.g. {C:planet}Venus{} has a chance to increase {C:planet}Mars{})"
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
                    "This card gains {C:chips}+#2#{} Chips for each quality",
                    "shared between adjacent scored {C:attention}Numbered Cards{}",
                    "(qualities: rank, suit, enhancement, edition, seal)",
                    "{C:inactive}(Currently {}{C:chips}+#1# Chips{})"
                }
            },
            j_bb_pride = {
                name = 'Pride',
                text = {
                    "{C:attention}Unenhanced{} cards have",
                    "a {C:green}#1# in #2#{} chance to",
                    "gain a random {C:attention}seal{}",
                    "after scoring"
                }
            },
            j_bb_envy = {
                name = 'Envy',
                text = {
                    "Every unscored cared has a",
                    "{C:green}#1# in #2#{} chance to turn",
                    "into a {C:attention}copy{} of a scored card."
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
                    '{C:gold}Gold{} cards and cards with',
                    '{C:gold}gold{} seals gain {C:gold}$#3#{} to their',
                    'bonus when triggerd and are',
                    '{C:red}destroyed{} when discarded'
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
                    "Wild cards {C:attention}retrigger{} when scored.",
                }
            },
            j_bb_sloth = {
                name = 'Sloth',
                text = {
                    '{C:green}1 in #1#{} chance to regain',
                    '{C:blue}1 Hand{} after each hand played.',
                    'When selecting blind, sets {C:attention}blind score{}',
                    'to the {C;attention}score{} achieved last round.',
                    '{C:inactive} Oops! This Joker is uneffected by{}',
                    '{C:inactive}actions that modify odds{}'
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
                    "score {X:mult,C:white} X#1# {} Mult"
                }
            },
            j_bb_physical_touch = {
                name = 'Physical Touch',
                text = {
                    "If scored hand contains a {C:attention}Straight,",
                    "each held card that {C:attention}continues{} the",
                    "{C:attention}Straight{} gives {X:mult,C:white} X#1# {} Mult"
                }
            },
            j_bb_gifts = {
                name = 'Gifts',
                text = {
                    "After defeating a blind,",
                    "create a {C:attention}random{} Joker Tag",
                    "with the same rarity as a {C:attention}random{} joker.",
                    "If chosen joker has an {C:dark_edition}edition{}, create",
                    "a matching edition tag as well"
                }
            },
        },
        Other={
            bb_green_seal = {
                name = 'Green Seal',
                text = {
                  'Increases all odds',
                  'this round by {X:green,C:white}+1{}'
                },
            },
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
        Spectral={
            c_bb_void = {
                name = 'Void',
                text = {
                    "Upgrade up to 4",
                    "{C:attention}Stone{} or {C:attention}Glass{} cards"
                },
            },
            c_bb_branch = {
                name = 'Branch',
                text = {
                    "Turns central cards in hand",
                    "into {C:attention}Stained Glass{} cards.",
                    "{C:spades}Spades{}, {C:hearts}Hearts{}, {C:clubs}Clubs{}, and {C:diamonds}Diamonds{}",
                    "get stained {C:green}Green{}, {C:red}Red{}, {C:blue}Blue{}, {C:money}Gold{}",
                    "respectively"
                },
            },
            c_bb_chance = {
                name = 'Chance',
                text = {
                    "Add a {C:green}Green Seal{}",
                    "to {C:attention}1{} selected",
                    "card in your hand"
                },
            },
        },
        Stake={},
        Tag={
            tag_bb_common = {
                name = 'Common Tag',
                text = {
                    "Shop has a free",
                    "{C:blue}Common Joker{}"
                }
            },
            tag_bb_legendary = {
                name = 'Legendary Tag',
                text = {
                    "Shop has a free",
                    "{C:purple}Legendary Joker{}"
                }
            },
        },
        Tarot={},
        Voucher={
            v_bb_refund = {
                name = 'Refund Policy',
                text = {
                    "{C:}When setting Big Blind{}, recieve",
                    "a refund for all Jokers {C:red}destroyed{}",
                    "since last refund, based on Joker sell value",
                }
            },
            v_bb_fraud = {
                name = 'Joker Insurance Fraud',
                text = {
                    "{C:}When setting Small Blind{}, recieve",
                    "payment for all Jokers {C:red}destroyed{}",
                    "since last claim issued, based on Joker sell value",
                    "{C:inactive}regardless of any refunds...{}"
                }
            },
        },
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            bb_mod = 'Modulo!'
        },
        high_scores={},
        labels={
            bb_green_seal = "Green Seal"
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={

        },
        v_text={

        },
    },
}