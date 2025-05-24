SMODS.Back{
    key = 'cathedral',
    atlas = 'enhancers',
    pos = {x = 1, y = 2},
	config = {ante_scaling = 2, vouchers = {}, consumables = {}},
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.hands, self.config.discards}}
    end,
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, c in ipairs(G.playing_cards) do
                    if not SMODS.has_enhancement(c,'m_bb_wild_glass') then
                        if c:is_suit('Diamonds') then
                            c:set_ability('m_bb_stained_gold')
                        elseif c:is_suit('Clubs') then
                            c:set_ability('m_bb_stained_blue')
                        elseif c:is_suit('Hearts') then
                            c:set_ability('m_bb_stained_red')
                        elseif c:is_suit('Spades') then
                            c:set_ability('m_bb_stained_green')
                        end
                    end
                end
                return true
            end
        }))
        local extra_cards = {
            {s='D',r='2',e='m_bb_wild_glass',},
            {s='C',r='3',e='m_bb_wild_glass',},
            {s='H',r='4',e='m_bb_wild_glass',},
            {s='S',r='5',e='m_bb_wild_glass',},
            {s='D',r='6',e='m_bb_wild_glass',},
            {s='C',r='7',e='m_bb_wild_glass',},
            {s='H',r='8',e='m_bb_wild_glass',},
            {s='S',r='9',e='m_bb_wild_glass',},
            {s='D',r='T',e='m_bb_wild_glass',},
            {s='C',r='J',e='m_bb_wild_glass',},
            {s='H',r='Q',e='m_bb_wild_glass',},
            {s='S',r='K',e='m_bb_wild_glass',},
        }
        G.GAME.starting_params.extra_cards = extra_cards
    end
}