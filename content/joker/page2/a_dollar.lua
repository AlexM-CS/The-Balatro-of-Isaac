SMODS.Joker {
    key = "a_dollar",
    loc_txt = {
        name = "A Dollar",
        text = {
            "Sells for {C:money}$100{}",
            "{s:0.8}{C:inactive}\"$$$\""
        }
    },
    config = {
        extra_value = 96
    },
    rarity = 3,
    pos = { x = 17, y = 2 },
    atlas = "tboi_jokers",
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    add_to_deck = function(self, card)
        card:set_cost()
    end
}