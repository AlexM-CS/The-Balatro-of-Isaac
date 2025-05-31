SMODS.Consumable {
    key = "r_sun",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Sun?",
        text = {
            "Destroy all {C:Hearts}Hearts",
            "cards in your hand",
            "{s:0.8}{C:inactive}\"May the darkness swallow",
            "{s:0.8}{C:inactive}all around you\""
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

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