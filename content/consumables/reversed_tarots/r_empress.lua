SMODS.Consumable {
    key = "r_empress",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Empress?",
        text = {
            "Enhances #1# random cards",
            "to {C:red}Mult{} cards",
            "{s:0.8}{C:inactive}\"May your love bring protection\""
        }
    },
    config = {
        extra = {
            enhance = 3
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.enhance
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}