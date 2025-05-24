SMODS.Joker {
    key = 'bargaining',
    rarity = 3,
    atlas = 'jokers',
    pos = { x = 1, y = 0 },
    cost = 8,
    blueprint_compat = true,
    config = {extra = {odds = 5}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_death
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            for _, c in ipairs(context.scoring_hand) do
                c:flip()
                if pseudorandom('j_bargaining') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.5,
                            func = (function()
                                (context.blueprint_card or card):juice_up(0.8, 0.8)
                                local d = create_card(nil, G.consumeables, nil, nil, nil, nil,'c_death', 'j_bargaining')
                                d:add_to_deck()
                                G.consumeables:emplace(d)
                                G.GAME.consumeable_buffer = 0
                                card_eval_status_text(c, 'extra', nil, nil, nil, {
                                    message = "Death!",
                                    colour = G.C.PURPLE,
                                    card = c,
                                    instant = true
                                })
                                return true
                            end)
                        }))
                    else
                        c:flip()
                    end
                else
                    c:flip()
                end
            end
        end

        if context.destroy_card and context.cardarea == G.play and not context.blueprint then
            card:juice_up()
            context.destroy_card:flip()
            if pseudorandom('j_bargaining') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    message = 'Oops!',
                    colour = G.C.PURPLE,
                    delay = 0.45, 
                    remove = true,
                    message_card = context.destroy_card
                }
            end
            context.destroy_card:flip()
        end
    end
}