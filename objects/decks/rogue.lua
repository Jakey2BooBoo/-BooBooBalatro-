SMODS.Back{
    key = 'rogue',
    atlas = 'enhancers',
    pos = {x = 3, y = 2},
	config = {},
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    apply = function(self, back)
        G.GAME.starting_params.reroll_cost = 10
    end,
    calculate = function(self, back, context)
        if context.end_of_round and context.game_over ~= nil then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_standard'))
                    add_tag(Tag('tag_meteor'))
                    add_tag(Tag('tag_charm'))
                    add_tag(Tag('tag_buffoon'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
        end
    end
}