SMODS.Consumable {
    key = "r_fool",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Fool?",
        text = {
            "Creates the last",
            "{set.primary_colour}Reversed Tarot{} card",
            "used during this run,",
            "{s:0.8}{C:inactive}\"Let go and move on\""
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