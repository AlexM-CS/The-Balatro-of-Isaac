SMODS.Consumable {
    key = "r_star",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Star?",
        text = {
            "Destroy all {C:Diamonds}Diamonds",
            "cards in your hand",
            "{s:0.8}{C:inactive}\"May your loss bring fortune\""
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