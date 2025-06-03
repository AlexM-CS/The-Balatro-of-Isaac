SMODS.Consumable {
    key = "jera",
    set = "tboi_runes",
    loc_txt = {
        name = "Jera",
        text = {
            "Creates a {C:dark_edition}Negative{} copy of",
            "every {C:attention}Joker{} and {C:attention}consumable",
            "{s:0.8}{C:inactive}\"Abundance\""
        }
    },
    config = {
        extra = {
            duplicate = 1
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_runes",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    use = function(self, card, area, copier)
        
    end,

    can_use = function(self, card)
        return true
    end
}