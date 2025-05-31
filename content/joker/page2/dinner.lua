SMODS.Joker {
    key = "dinner",
    loc_txt = {
        name = "Dinner",
        text = {
            "Placeholder"
        }
    },
    config = {
    },
    rarity = 1,
    pos = { x = 1, y = 3 },
    atlas = "tboi_jokers",
    cost = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end
}