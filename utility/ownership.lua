SMODS.Consumable:take_ownership('justice',
    {
    loc_txt = {
        name =
            "Justice",
        text={
            "Enhances {C:attention}#1#{} selected",
            "Non-{C:attention}#2#{} into a",
            "{C:attention}#2#{} or {C:dark_edition}stains{}",
            "{C:attention}#1#{} selected {C:attention}#2#"
        },
    },
    config = {mod_conv = 'm_glass', max_highlighted = 1},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = {
                card.ability.max_highlighted,
                G.P_CENTERS[card.ability.mod_conv].name,
            },
        }
    end,
    can_use = function(self, card)
        if #G.hand.highlighted == 1 then
            return true
        else
            return false
        end
    end,
    use = function(self, card, area, copier)
        local glass_upgrades = {'m_bb_stained_red','m_bb_stained_gold','m_bb_stained_green','m_bb_stained_blue'}
        for _, c in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(c, 'm_glass') then
                G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.3, func = function()
                    c:set_ability(pseudorandom_element(glass_upgrades,pseudorandom('c_justice')))
                    c:juice_up()
                    play_sound('tarot1')
                    return true end
                }))
            elseif SMODS.has_enhancement(c, 'm_wild') then
                G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.3, func = function()
                    c:set_ability('m_bb_wild_glass')
                    c:juice_up()
                    play_sound('tarot1')
                    return true end
                }))
            else
                G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.3, func = function()
                    c:set_ability('m_glass')
                    c:juice_up()
                    play_sound('tarot1')
                    return true end
                }))
            end
        end
    end
    },
    true
)

SMODS.Consumable:take_ownership('tower',
    {
    loc_txt = {
        name= "The Tower",
        text={
            "Enhances {C:attention}#1#{} selected",
            "Non-{C:attention}#2#{} into a",
            "{C:attention}#2#{} or {C:dark_edition}upgrades{}",
            "{C:attention}#1#{} selected {C:attention}#2#"
        },
    },
    config = {mod_conv = 'm_stone', max_highlighted = 1},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = {
                card.ability.max_highlighted,
                G.P_CENTERS[card.ability.mod_conv].name,
            },
        }
    end,
    can_use = function(self, card)
        if #G.hand.highlighted == 1 then
            return true
        else
            return false
        end
    end,
    use = function(self, card, area, copier)
        local stone_upgrades = {'m_bb_kintsugi','m_bb_geode','m_bb_deposit'}
        for _, c in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(c, 'm_stone') then
                G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.3, func = function()
                    c:set_ability(pseudorandom_element(stone_upgrades,pseudorandom('c_tower')))
                    c:juice_up()
                    play_sound('tarot1')
                    return true end
                }))
            else
                G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.3, func = function()
                    c:set_ability('m_stone')
                    c:juice_up()
                    play_sound('tarot1')
                    return true end
                }))
            end
        end
    end
    },
    true
)

SMODS.Consumable:take_ownership('lovers',
    {
    loc_txt = {
        name= "Lovers",
        text={
            "Enhances {C:attention}#1#{} selected",
            "card into a",
            "{C:attention}#2#",
        },
    },
    config = {mod_conv = 'm_wild', max_highlighted = 1},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = {
                card.ability.max_highlighted,
                G.P_CENTERS[card.ability.mod_conv].name,
            },
        }
    end,
    can_use = function(self, card)
        if #G.hand.highlighted == 1 then
            return true
        else
            return false
        end
    end,
    use = function(self, card, area, copier)
        for _, c in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(c, 'm_glass') then
                G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.3, func = function()
                    c:set_ability('m_bb_wild_glass')
                    c:juice_up()
                    play_sound('tarot1')
                    return true end
                }))
            else
                G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.3, func = function()
                    c:set_ability('m_wild')
                    c:juice_up()
                    play_sound('tarot1')
                    return true end
                }))
            end
        end
    end
    },
    true
)