SMODS.Joker:take_ownership("duo",
    {
        config = {
            extra = {
                Xmult = 2,
                type = "Pair"
            }
        },

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.Xmult,
                    localize(card.ability.extra.type, "poker_hands")
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)