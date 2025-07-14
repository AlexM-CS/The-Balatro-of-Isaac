SMODS.Consumable {
    key = "perthro",
    set = "Rune",
    loc_txt = {
        name = "Perthro",
        text = {
            "Reroll every {C:attention}Joker",
            "into a different joker",
            "of the same rarity",
            "{s:0.8}{C:inactive}\"Change\""
        }
    },
    config = {
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_runes",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}