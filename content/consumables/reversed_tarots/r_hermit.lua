SMODS.Consumable {
    key = "r_hermit",
    set = "Reversed_Tarot",
    config = {
        extra = {
            dollars = 15
        }
    },
    pos = { x = 4, y = 1 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    use = function(self, card, area, copier)
        ease_dollars(card.ability.extra.dollars)
    end,

    can_use = function(self, card)
        return true
    end
}