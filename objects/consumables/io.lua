SMODS.Consumable {
    key = 'io',
    set = 'Planet',
    loc_txt = {
        name = 'Io',
        text = {
            "Test"
        },
    },
    atlas = 'consumables',
    pos = {x = 0, y = 1},
    config = {
        hand_type = 'bb_f_flush_four',
        softlock = true
    },
    cost = 4,
    loc_vars = function(self, info_queue, center)
        return {
            vars =
            {

            },
        }
    end,
    in_pool = function(self, args)
        return false
    end,
}
