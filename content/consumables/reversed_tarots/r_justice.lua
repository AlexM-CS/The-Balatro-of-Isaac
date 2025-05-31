SMODS.Consumable {
    key = "r_justice",
    set = "tboi_reversed",
    loc_txt = {
        name = "Justice?",
        text = {
            "Adds a random {C:attention}Glass Card",
            "to your deck",
            "{s:0.8}{C:inactive}\"May your sins come back to torment you\""
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