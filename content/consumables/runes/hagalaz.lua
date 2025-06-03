SMODS.Consumable {
    key = "hagalaz",
    set = "tboi_runes",
    loc_txt = {
        name = "Hagalaz",
        text = {
            "Destroy all {C:attention}Jokers{}, cards ",
            "in hand, and {C:attention}consumables{},",
            "gain {C:money}$#1#{}",
            "{s:0.8}{C:inactive}\"Destruction\""
        }
    },
    config = {
        extra = {
            money = 50
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_runes",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money
            }
        }
    end,

    use = function(self, card, area, copier)
        
    end,

    can_use = function(self, card)
        return G.hand
    end
}