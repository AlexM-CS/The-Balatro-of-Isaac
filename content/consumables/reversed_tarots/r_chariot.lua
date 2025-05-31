SMODS.Consumable {
    key = "r_chariot",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Chariot?",
        text = {
            "Add a random {C:attention}Steel Card",
            "to your hand",
            "{s:0.8}{C:inactive}\"May nothing walk past you\""
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