SMODS.Tag {
    key = 'common',
    config = {type = 'store_joker_create'},
    atlas = 'tags',
    pos = { x = 0, y = 0 },
    in_pool = function() return false end,
    apply = function(self, tag, context)
        if context.type == tag.config.type then
            local common_card = create_card('Joker', context.area, nil, 0, nil, nil, nil, 'uta')
            create_shop_card_ui(common_card, 'Joker', context.area)
            common_card.states.visible = false
            tag:yep('+', G.C.BLUE,function() 
                common_card:start_materialize()
                common_card.ability.couponed = true
                common_card:set_cost()
                return true
            end)
            tag.triggered = true
            return common_card
        end
    end
}