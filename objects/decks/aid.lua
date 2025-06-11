SMODS.Back{
    key = 'aid',
    atlas = 'enhancers',
    pos = {x = 2, y = 2},
	config = {},
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    apply = function(self,back)
        --add_tag(Tag('tag_charm'))
    end,
    calculate = function(self, back, context)
        --if context.end_of_round and context.game_over ~= nil then
        --    G.E_MANAGER:add_event(Event({
        --        func = (function()
        --            add_tag(Tag('tag_charm'))
        --            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
        --            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
        --            return true
        --        end)
        --    }))
        --end
    end
}