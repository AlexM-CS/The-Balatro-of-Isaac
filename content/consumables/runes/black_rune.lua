SMODS.Consumable {
    key = "black_rune",
    set = "tboi_runes",
    loc_txt = {
        name = "Black Rune",
        text = {
            "Destroy all {V:1}Spades{} and {V:2}Clubs{},",
            "upgrade every {C:tarot}poker hand{} by {C:attention}#1#",
            "{s:0.8}{C:inactive}\"Void\""
        }
    },
    config = {
        extra = {
            levels = 2
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_runes",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.levels,
                colours = {
                    G.C.SUITS["Spades"],
                    G.C.SUITS["Clubs"]
                }
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}