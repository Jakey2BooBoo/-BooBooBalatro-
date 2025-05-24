SMODS.Voucher{
    key = 'refund',
    atlas = 'vouchers',
    pos = {x = 0, y = 0},
	config = {extra = {to_claim = 0}},
    calculate= function(self, card, context)
        if card.ability.extra and context.hooked and context.hooked.destroying_joker then
            card.ability.extra.to_claim = card.ability.extra.to_claim + context.hooked.destroyed_joker.sell_cost
        end
        if card.ability.extra and context.main_eval and context.setting_blind and G.GAME.blind:get_type() == 'Small' then
            local ret_val = 0
            ret_val = card.ability.extra.to_claim
            card.ability.extra.to_claim = 0
            if ret_val > 0 then
                ease_dollars(ret_val)
                G.E_MANAGER:add_event(Event({
                    trigger = "before",
                    blockable = false,
                    blocking = false,
                    delay = 0.5,
                    func = function()
                        attention_text({
                            scale = 1,
                            text = 'Refund!',
                            hold = 5,
                            align = "lb",
                            offset = { x = 1.8, y = 1.3 },
                            major = G.play
                        })
                        return true
                    end
                }))
                
            end
        end
    end
}
