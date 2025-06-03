SMODS.Consumable {
    key = "algiz",
    set = "tboi_runes",
    loc_txt = {
        name = "Algiz",
        text = {
            "Disable the next {C:attention}#2#{}",
            "{C:attention}Boss Blinds",
            "{s:0.8}{C:inactive}\"Resistance\""
        }
    },
    config = {
        extra = {
            disable = 2
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_runes",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.disable
            }
        }
    end,

    use = function(self, card, area, copier)
        
    end,

    can_use = function(self, card)
        return true
    end
}