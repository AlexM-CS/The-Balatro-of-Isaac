SMODS.Consumable {
    key = "r_magician",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Magician?",
        text = {
            "Remove {C:attention}Enhancements",
            "from #1# selected cards",
            "gain {C:money}$#2#",
            "{s:0.8}{C:inactive}\"May no harm come to you\""
        }
    },
    config = {
        extra = {
            cards = 2,
            money = 5
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cards,
                card.ability.extra.money
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}