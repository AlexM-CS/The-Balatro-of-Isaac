SMODS.Joker:take_ownership("red_card",
    {
        config = {
            extra = {
                mult_gain = 3,
                mult = 0
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult_gain,
                    card.ability.extra.mult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.skipping_booster and not context.blueprint then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = localize({
                        type = "variable",
                        key = "a_mult",
                        vars = { card.ability.extra.mult_gain }
                    }),
                    colour = G.C.RED,
                }
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    },
    true
)