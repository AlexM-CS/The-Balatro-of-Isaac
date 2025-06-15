SMODS.Joker:take_ownership("bloodstone",
    {
        config = {
            extra = {
                odds = 2,
                Xmult = 1.5
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    G.GAME.probabilities.normal or 1,
                    card.ability.extra.odds,
                    card.ability.extra.Xmult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and
                pseudorandom("bloodstone") < G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)