SMODS.Consumable {
    key = "ehwaz",
    set = "tboi_runes",
    loc_txt = {
        name = "Ehwaz",
        text = {
            "Use inside the {C:attention}shop",
            "to go to {C:attention}Ante 8",
            "and gain {C:money}$#1#{}",
            "{s:0.8}{C:inactive}\"Passage\""
        }
    },
    config = {
        extra = {
            money = 75
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

    end
}