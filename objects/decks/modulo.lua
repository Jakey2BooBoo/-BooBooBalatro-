SMODS.Back{
    key = 'modulo',
    atlas = 'enhancers',
    pos = {x = 0, y = 2},
	config = {hands = 1, consumables = {}, joker_slot = 2},
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.hands, self.config.discards}}
    end,
    apply = function(self,back)
        ease_ante(-1)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
        G.GAME.banned_keys['bl_needle'] = true
    end,
    calculate = function(self, back, context)
        if context.context == 'final_scoring_step' then
            local blind_amt = G.GAME.blind and G.GAME.blind.chips or 1
            if hand_chips * mult >= (1 * blind_amt) then
                hand_chips = (hand_chips * mult) % blind_amt
                mult = 1
                update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local text = localize('bb_mod')
                        play_sound("slice1", 0.94, 0.3)
                        play_sound("slice1", 0.94 * 1.5, 0.2)
                        play_sound("tarot1", 1.5)
                        ease_colour(G.C.UI_CHIPS, { 0.8, 0.85, 0.85, 1 })
                        ease_colour(G.C.UI_MULT, { 0.8, 0.85, 0.85, 1 })
                        attention_text({
                            scale = 1.4,
                            text = text,
                            hold = 2,
                            align = "cm",
                            offset = { x = 0, y = -2.7 },
                            major = G.play
                        })
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            blockable = false,
                            blocking = false,
                            delay = 4.3,
                            func = function()
                                ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                                ease_colour(G.C.UI_MULT, G.C.RED, 2)
                                return true
                            end
                        }))
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            blockable = false,
                            blocking = false,
                            no_delete = true,
                            delay = 6.3,
                            func = function()
                                G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
                                G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return hand_chips, mult
            end
        end
    end
}