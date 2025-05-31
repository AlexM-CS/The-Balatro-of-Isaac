SMODS.Consumable {
    key = "r_death",
    set = "tboi_reversed",
    loc_txt = {
        name = "Death?",
        text = {
            "Creates a copy of",
            "a selected card in your hand",
            "{s:0.8}{C:inactive}\"May life spring forth",
            "{s:0.8}{C:inactive}from the fallen\""
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