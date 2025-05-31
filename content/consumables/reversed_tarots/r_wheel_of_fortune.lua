SMODS.Consumable {
    key = "r_wheel_of_fortune",
    set = "tboi_reversed",
    loc_txt = {
        name = "Wheel of Fortune?",
        text = {
            "{C:green}#1# in #2#{} chance to",
            "add {C:blue}Foil{}, {C:attention}Holographic{}, or",
            "{C:red}Polychrome{} to a random card in hand",
            "{s:0.8}{C:inactive}\"Throw the dice of fate\""
        }
    },
    config = {
        extra = {
            odds = 4
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}