SMODS.Consumable {
    key = "dagaz",
    set = "Rune",
    loc_txt = {
        name = "Dagaz",
        text = {
            "Gain {C:blue}+#1#{} discards",
            "this round",
            "{s:0.8}{C:inactive}\"Purity\""
        }
    },
    config = {
        extra = {
            d_size = 3
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_runes",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.d_size
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}