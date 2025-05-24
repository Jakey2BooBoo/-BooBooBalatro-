SMODS.Voucher{
    key = 'fraud',
    atlas = 'vouchers',
    pos = {x = 0, y = 1},
	config = {extra = {}},
    requires = {'v_bb_refund'},
    
    calculate= function(self, card, context)
        if context.after then
            for k, v in ipairs(G.jokers.cards) do
                if v.set_cost then
                    v:set_cost()
                end
            end
        end
    end
}