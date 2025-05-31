SMODS.Consumable {
    key = "r_judgement",
    set = "tboi_reversed",
    loc_txt = {
        name = "Judgement?",
        text = {
            "Sell a random {C:attention}Joker",
            "for {X:money,C:white}X#1#{} its sell value",
            "{s:0.8}{C:inactive}\"May you redeem those found wanting\""
        }
    },
    config = {
        extra = {
            multiplier = 3
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.multiplier
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}