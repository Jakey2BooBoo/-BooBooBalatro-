SMODS.Consumable {
    key = 'branch',
    set = 'Spectral',
    atlas = 'consumables',
    pos = {x = 1, y = 0},
    config = {extra = {amount = 1}},
    cost = 4,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bb_stained_green
        info_queue[#info_queue+1] = G.P_CENTERS.m_bb_stained_red
        info_queue[#info_queue+1] = G.P_CENTERS.m_bb_stained_blue
        info_queue[#info_queue+1] = G.P_CENTERS.m_bb_stained_gold
        return {
            vars =
            {
                
            },
        }
    end,
    can_use = function(self, card)
        if #G.hand.cards > 0 then
            return true
        else
            return false
        end
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                upgrade_cards = {}
                
                for i = 1+math.floor(#G.hand.cards/4), math.ceil(3*#G.hand.cards/4) do
                    upgrade_cards[#upgrade_cards+1] = G.hand.cards[i]
                end
                
                for _, c in ipairs(upgrade_cards) do
                    local enhancement = 'none'
                    local suit_count = 0
                    
                    if c:is_suit('Diamonds') then
                        enhancement = 'm_bb_stained_gold'
                        suit_count = suit_count + 1
                    end
                    if c:is_suit('Clubs') then
                        enhancement = 'm_bb_stained_blue'
                        suit_count = suit_count + 1
                    end
                    if c:is_suit('Hearts') then
                        enhancement = 'm_bb_stained_red'
                        suit_count = suit_count + 1
                    end
                    if c:is_suit('Spades') then
                        enhancement = 'm_bb_stained_green'
                        suit_count = suit_count + 1
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            c:flip()
                            if suit_count == 1 then
                                c:set_ability(enhancement)
                            elseif suit_count == 4 then
                                c:set_ability('m_bb_wild_glass')
                            end
                            c:flip()
                            return true
                        end
                    }))
                end
                return true
            end
        }))
    end
}

