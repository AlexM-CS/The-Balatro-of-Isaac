SMODS.Consumable {
    key = "r_high_priestess",
    set = "tboi_reversed",
    loc_txt = {
        name = "The High Priestess?",
        text = {
            "Create a random",
            "{C:attention}Negative{} {C:planet}Planet{} Card",
            "{s:0.8}{C:inactive}\"Run\""
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