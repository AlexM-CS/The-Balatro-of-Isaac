SMODS.Consumable {
    key = "r_moon",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Moon?",
        text = {
            "Destroy all {C:Clubs}Clubs",
            "cards in your hand",
            "{s:0.8}{C:inactive}\"May you remember lost memories\""
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