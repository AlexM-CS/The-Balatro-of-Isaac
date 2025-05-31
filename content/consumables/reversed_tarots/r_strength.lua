SMODS.Consumable {
    key = "r_strength",
    set = "tboi_reversed",
    loc_txt = {
        name = "Strength?",
        text = {
            "Lowers the rank of up",
            "to {C:attention}#1#{} selected cards by 1",
            "{s:0.8}{C:inactive}\"May you break their resolve\""
        }
    },
    config = {
        extra = {
            max = 2
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.max
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}