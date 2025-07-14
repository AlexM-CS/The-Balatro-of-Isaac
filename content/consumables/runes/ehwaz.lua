SMODS.Consumable {
    key = "ehwaz",
    set = "Rune",
    loc_txt = {
        name = "Ehwaz",
        text = {
            "{C:attention}-#1#{} Ante",
            "Gain {C:money}$#1#{}",
            "{s:0.8}{C:inactive}\"Passage\""
        }
    },
    config = {
        extra = {
            money = 25
        },
        special = {
            add = 1
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_runes",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.special.add,
                card.ability.extra.money
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}