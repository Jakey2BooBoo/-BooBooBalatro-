SMODS.Joker {
    key = 'sloth',
    rarity = 2,
    atlas = 'jokers',
    pos = { x = 0, y = 1 },
    cost = 7,
    blueprint_compat = true,
    config = { extra = { odds = 7 }},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_venus
        info_queue[#info_queue+1] = G.P_CENTERS.c_mars
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable then
            if context.consumeable.ability.set == 'Planet' then
                local planet_hand = context.consumeable.ability.hand_type
                local passdown = {
                    ["Flush Five"] = {},
                    ["Flush House"] = {},
                    ["Five of a Kind"] = {"Flush Five"},
                    ["Straight Flush"] = {},
                    ["Four of a Kind"] = {"Five of a Kind", "Flush Five"},
                    ["Full House"] = {"Flush House"},
                    ["Flush"] = {"Straight Flush", "Flush House", "Flush Five"},
                    ["Straight"] = {"Straight Flush"},
                    ["Three of a Kind"] = {"Full House", "Four of a Kind", "Five of a Kind", "Flush Five", "Flush House", "Flush Five"},
                    ["Two Pair"] = {"Full House", "Flush House"},
                    ["Pair"] = {"Two Pair", "Three of a Kind", "Full House", "Four of a Kind", "Five of a Kind", "Flush Five"},
                    ["High Card"] = {"Pair", "Two Pair", "Three of a Kind", "Straight", "Flush", "Full House", "Four of a Kind", "Straight Flush", "Five of a Kind", "Flush House", "Flush Five"},
                }
                for _, v in ipairs(passdown[planet_hand]) do
                    if v and pseudorandom('j_sloth') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(v, 'poker_hands'),chips = G.GAME.hands[v].chips, mult = G.GAME.hands[v].mult, level=G.GAME.hands[v].level})
                        G.GAME.hands[v].mult = G.GAME.hands[v].mult + G.GAME.hands[planet_hand].l_mult
                        G.GAME.hands[v].chips = G.GAME.hands[v].chips + G.GAME.hands[planet_hand].l_chips
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                            play_sound('tarot1')
                            if card then card:juice_up(0.8, 0.5) end
                            G.TAROT_INTERRUPT_PULSE = true
                            return true end }))
                        update_hand_text({delay = 0}, {mult = G.GAME.hands[v].mult, StatusText = true})
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                            play_sound('tarot1')
                            if card then card:juice_up(0.8, 0.5) end
                            return true end }))
                        update_hand_text({delay = 0}, {chips = G.GAME.hands[v].chips, StatusText = true})
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                            play_sound('tarot1')
                            if card then card:juice_up(0.8, 0.5) end
                            G.TAROT_INTERRUPT_PULSE = nil
                            return true end }))
                        --update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
                        delay(1.3)
                        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
                    end
                end
            end
        end
    end
}