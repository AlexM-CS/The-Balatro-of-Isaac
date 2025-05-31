SMODS.Consumable {
    key = "r_devil",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Devil?",
        text = {
            "Destroy a random card in your hand",
            "Add a {C:money}Gold Seal{} to",
            "another random card in your hand",
            "{s:0.8}{C:inactive}\"Bask in the light",
            "{s:0.8}{C:inactive}of your mercy\""
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