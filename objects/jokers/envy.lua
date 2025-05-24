SMODS.Joker {
    key = 'envy',
    rarity = 2,
    atlas = 'jokers',
    pos = { x = 1, y = 1 },
    cost = 7,
    blueprint_compat = true,
    config = { extra = {odds = 7}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            local hand_map = {}
            local scored_indexes = {}
            local unscored_indexes = {}

            for i = 1, #context.full_hand do
                hand_map[#hand_map+1] = false
                local c1 = context.full_hand[i]
                for j = 1, #context.scoring_hand do
                    local c2 = context.scoring_hand[j]
                    if c1 == c2 then
                        hand_map[i] = true
                    end
                end
            end

            if #hand_map > 0 then
                for i = 1, #hand_map do
                    if hand_map[i] then
                        scored_indexes[#scored_indexes+1] = i
                    else
                        unscored_indexes[#unscored_indexes+1] = i
                    end
                end
            end
            --credit goes here--
            if #scored_indexes > 0 and #unscored_indexes > 0 then
                for _, i in ipairs(unscored_indexes) do
                    if pseudorandom('j_envy') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                        local random_scored = pseudorandom_element(scored_indexes, pseudoseed('j_envy'))
                        local random_unscored = i
                        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                            copy_card(context.full_hand[random_scored], context.full_hand[random_unscored])
                            context.full_hand[random_unscored]:flip()
                            play_sound('timpani', percent, 0.6)
                            context.full_hand[random_unscored]:juice_up(0.3, 0.3)
                            context.full_hand[random_unscored]:flip()
                            return true end 
                        }))
                        G.E_MANAGER:add_event(Event({trigger = 'before',delay = 1, func = function() 
                            card_eval_status_text(context.full_hand[random_scored], 'extra', nil, nil, nil, {message = 'No?', colour = G.C.MULT, card = context.full_hand[random_scored], instant = true})
                            card_eval_status_text(context.full_hand[random_unscored], 'extra', nil, nil, nil, {message = 'NO!', colour = G.C.MULT, card = context.full_hand[random_unscored], instant = true})
                            card:juice_up()
                            return true end
                        }))
                    end
                end
            end
        end
    end
}