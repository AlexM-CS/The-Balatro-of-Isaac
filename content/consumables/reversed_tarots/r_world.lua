SMODS.Consumable {
    key = "r_world",
    set = "tboi_reversed",
    loc_txt = {
        name = "The World?",
        text = {
            "Destroy all {C:Spades}Spades",
            "cards in your hand",
            "{s:0.8}{C:inactive}\"Step into the abyss\""
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