SMODS.Joker:take_ownership("jolly",
    {
        config = {
            extra = {
                t_mult = 8,
                type = "Pair"
            },
        },

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.t_mult, localize(card.ability.extra.type, "poker_hands")
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
                return {
                    mult = card.ability.extra.t_mult
                }
            end
        end
    },
    true
)