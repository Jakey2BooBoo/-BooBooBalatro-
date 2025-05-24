SMODS.Joker {
    key = 'acceptance',
    rarity = 3,
    atlas = 'jokers',
    pos = { x = 3, y = 0 },
    cost = 8,
    blueprint_compat = false,
    config = { extra = {mult = 0, bonus = 0.25}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.bonus,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            local total_qualities = 0
            local pair_qualities = 0
            local left_card = nil
            local right_card = nil
            for i = 1, (#context.scoring_hand - 1), 1 do
                pair_qualities = 0
                left_card = context.scoring_hand[i]
                right_card = context.scoring_hand[i+1]
                if left_card:get_id() <= 10 and right_card:get_id() <= 10 then
                    if left_card:is_suit('Diamonds') and right_card:is_suit('Diamonds') then
                        pair_qualities = pair_qualities + 1
                    end
                    if left_card:is_suit('Clubs') and right_card:is_suit('Clubs') then
                        pair_qualities = pair_qualities + 1
                    end
                    if left_card:is_suit('Hearts') and right_card:is_suit('Hearts') then
                        pair_qualities = pair_qualities + 1
                    end
                    if left_card:is_suit('Spades') and right_card:is_suit('Spades') then
                        pair_qualities = pair_qualities + 1
                    end
                    if left_card:get_id() == right_card:get_id() then
                        pair_qualities = pair_qualities + 1
                    end
                    if left_card:get_seal() and right_card:get_seal() and left_card:get_seal() == right_card:get_seal() then
                        pair_qualities = pair_qualities + 1
                    end
                    if left_card.config.center.key ~= 'c_base' and right_card.config.center.key ~= 'c_base' and left_card.config.center.key == right_card.config.center.key then
                        pair_qualities = pair_qualities + 1
                    end
                    if left_card.edition and right_card.edition and left_card.edition.key == right_card.edition.key then
                        pair_qualities = pair_qualities + 1
                    end

                    total_qualities = total_qualities + pair_qualities
                    
                    if pair_qualities > 0 then
                        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.64,func = function()
                            card:juice_up()
                            context.scoring_hand[i]:juice_up()
                            context.scoring_hand[i+1]:juice_up()
                            card_eval_status_text(context.scoring_hand[i], 'extra', nil, nil, nil, {
                                message = '->',
                                colour = G.C.RED,
                                card = context.scoring_hand[i],
                                instant = true
                            })
                            card_eval_status_text(context.scoring_hand[i+1], 'extra', nil, nil, nil, {
                                message = '<-',
                                colour = G.C.RED,
                                card = context.scoring_hand[i+1],
                                instant = true
                            })
                            return true
                        end }))
                    end
                end
            end
            if total_qualities > 0 then
                card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.bonus * total_qualities)
                return {
                    message = 'Upgrade!',
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
				mult = card.ability.extra.mult,
			}
        end
    end
}