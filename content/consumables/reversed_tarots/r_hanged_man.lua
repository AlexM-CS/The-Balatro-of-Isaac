SMODS.Consumable {
    key = "r_hanged_man",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Hanged Man?",
        text = {
            "Destroy #1# random",
            "cards in hand",
            "{s:0.8}{C:inactive}\"May your greed know no bounds\""
        }
    },
    config = {
        extra = {
            destroy = 3
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.destroy
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}