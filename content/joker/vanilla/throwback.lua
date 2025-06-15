SMODS.Joker:take_ownership("throwback",
    {
        name = "tboi-Throwback",
        config = {
            extra = {
                Xmult = 0.25
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.Xmult,
                    1 + G.GAME.skips * card.ability.extra.Xmult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.skip_blind and not context.blueprint then
                return {
                    message = localize({
                        type = "variable",
                        key = "a_xmult",
                        vars = { 1 + G.GAME.skips * card.ability.extra.Xmult }
                    })
                }
            end
            if context.joker_main then
                return {
                    Xmult = 1 + G.GAME.skips * card.ability.extra.Xmult
                }
            end
        end
    },
    true
)