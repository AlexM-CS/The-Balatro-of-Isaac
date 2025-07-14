SMODS.Joker:take_ownership("bloodstone",
    {
        -- Stops crashes from probability-based cards
        name = "tboi-Bloodstone",
        config = {
            extra = {
                odds = 2,
                Xmult = 1.5
            }
        },

        loc_vars = function(self, info_queue, card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "bloodstone")
            return {
                vars = {
                    numerator,
                    denominator,
                    card.ability.extra.Xmult
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and
                SMODS.pseudorandom_probability(card, "bloodstone", 1, card.ability.extra.odds) then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end,
    },
    true
)