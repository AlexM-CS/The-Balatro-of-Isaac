SMODS.Joker:take_ownership("yorick",
    {
        config = {
            extra = {
                Xmult = 1,
                Xmult_gain = 1,
                discards = 23,
                discards_remaining = 23
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.Xmult_gain,
                    card.ability.extra.discards,
                    card.ability.extra.discards_remaining,
                    card.ability.extra.Xmult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.discard and not context.blueprint then
                if card.ability.extra.discards_remaining <= 1 then
                    card.ability.extra.discards_remaining = card.ability.extra.discards
                    card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                    return {
                        message = localize({
                            type = "variable",
                            key = "a_xmult",
                            vars = { card.ability.extra.Xmult }
                        }),
                        colour = G.C.RED
                    }
                else
                    return {
                        func = function()
                            card.ability.extra.discards_remaining = card.ability.extra.discards_remaining - 1
                        end
                    }
                end
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)