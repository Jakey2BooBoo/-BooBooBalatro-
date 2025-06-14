SMODS.Consumable {
    key = 'void',
    set = 'Spectral',
    atlas = 'consumables',
    enhancement_gate = 'm_glass',
    pos = {x = 0, y = 0},
    config = {extra = {amount = 1, selected = 1}},
    cost = 4,
    in_pool = function(self, args)
        available = false
        for _, c in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(c, 'm_glass') then
                available = true
            elseif SMODS.has_enhancement(c, 'm_stone') then
                available = true
            end
        end
        return available
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        return {
            vars =
            {
                
            },
        }
    end,
    can_use = function(self, card)
        local able = true
        if #G.hand.highlighted >= 1 and #G.hand.highlighted <= 4 then
            for _, c in ipairs(G.hand.highlighted) do
                if not (SMODS.has_enhancement(c, 'm_glass') or SMODS.has_enhancement(c, 'm_stone')) then
                    able = false
                end
            end
        else
            able = false
        end
        return able
    end,
    use = function(self, card, area, copier)
        local glass_upgrades = {'m_bb_stained_red','m_bb_stained_gold','m_bb_stained_green','m_bb_stained_blue'}
        local stone_upgrades = {'m_bb_kintsugi','m_bb_geode'}
        for _, c in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(c, 'm_glass') then
                G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.3, func = function()
                    c:set_ability(pseudorandom_element(glass_upgrades,pseudorandom('c_void')))
                    c:juice_up()
                    play_sound('tarot1')
                    return true end
                }))
            elseif SMODS.has_enhancement(c, 'm_stone') then
                G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.3, func = function()
                    c:set_ability(pseudorandom_element(stone_upgrades,pseudorandom('c_void')))
                    c:juice_up()
                    play_sound('tarot1')
                    return true end
                }))
            end
        end
    end
}