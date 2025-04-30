SMODS.Enhancement {
	key = "kintsugi",
	atlas = 'enhancers',
	pos = {x= 1, y = 1},
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
	shatters = true,
	config = {extra = {p_dollars = 5}},
    in_pool = function() return false end,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.p_dollars
            }
        }
    end,

	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            return {
                dollars = card.ability.extra.p_dollars
            }
		end

        if context.after and context.cardarea == G.play and card.ability.extra.p_dollars > 0 then
            card.ability.extra.p_dollars = card.ability.extra.p_dollars - 1
        end

        if context.destroy_card and card.ability.extra.p_dollars <= 0 then
            return {remove = true}
        end
	end
}