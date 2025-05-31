SMODS.Consumable {
    key = "r_tower",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Tower?",
        text = {
            "Enhances every card in",
            "your hand to a {C:blue}Stone Card",
            "{s:0.8}{C:inactive}\"Creation brings destruction\""
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