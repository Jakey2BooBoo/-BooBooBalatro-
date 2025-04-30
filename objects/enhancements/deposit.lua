SMODS.Enhancement {
	key = "deposit",
	atlas = 'enhancers',
	pos = {x= 2, y = 1},
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
	shatters = true,
	config = {extra = {x_mult = 4, reduction = 0.5}},
    in_pool = function() return false end,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult,
                card.ability.extra.reduction
            }
        }
    end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            return {
                xmult = card.ability.extra.x_mult
            }
		end

        if context.after and context.cardarea == G.play and card.ability.extra.x_mult > 0 then
            card.ability.extra.x_mult = card.ability.extra.x_mult - card.ability.extra.reduction
        end

        if context.destroy_card and card.ability.extra.x_mult <= 0 then
            return {remove = true}
        end
	end
}