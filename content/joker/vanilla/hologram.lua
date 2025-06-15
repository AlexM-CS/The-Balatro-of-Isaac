SMODS.Joker:take_ownership("hologram",
    {
        config = {
            extra = {
                Xmult_gain = 0.25,
                Xmult = 1
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.Xmult_gain,
                    card.ability.extra.Xmult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.playing_card_added and not context.blueprint then
                card.ability.extra.Xmult = card.ability.extra.Xmult + #context.cards * card.ability.extra.Xmult_gain
                return {
                    message = localize ({
                        type = "variable",
                        key = "a_xmult",
                        vars = { card.ability.extra.Xmult }
                    }),
                }
            end
            if context.joker_main then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end,
    },
    true
)